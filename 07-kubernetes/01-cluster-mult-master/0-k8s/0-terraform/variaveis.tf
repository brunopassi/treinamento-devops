variable "subneta" {
  type        = string
  description = "O subnet id para ser usado no servidor."

  validation {
    condition     = substr(var.subneta, 0, 7) == "subnet-"
    error_message = "O nome do subnet não é válido, tem que começar com \"subnet-id\"."
  }
}

variable "subnetc" {
  type        = string
  description = "O subnet id para ser usado no servidor."

  validation {
    condition     = substr(var.subnetc, 0, 7) == "subnet-"
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

variable "typem" {
  type        = string
  description = "O instance type para ser usado no servidor."

  validation {
    condition     = substr(var.typem, 0, 3) == "t3."
    error_message = "O nome do instance type não é válido, tem que começar com \"t3.\"."
  }
}

variable "typew" {
  type        = string
  description = "O instance type para ser usado no servidor."

  validation {
    condition     = substr(var.typew, 0, 3) == "t2."
    error_message = "O nome do instance type não é válido, tem que começar com \"t2.\"."
  }
}

variable "ip_haproxy" {
  type = string
  default = "187.3.223.136"
  description = "Passe aqui o IP do haproxy"
}

#output "image_id" {
#    value = var.image_id
#}