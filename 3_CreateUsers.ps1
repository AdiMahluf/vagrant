#Create Users
Import-csv .\3000users.csv | New-ADUser -AccountPassword (ConvertTo-SecureString '1234qwer!@#$' -AsPlainText -Force) -Enabled $true