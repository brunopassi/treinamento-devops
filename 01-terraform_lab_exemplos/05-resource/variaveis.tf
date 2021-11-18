variable "subnet" {
  type        = string
  description = "O subnet id para ser usado no servidor."

  validation {
    condition     = substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O nome do subnet não é válido, tem que começar com \"subnet-id\"."
  }
}

#variable "sg" {
#  type        = string
#  description = "O securiy group para ser usado no servidor."

#  validation {
#    condition     = substr(var.sg, 0, 3) == "sg-"
#    error_message = "O nome do sg não é válido, tem que começar com \"sg-\"."
#  }
#}

variable "ami" {
  type        = string
  description = "O ami para ser usado no servidor."

  validation {
    condition     = substr(var.ami, 0, 4) == "ami-"
    error_message = "O nome do ami não é válido, tem que começar com \"ami-\"."
  }
}

variable "type" {
  type        = string
  description = "O instance type para ser usado no servidor."

  validation {
    condition     = substr(var.type, 0, 3) == "t2."
    error_message = "O nome do instance type não é válido, tem que começar com \"t2.\"."
  }
}

#output "image_id" {
#    value = var.image_id
#}