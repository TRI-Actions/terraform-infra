module "sharedservices" {
  source = "./modules/371027173325"

  providers = {
    aws = aws.sharedservices
  }
}

provider "aws" {
  alias  = "sharedservices"
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::371027173325:role/GithubActionsCrossAccountRole"
    session_name = "jenkins"
  }
}