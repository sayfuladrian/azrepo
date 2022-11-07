$msg = 'DETACH OLD VNIC'
Write-Output `n "==================================================================" 
Write-Output    "Started: " + $msg 
Write-Output    "==================================================================" `n

$lc = 'eus-'
$rg = $lc + 'rg'
$post = 'a'
$os = 'ws10'
$nic = 'vnic' + $os + $post
$vm = 'vm' + $os + $post

$nic = Get-AzNetworkInterface -Name $nic -ResourceGroupName $rg
$vm = Get-AzVm -Name $vm -ResourceGroupName $rg
$nicid = $nic.id
Remove-AzVMNetworkInterface -VM $vm -NetworkInterfaceID $nicid | Update-AzVm -ResourceGroupName $rg

Write-Output `n "==================================================================" 
Write-Output    "Completed: " + $msg
Write-Output    "==================================================================" `n