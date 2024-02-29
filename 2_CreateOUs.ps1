#Create OUs
Set-Location c:\vagrant
$users = Import-Csv -Path .\3000users.csv

foreach ($user in $users) {
    # Check if the OU exists
    $ou = $user.Department
    if ($ou -like $null) {
    return}
    $ouExists = Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ou'" -ErrorAction SilentlyContinue
    if (-not $ouExists) {
        # Create the OU if it does not exist
        New-ADOrganizationalUnit -Name $ou -ProtectedFromAccidentalDeletion $false -ErrorAction SilentlyContinue
    }
}