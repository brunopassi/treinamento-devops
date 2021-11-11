provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia_bruno" {
  source = "git@github.com:brunopassi/tf-modulo.git"
  nome = "ec2-bruno-tf-xx"
}
