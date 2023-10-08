terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "DavidTausend"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}


module "home_germany_hosting" {
  source              = "./modules/terrahome_aws"
  user_uuid           = var.teacherseat_user_uuid
  public_path         = var.germany.public_path
  content_version     = var.germany.content_version
}


resource "terratowns_home" "german_town" {
  name            = "How survive in German"
  description     = <<DESCRIPTION
Moving to Germany means getting the chance to live in one of the most organized 
and progressive countries on Earth, where you can enjoy a high standard of living.
DESCRIPTION
  domain_name     = module.home_germany_hosting.domain_name
  #domain_name = "3fdq3gz.cloudfront.net"
  town            = "missingo"
  content_version = var.germany.content_version
}

/*
module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Making your Payday Bar"
  description = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could my own Paydays bars,
and if they are most cost effective.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "missingo"
  content_version = var.payday.content_version
}
*/