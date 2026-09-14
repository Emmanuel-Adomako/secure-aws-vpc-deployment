# Secure AWS VPC Deployment

## Overview
A Terraform module designed to provision a highly available and secure foundational AWS Virtual Private Cloud (VPC). 
This infrastructure separates public-facing assets from internal backend systems to enforce strict network isolation.

## Architecture
* **VPC:** Custom 10.0.0.0/16 network.
* **Public Subnet:** Designed for load balancers and NAT gateways.
* **Private Subnet:** Isolated tier for database clusters and internal application servers with no direct internet ingress.

## Deployment Instructions
1. Clone the repository.
2. Initialize Terraform: `terraform init`
3. Preview the infrastructure plan: `terraform plan`
4. Deploy the resources: `terraform apply`

## Security Considerations
* **Network Isolation:** Resources in the private subnet are completely inaccessible from the public internet.
* **Tagging Compliance:** All resources are strictly tagged for cost-allocation and environment tracking.
