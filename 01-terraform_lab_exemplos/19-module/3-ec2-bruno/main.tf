provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia_bruno" {
  source = "https://github.com/brunopassi/treinamento-devops/blob/b5396387dd7bcaf5acdf448cf53b6b93895d4665/01-terraform_lab_exemplos/19-module/3-ec2-bruno/instancia/main.tf"
  nome = "Um nome"
}
