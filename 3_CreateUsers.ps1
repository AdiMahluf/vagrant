$username = "vagrant@contoso.local"
$password = "vagrant"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

Start-Process powershell.exe -Credential $credential -ArgumentList "-Command", "Import-Csv c:\vagrant\3000users.csv | ForEach-Object {
    New-ADUser -Name `$_.DisplayName -DisplayName `$_.DisplayName -SamAccountName `$_.SamAccountName -UserPrincipalName `$_.UserPrincipalName -Department `$_.Department -Path `$_.Path -GivenName `$_.GivenName -Surname `$_.Surname -Title `$_.Title -City `$_.City -Company `$_.Company -Country `$_.Country -AccountPassword (ConvertTo-SecureString '1234qwer!@#$' -AsPlainText -Force) -Enabled `$true
}"
