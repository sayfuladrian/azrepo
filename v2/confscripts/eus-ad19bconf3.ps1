Write-Output `n "======================================================================================" 
Write-Output    "==================================  Promote VMAD01  ==================================" 
Write-Output    "======================================================================================" `n
 
Write-Output    "=================================== Skip this first =================================="

#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#Install-Module ADDSDeployment

Write-Output    "========================= If these failed, include above ============================="

Import-Module ADDSDeployment
$passAd = ConvertTo-SecureString "Jakarta@2022" -AsPlainText -Force
Install-ADDSDomain `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$false `
-DatabasePath "C:\AD\DBNTDS" `
-DomainMode "WinThreshold" `
-DomainType "TreeDomain" `
-InstallDns:$true `
-LogPath "C:\AD\LOGNTDS" `
-NewDomainName "pavilico.xyz" `
-NewDomainNetbiosName "av" `
-ParentDomainName "minilico.xyz" `
-NoRebootOnCompletion:$false `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\AD\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword $passAd