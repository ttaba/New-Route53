# VPC Variables
vpc_id = "vpc-0d1f3e18dc55f75bd"
subnetsAndIps = [ 
      { "subnet_id" : "subnet-031b6ad80e099c4fa",
      "ip" : "172.31.64.0"

    },
    { "subnet_id" : "subnet-0b417ecbd709ae8e8",
      "ip" : "172.31.48.0"
    }

 ]
name= "resolver-vpc"

aws_region= "us-east-1"

cidr_block= "10.0.0.0/16"

availability_zones=["us-east-1a","us-east-1b"]

# Outbound Variables

outbound_endpoint_name= "outbound_resolver_endpoint"

outbound_endpoint_allowed_resolvers= ["172.31.0.0/32"]


# Inbound Variables

inbound_endpoint_name= "inbound_resolver_endpoint"

inbound_endpoint_allowed_resolvers= ["172.31.0.0/32"]

# Outbound Rule Variables

forward_domains= ["example.com"]

forward_ips= ["192.168.2.0", "192.168.2.9"]

resource_share_accounts= ["arn:aws:iam::012345678901:root", "arn:aws:iam::012345678904:root"]
