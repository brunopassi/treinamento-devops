provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia_bruno" {
  source = "./instancia"
  nome = "Um nome"
}
