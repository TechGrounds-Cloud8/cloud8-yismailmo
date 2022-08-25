# Project architecture:


Build the Infrastructure as Code app using Bicep for the following architecture(this is my architecture).

![project_architecturev1.0](../../00_includes/projectV1.1infrastructre%20draw.jpg)

Small  incrementally changes has to be added to the application when bulding it and always have a commit / branch to fall back on with a working version of my application.


# Services needed for V1.0:

- Resource group
- 2 vnet (peered with 2 subnets)
- Vnet peering
- storage account
- key vault
-  2 vm
    - windows os for management/admin
    - Linux os for webserver
- Network Interface card
- Network Security group(NSGs)


# Services needed for V1.1:
- Resource Group
- vnets and subnets
- vnet peerings
- NSGs
- Key-vault
- VMSS (web-app server)
- VM (management server)
- Recovery service vault
- storage account 
- Azure Load Balancer
- Health Probe

 