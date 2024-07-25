# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Declare the Terraform Module for Cloud Adoption Framework
# Enterprise-scale and provide a base configuration.

terraform {
  cloud {
    organization = "example-org-3a8cb7"

    workspaces {
      name = "cimbt-azlz-caf"
    }
  }
}

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~> 3.1.2"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  # Base module configuration settings.
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
  default_location = local.default_location

  library_path = "${path.root}/lib"

  # Control deployment of the core landing zone hierachy.
  deploy_core_landing_zones   = true
  deploy_corp_landing_zones   = local.deploy_corp_landing_zones
  deploy_online_landing_zones = local.deploy_online_landing_zones
  deploy_sap_landing_zones    = local.deploy_sap_landing_zones

  # Configuration settings for management resources.
  # These are used to ensure Azure Policy is correctly configured with the same 
  # settings as the resources deployed by module.enterprise_scale_management.
  # # Please refer to file: settings.management.tf
  deploy_management_resources    = true
  configure_management_resources = local.configure_management_resources
  subscription_id_management     = data.azurerm_client_config.management.subscription_id

  # Configuration settings for connectivity resources.
  # Uses default settings.
  deploy_connectivity_resources    = true
  subscription_id_connectivity     = data.azurerm_client_config.connectivity.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources

  # Configuration settings for identity resources.
  # Uses default settings.
  deploy_identity_resources    = true
  subscription_id_identity     = "b19705a6-ed1b-4194-8217-92b230681622"
  configure_identity_resources = local.configure_identity_resources

  #subscription_id_identity  = data.azurerm_client_config.core.subscription_id

  #   custom_landing_zones = {
  #     "${var.root_id}-landing-zones" = {
  #       display_name               = "${upper(var.root_id)} Landing Zones"
  #       parent_management_group_id = "${var.root_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id = "customer_online"
  #         parameters = {
  #           # Deny-Resource-Locations = {
  #           #   listOfAllowedLocations = ["southeastasia", ]
  #           # }
  #           # Deny-RSG-Locations = {
  #           #   listOfAllowedLocations = ["southeastasia", ]
  #           # }
  #         }
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-th-prod" = {
  #       display_name               = "${upper(var.root_id)} TH Prod"
  #       parent_management_group_id = "${var.root_id}-landing-zones"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id = "customer_online"
  #         parameters = {
  #           # Deny-Resource-Locations = {
  #           #   listOfAllowedLocations = ["southeastasia", ]
  #           # }
  #           # Deny-RSG-Locations = {
  #           #   listOfAllowedLocations = ["southeastasia", ]
  #           # }
  #         }
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-th-nonprod" = {
  #       display_name               = "${upper(var.root_id)} TH Nonprod"
  #       parent_management_group_id = "${var.root_id}-landing-zones"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id = "customer_online"
  #         parameters = {
  #           Deny-Resource-Locations = {
  #             listOfAllowedLocations = ["southeastasia", ]
  #           }
  #           Deny-RSG-Locations = {
  #             listOfAllowedLocations = ["southeastasia", ]
  #           }
  #         }
  #         access_control = {}
  #       }
  #     }
  #   }
}
