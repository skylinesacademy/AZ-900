# Resource Group
$rg = "SL-Network"
$location = "North Central US"

#VNet Name and Address Space

$VNETName = "SL-VNET-PShell"
$VNETAddressSpace = "10.0.0.0/22"

#Subnet Names and Address Space

$subnetAName = "SL-Web"
$subnetAAddressPrefix = "10.0.0.0/24"
$subnetBName = "SL-App"
$subnetBAddressPrefix = "10.0.1.0/24"
$subnetCName = "SL-Data"
$subnetCAddressPrefix = "10.0.2.0/24"

#Create Subnet A
$subnets = New-AzVirtualNetworkSubnetConfig -Name $subnetAName -AddressPrefix $subnetAAddressPrefix

#Create VNet and include subnet configuration 
$vnet = New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $rg -Location $location -AddressPrefix $VNETAddressSpace -Subnet $subnets

#Add Additional Subnets 
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressPrefix
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetCName -AddressPrefix $subnetCAddressPrefix

#Save the additional subnet configurations
Set-AzVirtualNetwork -VirtualNetwork $vnet