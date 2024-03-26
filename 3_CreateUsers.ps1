$username = "contoso\vagrant"
$password = "vagrant"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $securePassword)
Invoke-Command -Credential $credential -ScriptBlock {
#Create Users
Import-csv c:\vagrant\3000users.csv | New-ADUser -AccountPassword (ConvertTo-SecureString '1234qwer!@#$' -AsPlainText -Force) -Enabled $true
}