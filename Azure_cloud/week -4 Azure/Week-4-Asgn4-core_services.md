# Azure Core Services

This contains the services that you need to know in a little more detail. This document also describes how to deal with the other services that you may encounter in the (practice) exam.

There are many services in Azure, but some are more important than others. 

Azure lists the following architectural components and services that you should know in-depth about what they do:


- Regions and Region Pairs
Regions are set of datacenters, deployed in a geographical area connected via a special regional network with low latency.

Region pairs is the relationship between 2 Azure Regions within the same geographic region for disaster recovery purposes.

- Availability Zones;

Two or more physically and logically separated datacenters with their own independent power source, network, and cooling. AZ are inside a region.

- Resource Groups;

Is the logical grouping of related resources for simplifying managing and provisioning of resources(like VM, virtual networks) by using Azure resource manager.

- Subscriptions;

An agreement with Microsoft to use one or more Microsoft cloud platforms or services, where one is charged based on either a per-user license fee or on cloud-based resource consumption.

- Management Groups;

Helps an organization/company organize resources and subscriptions, by efficiently managing access, policies, and compliance for the Azure subscriptions.

- Azure Resource Manager;

Managing and provisioning resources declaratively using JavaScript Object Notation (JSON) documents in logical grouping. 

- Virtual Machines;

A virtual environment that functions as a virtual computer system with its own CPU, memory, network interface, and storage, created on a physical hardware system (located off- or on-premises).

- Azure App Services;
Is a fully managed platform for building web applications.

- Azure Container Instances (ACI);

'Container' is an environment set up within an operating system in which one or more applications may be run, typically assigned only those resources necessary for the application to function correctly.

For e.g. a 'container image' is an unchangeable, static file that includes executable code so it can run an isolated process on information technology (IT) infrastructure.

ACI is a managed service that allows you to run containers directly on the Microsoft Azure public cloud, without requiring the use of virtual machines (VMs).


- Azure Kubernetes Service (AKS);

**Kubernetes**, or k8s, is an open source platform that automates Linux container operations. It eliminates many of the manual processes involved in deploying and scaling containerized applications.

**AKS** offers serverless (the user does not have to set up servers (virtual or bare metal) and does not have to worry about maintenance, upgrades, or backups)
Kubernetes, an integrated continuous integration and continuous delivery (CI/CD) experience and enterprise-grade security and governance.

- Azure Virtual Desktop;

desktop and app virtualization service that runs on the cloud.

- Virtual Networks;

Computer Networks setup in the cloud.

- VPN Gateway;

Sends encrypted traffic between an Azure virtual network and an on-premises location over the public Internet.

- Virtual Network Peering;

Is to seamlessly (appear as one) connect two or more Virtual Networks in Azure. 

- ExpressRoute;

Is to create private connections between Azure datacenters and infrastructure on premises or in a co-location environment. 

- Container (Blob) Storage;

lets developers store unstructured data(data that doesn't adhere to a particular data model or definition, such as text or binary data) in Microsoft's cloud platform. 


- Disk Storage;

Is the only shared cloud block storage(to store data files on cloud-based storage) environments.  that supports both Windows and Linux-based clustered(high-availability applications) via Azure shared disks. 

- File Storage;

Managed file shares for cloud or on-premises deployments.

- Storage Tiers;

Is to organize your data based on how frequently it will be accessed and how long it will be retained. With following tiers;
- Hot tier - An online tier optimized for storing data that is accessed or modified frequently. The Hot tier has the highest storage costs, but the lowest access costs.

- Cool tier - An online tier optimized for storing data that is infrequently accessed or modified. Data in the Cool tier should be stored for a minimum of 30 days. The Cool tier has lower storage costs and higher access costs compared to the Hot tier.

- Archive tier - An offline tier optimized for storing data that is rarely accessed, and that has flexible latency requirements, on the order of hours. Data in the Archive tier should be stored for a minimum of 180 days.

- Cosmos DB;

Is a fully managed NoSQL database for modern app development. Single-digit millisecond response times, and automatic and instant scalability, guarantee speed at any scale.

- Azure SQL Database;

Is a fully managed PaaS database engine that handles most of the database management functions such as upgrading, patching, backups, and monitoring without user involvement. 


- Azure Database for MySQL;

Microsoft automates the management and maintenance of your infrastructure and database server, including routine updates, backups and security.

- Azure Database for PostgreSQL;

Is a relational database service based on the open-source Postgres database engine. It's a fully managed database-as-a-service.

- SQL Managed Instance;

A scalable cloud database service that combines the broadest SQL Server database engine compatibility with all the benefits of a fully managed and evergreen platform as a service. 

- Azure Marketplace;

Is an online store that offers applications and services either built on or designed to integrate with Microsoft's Azure public cloud.

Of course, there are many more services that may come up on the exam. For these services it is enough to be familiar with the product page (see an example of an Azure product page here)



In addition to the services, you can also expect questions about various cloud concepts, such as High Availability, the consumption-based pricing model and the shared responsibility model.



# Exercise:
Learn Skills Measured document for Microsoft Azure Fundamentals (AZ-900_)

https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE3VwUY

### Challenges overcame

Not much just alot of reading.

# Sources



https://www.otava.com/reference/how-to-use-azure-resource-groups-a-simple-explanation/

https://docs.microsoft.com/en-us/azure/governance/management-groups/overview

https://cloudacademy.com/course/getting-started-with-azure-virtual-machines-988/what-is-a-virtual-machine/

https://azure.microsoft.com/en-us/services/app-service/

https://enterprisersproject.com/article/2017/10/how-explain-kubernetes-plain-english

https://docs.microsoft.com/en-us/azure/virtual-desktop/overview

https://docs.microsoft.com/en-us/azure/vpn-gateway/

https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

https://azure.microsoft.com/en-us/services/expressroute/#overview

https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction

https://www.purestorage.com/products/cloud-block-storage/cbs.html

https://azure.microsoft.com/en-in/services/storage/disks/

https://docs.microsoft.com/en-us/azure/storage/common/storage-introduction

https://docs.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview


https://docs.microsoft.com/en-us/azure/azure-sql/database/sql-database-paas-overview?view=azuresql

https://azure.microsoft.com/en-in/services/mysql/#overview

https://docs.microsoft.com/en-us/azure/postgresql/

https://docs.microsoft.com/en-us/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql

https://azure.microsoft.com/en-us/marketplace/