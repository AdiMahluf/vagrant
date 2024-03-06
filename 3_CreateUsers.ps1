#Create Users
Import-csv c:\vagrant\3000users.csv | New-ADUser -AccountPassword (ConvertTo-SecureString '1234qwer!@#$' -AsPlainText -Force) -Enabled $true