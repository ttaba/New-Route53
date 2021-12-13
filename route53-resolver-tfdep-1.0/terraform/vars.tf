# VPC Variables

variable "name" {
  description = "Deployment name"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
}

# Outbound Variables

variable "outbound_endpoint_name" {
  description = ""
  type        = string
}

variable "outbound_endpoint_allowed_resolvers" {
  description = ""
  type        = list(string)
}


# Inbound Variables

variable "inbound_endpoint_name" {
  description = ""
  type        = string
}

variable "inbound_endpoint_allowed_resolvers" {
  description = ""
  type        = list(string)
}

# Outbound Rule Variables

variable "forward_domains" {
  description = ""
  type        = list(string)
}

variable "forward_ips" {
  description = ""
  type        = list(string)
}

variable "resource_share_accounts" {
  description = ""
  type        = list(string)
}

variable "vpc_id" {
  description = "The id of the vpc"

}
variable "subnetsAndIps" {
  type = list(map(any))
  
}