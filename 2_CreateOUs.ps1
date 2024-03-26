$username = "vagrant@contoso.local"
$password = "vagrant"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

Start-Process powershell.exe -Credential $credential -ArgumentList "-Command", " `$users = Import-Csv -Path 'c:\vagrant\3000users.csv'; foreach (`$user in `$users) { `$ou = `$user.Department; if (`$ou -like `$null) { return }; `$ouExists = Get-ADOrganizationalUnit -Filter 'DistinguishedName -like `$ou' -ErrorAction SilentlyContinue; if (`$ouExists -eq `$null) { New-ADOrganizationalUnit -Name `$ou -ProtectedFromAccidentalDeletion `$false -ErrorAction SilentlyContinue } }`""


