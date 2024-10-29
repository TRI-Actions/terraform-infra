module "sharedservices-dev" {
  source = "./modules/272711359350"

  providers = {
    aws = aws.sharedservices-dev
  }
}

provider "aws" {
  alias  = "sharedservices-dev"
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::272711359350:role/GithubActionsCrossAccountRole"
    session_name = "jenkins"
  }
}