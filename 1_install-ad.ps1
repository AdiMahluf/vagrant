Set-ExecutionPolicy Bypass -Scope Process -Force
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment
$securePassword = ConvertTo-SecureString '1234qwer!@#$' -AsPlainText -Force
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath 'C:\Windows\NTDS' -DomainMode 'WinThreshold' -DomainName 'contoso.local' -DomainNetbiosName 'contoso' -ForestMode 'WinThreshold' -InstallDns:$true -LogPath 'C:\Windows\NTDS' -NoRebootOnCompletion:$false -SysvolPath 'C:\Windows\SYSVOL' -Force:$true -safeModeAdministratorPassword $securePassword