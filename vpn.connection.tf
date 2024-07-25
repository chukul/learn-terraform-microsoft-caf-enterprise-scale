#Connections#1
# Create a local network gateway for the on-premises network
# resource "azurerm_local_network_gateway" "on_premises" {
#   name                = "cimbt-lz-lgw-nonprod-southeastasia"
#   location            = var.default_location
#   gateway_address     = "13.251.18.185"
#   address_space       = ["192.168.0.0/16"]
#   resource_group_name = "cimbt-lz-connectivity-nonprod-southeastasia"
#   tags                = var.connectivity_resources_tags

# }

# # Create the site-to-site VPN connection
# resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
#   name                       = "con-lgw-nonprod-sea-to-vpngw-nonprod-sea"
#   location                   = var.default_location
#   resource_group_name        = "cimbt-lz-connectivity-nonprod-southeastasia"
#   type                       = "IPsec"
#   virtual_network_gateway_id = "/subscriptions/f55248a4-c17a-4212-b404-77b844e6a624/resourceGroups/cimbt-lz-connectivity-nonprod-southeastasia/providers/Microsoft.Network/virtualNetworkGateways/cimbt-lz-vpngw-nonprod-southeastasia"
#   local_network_gateway_id   = azurerm_local_network_gateway.on_premises.id
#   # ipsec_policy {
#   #   dh_group         = "DHGroup2"
#   #   ike_encryption   = "AES256"
#   #   ike_integrity    = "SHA256"
#   #   ipsec_encryption = "DES3"
#   #   ipsec_integrity  = "SHA256"
#   #   pfs_group        = "None"
#   #   sa_lifetime      = "28800"
#   #   sa_datasize      = "65535"
#   # }
#   shared_key = "3FCAXII7CForEruaLGniFrM31ke43iDI"
#   tags       = var.connectivity_resources_tags

# }

# Connections#2
# Create a local network gateway for the on-premises network
# resource "azurerm_local_network_gateway" "on_premises_02" {
#   name                = "cimbt-lz-lgw-nonprod-southeastasia-02"
#   location            = var.default_location
#   gateway_address     = "18.136.237.224"
#   address_space       = ["192.168.0.0/16"]
#   resource_group_name = "cimbt-lz-connectivity-nonprod-southeastasia"
#   tags                = var.connectivity_resources_tags

# }

# # Create the site-to-site VPN connection
# resource "azurerm_virtual_network_gateway_connection" "vpn_connection_02" {
#   name                       = "con-lgw-nonprod-sea-to-vpngw-nonprod-sea-02"
#   location                   = var.default_location
#   resource_group_name        = "cimbt-lz-connectivity-nonprod-southeastasia"
#   type                       = "IPsec"
#   virtual_network_gateway_id = "/subscriptions/f55248a4-c17a-4212-b404-77b844e6a624/resourceGroups/cimbt-lz-connectivity-nonprod-southeastasia/providers/Microsoft.Network/virtualNetworkGateways/cimbt-lz-vpngw-nonprod-southeastasia"
#   local_network_gateway_id   = azurerm_local_network_gateway.on_premises_02.id
#   # ipsec_policy {
#   #   dh_group         = "DHGroup2"
#   #   ike_encryption   = "AES256"
#   #   ike_integrity    = "SHA256"
#   #   ipsec_encryption = "DES3"
#   #   ipsec_integrity  = "SHA256"
#   #   pfs_group        = "None"
#   #   sa_lifetime      = "28800"
#   #   sa_datasize      = "65535"
#   # }
#   shared_key = "UgNiHdWGlfy9FwEyt0.GLno0XwZnpn87"
#   tags       = var.connectivity_resources_tags

# }


# Connections#3 to CIMBT-DR Site
# Create a local network gateway for the on-premises network
resource "azurerm_local_network_gateway" "on_premises_dr" {
  name                = "cimbt-lz-lgw-nonprod-sea-01"
  location            = var.default_location
  gateway_address     = "58.137.204.45"
  address_space       = ["10.10.30.0/24", "10.13.85.184/29", "10.12.247.0/24", "10.12.227.0/24", "10.10.217.0/24"]
  resource_group_name = "cimbt-lz-connectivity-nonprod-southeastasia"
  tags                = var.connectivity_resources_tags

}

# Create the site-to-site VPN connection for CIMBT-DR Site
resource "azurerm_virtual_network_gateway_connection" "vpn_connection_dr" {
  name                       = "con-lgw-nonprod-sea-01-to-vpngw-nonprod-sea-01"
  location                   = var.default_location
  resource_group_name        = "cimbt-lz-connectivity-nonprod-southeastasia"
  type                       = "IPsec"
  virtual_network_gateway_id = "/subscriptions/f55248a4-c17a-4212-b404-77b844e6a624/resourceGroups/cimbt-lz-connectivity-nonprod-southeastasia/providers/Microsoft.Network/virtualNetworkGateways/cimbt-lz-vpngw-nonprod-southeastasia"
  local_network_gateway_id   = azurerm_local_network_gateway.on_premises_dr.id
  ipsec_policy {
    dh_group         = "DHGroup2"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "DES3"
    ipsec_integrity  = "SHA256"
    pfs_group        = "None"
    sa_lifetime      = "28800"
    sa_datasize      = "65535"
  }
  shared_key = "3Fe45sifTkesfQW"
  tags       = var.connectivity_resources_tags

}