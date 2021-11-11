resource "aws_vpc" "bruno02_vpc" {
  cidr_block = "192.168.50.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "TerraformVPCPublicSubnet"
  }
}

resource "aws_subnet" "bruno_tf_sub1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.50.10/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "bruno_tf_sub1a"
  }
}
resource "aws_subnet" "bruno_tf_sub1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.50.20/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "bruno_tf_sub1c"
  }
}
resource "aws_subnet" "bruno_tf_sub2a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.50.30/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "bruno_tf_sub2a"
  }
}
resource "aws_subnet" "bruno_tf_sub2c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.50.40/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "bruno_tf_sub2c"
  }
}

resource "aws_internet_gateway" "gw_tf_bruno" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "gw_tf_bruno"
  }
}

resource "aws_route_table" "rt_tf_bruno_1a" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gw.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_tf_bruno_1a"
  }
}

resource "aws_route_table_association" "1a" {
  subnet_id      = aws_subnet.my_subnet.bruno_tf_sub1a
  route_table_id = aws_route_table.rt_terraform.rt_tf_bruno_1a
}

resource "aws_route_table" "rt_tf_bruno_1c" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gw.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_tf_bruno_1c"
  }
}

resource "aws_route_table_association" "1c" {
  subnet_id      = aws_subnet.my_subnet.bruno_tf_sub1c
  route_table_id = aws_route_table.rt_terraform.rt_tf_bruno_1c
}

resource "aws_route_table" "rt_tf_bruno_2a" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gw.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_tf_bruno_2a"
  }
}

resource "aws_route_table_association" "2a" {
  subnet_id      = aws_subnet.my_subnet.bruno_tf_sub2a
  route_table_id = aws_route_table.rt_terraform.rt_tf_bruno_2a
}
resource "aws_route_table" "rt_tf_bruno_2c" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt_tf_bruno_2c"
  }
}

resource "aws_route_table_association" "2c" {
  subnet_id      = aws_subnet.my_subnet.bruno_tf_sub2c
  route_table_id = aws_route_table.rt_terraform.rt_tf_bruno_2c
}


# resource "aws_network_interface" "my_subnet" {
#   subnet_id           = aws_subnet.my_subnet.id
#   private_ips         = ["172.17.10.100"] # IP definido para instancia
#   # security_groups = ["${aws_security_group.allow_ssh1.id}"]

#   tags = {
#     Name = "primary_network_interface my_subnet"
#   }
# }