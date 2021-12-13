# VPC Variables

name= "resolver-vpc"

aws_region= "us-east-1"

cidr_block= "10.0.0.0/16"

availability_zones=["us-east-1a","us-east-1b"]

# Outbound Variables

outbound_endpoint_name= "outbound_resolver_endpoint"

outbound_endpoint_allowed_resolvers= [""]


# Inbound Variables

inbound_endpoint_name= "inbound_resolver_endpoint"

inbound_endpoint_allowed_resolvers= [""]

# Outbound Rule Variables

forward_domains= [""]

forward_ips= ["", ""]

resource_share_accounts= ["", ""]
