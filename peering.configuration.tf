# module "peering1" {
#   source               = "aztfm/virtual-network-peering/azurerm"
#   version              = ">=1.0.0"
#   resource_group_name  = "cimbt-lz-connectivity-nonprod-southeastasia"
#   virtual_network_name = "cimbt-lz-hub-nonprod-southeastasia"
#   peerings = [
#     {
#       name                      = "cimbt-lz-ctdp-dev-nonprod-southeastasia"
#       remote_virtual_network_id = "/subscriptions/f55248a4-c17a-4212-b404-77b844e6a624/resourceGroups/dummy-rg/providers/Microsoft.Network/virtualNetworks/cimbt-lz-ctdp-dev-nonprod-southeastasia"
#       allow_gateway_transit     = true
#     }
#   ]
# }

# module "peering2" {
#   source               = "aztfm/virtual-network-peering/azurerm"
#   version              = ">=1.0.0"
#   resource_group_name  = "dummy-rg"
#   virtual_network_name = "cimbt-lz-ctdp-dev-nonprod-southeastasia"
#   peerings = [
#     {
#       name                      = "cimbt-lz-hub-nonprod-southeastasia"
#       remote_virtual_network_id = "/subscriptions/f55248a4-c17a-4212-b404-77b844e6a624/resourceGroups/cimbt-lz-connectivity-nonprod-southeastasia/providers/Microsoft.Network/virtualNetworks/cimbt-lz-hub-nonprod-southeastasia"
#       use_remote_gateways       = true
#     }
#   ]
# }