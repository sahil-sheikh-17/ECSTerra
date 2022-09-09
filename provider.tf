terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key              = "AKIATGP"
  secret_key              = "/CONRm6flyY31ycXytTX"  
  profile                 = "default"
  region                  = "us-east-1"
}
