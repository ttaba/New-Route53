## This project is used for creating Route 53 resolver endpoints
It creates Route 53 Resolver endpoints in a Virtual Private Cloud (VPC) that is used for DNS management.

The appropriate Route 53 resolver rules are created in the same AWS account where Resolver endpoints are present. The Route 53 resolver rules are shared via AWS Resource Access Manager (RAM) with other AWS accounts (spoke accounts). 
VPCs in spoke accounts are then associated with the Route 53 resolver rules

This solution does the following:
Resolves bids on-premises private domains from workloads running in Bids Trading VPCs in AWS.

## Assumptions:

Network connectivity between the DNS-VPC and the on-premises is in place. Connectivity is by way of DIRECT CONNECT.
VPC attribute enableDNShostnames is set to true.
If your workload performs 10,000 DNS queries per second or above to a Resolver endpoint IP, 
create additional endpoint ENIs to scale your Queries Per Second (QPS)

## Testing for resolution.
create an ec2 instance in your vpc, connect to instance and try resolving from on-prem dns. See example below
 
$ dig +short 'name of the domain you want to query'