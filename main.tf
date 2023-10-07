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


module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version     = var.content_version
  assets_path         = var.assets_path
}


resource "terratowns_home" "german_town" {
  name            = "How survive in German"
  description     = <<DESCRIPTION
Moving to Germany means getting the chance to live in one of the most organized 
and progressive countries on Earth, where you can enjoy a high standard of living.
DESCRIPTION
  domain_name     = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz.cloudfront.net"
  town            = "missingo"
  content_version = 1
}

/*
resource "terratowns_home" "german_town" {
  name            = "How survive in German"
  description     = <<DESCRIPTION
Moving to Germany means getting the chance to live in one of the most organized 
and progressive countries on Earth, where you can enjoy a high standard of living.
DESCRIPTION
  domain_name     = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz.cloudfront.net"
  town            = "missingo"
  content_version = 1
}
*/