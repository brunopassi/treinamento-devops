# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "web" {
#   ami           = "ami-09e67e426f25ce0d7"
#   instance_type = "t2.micro"
#   subnet_id              = "subnet-eddcdzz4"
#   # availability_zones = ["us-east-1"] # configurando zona para criar maquinas
#   tags = {
#     Name = "Minha Maquina Simples EC2"
#   }
#   volume_id = aws_ebs_volume.itau_volume_encrypted.id
# }


# resource "aws_ebs_volume" "itau_volume_encrypted" {
#   size      = 8
#   encrypted = true
#   tags      = {
#     Name = "Volume itaú"
#   }
# }



##### Caso Itaú #####
# aws configure # maquina pessoal
# nas do itaú colocar as variáveis de ambiente no bashrc
# https://docs.aws.amazon.com/sdkref/latest/guide/environment-variables.html
# configurar via environment variable
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_DEFAULT_REGION=""

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "web" {
#   ami = "ami-09e67e426f25ce0d7"
#   instance_type = "t3.micro"
#   subnet_id = "subnet-05880ea9006199004"
  
#   tags = {
#     Name = "MinhaPrimeiraMaquina-Carol  "
#   }
# }

# resource "aws_ebs_volume" "itau_volume_encrypted" {
#   size      = 8
#   encrypted = true
#   availability_zone = "us-east-1a"
#   tags      = {
#     Name = "Volume itaú"
#   }
# }

# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.itau_volume_encrypted.id
#   instance_id = aws_instance.web.id
# }

# Gamaacademythree-sbx - # passago a chave pelo pessoal de segurança itaú
# export AWS_ACCESS_KEY_ID="3232323232"
# export AWS_SECRET_ACCESS_KEY="34433444sssdd3+ssa/dd434343"

# //////

# ///////// bruno passianotto
provider "aws" {
  region = "sa-east-1"
}

resource "aws_key_pair" "chave_key" {
  key_name   = "chave-bruno-tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVbL6G/f//kpMZ8Fc8zaQ8GbittYD1JnLt6crjpdc6C8TtC2AzAp4TukCK1j1+No+Fnj9YPXVQyGNgIWGb4X08GiTt8Uj9iWXb8xg+ksPV8cemVOF5uib2e30m560IpST0OVn7R8ck/nOfOmWsoRgBdu9qSle4tgK/0kbg5je/keXrqtw8yY4i5YKwBo+Cbvh8io79HPegfUAZtEJ8JLjsJ34Jp0fqpqLJYWPyZLjzyrSqMAyWMW4qXzEydkOpQrar9VZ8FYuE92f68xUNLhMh1QGcTTG3IV4AUxM8GkpjpiSUeaR4548fvVDEKIajxvvZGyHLi1E9bfDnPyDhfKBejaxGwp2NIS3aFHC8fPQcFuG8VvcmEmAb2JMXr1JYXJr7POWHtJHmyNqR/D2v+y9ZlHs0qHwxFe1yPzUTS239yn9WT+mOA8l9qeQV+w2s7ND4VJ4dENPB5CAQSix9YbiJbKGioOeL6IzKBVbetgNJj6Mn2N8N2MxPC8J9ZASYYu8= ubuntu@ip-10-50-10-119"
}


resource "aws_instance" "web" {
#  count = 5
#  subnet_id     = "subnet-0ca605505ccbe9a15"
  subnet_id = var.subnet
#  ami = "ami-038dd9dbfff5a5ca5"
   ami = var.ami
#  instance_type = "t2.micro"
 instance_type = var.type
  associate_public_ip_address = true
 # vpc_security_group_ids = ["sg-038286d06a069a3a7"]
 vpc_security_group_ids = [var.sg]
 #vpc_security_group_ids = ["${aws_security_group.sg05-bruno.id}"]

  #key_name = "chavecurso-bruno"
  key_name = aws_key_pair.chave_key.key_name
  #key_name = "chave-bruno-tf"
  root_block_device {
    encrypted = true
    volume_size = 40
  }
  tags = {
    Name = "ec2b-bruno-tf-tester2"
  }
}

output "subnet" {
#    value = [var.subnet,aws_instance.web.public_dns,aws_instance.web.key_name,aws_instance.web.vpc.vpc_id]
    value = [var.subnet,aws_instance.web.public_dns,aws_instance.web.key_name]
}
#output "instance_public_dns" {
#  value = [aws_instance.web.public_dns]
#  description = "Mostra os dns publicos da maquina criada."
#}
# /////