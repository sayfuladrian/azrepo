$rg = 'eus-rg'
$vm = 'eus-vmws10a'

$check = Get-AzVM -Name $vm -ErrorAction SilentlyContinue

if($check -eq $null){

	New-AzResourceGroupDeployment `
	  -Name remoteTemplateDeployment `
	  -ResourceGroupName $rg `
	  -TemplateUri "https://raw.githubusercontent.com/sayfuladrian/azrepo/main/templates/vm-pip-nodisk.json" `
	  -TemplateParameterUri "https://raw.githubusercontent.com/sayfuladrian/azrepo/main/parameters/eus-vmws10a.json"
	  
}

else{

    Write-Host "$vm already exist"

}