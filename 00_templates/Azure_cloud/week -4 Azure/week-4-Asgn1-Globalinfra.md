# Azure Global Infrastructure

Everything in the cloud, from servers to networking, is virtualized. As a customer of a cloud provider, you don't have to worry about the underlying physical infrastructure. However, the physical location of your application or data can be important.


The global infrastructure of Azure consists of the following components:

- Regions:

Is a set of datacenters, deployed within a latency-defined perimeter (low latency/delay to end user) and connected through a dedicated regional low-latency network.

![azureregion](../../00_includes/wk4-Azure%20regions01.png)

With more global regions than any other cloud provider, Azure gives customers the flexibility to deploy applications where they need. An Azure region has discrete pricing and service availability.




- Availability Zones: 

Are physically and logically separated datacenters with their own independent power source, network, and cooling. 

Connected with an extremely low-latency network, they become a building block to delivering high availability applications. 

Availability zones (AZ) ensure that if there's an event impacting a datacenter site—for example, if someone cuts the power, or there are issues with cooling—your data will be protected.

AZ falls under a regions.

- Region Pairs

Is a relationship between 2 Azure Regions within the same geographic region for disaster recovery purposes. If one of the regions were to experience a disaster or failure, then the services in that region will automatically failover to that regions secondary region in the pair. 



#### Why choose a region above another region?

- Feature availability;

Not all services are available in every region, so you will need to choose the region with the desired service.  

- Data Sovereignty; e.g some data can only reside in EU.

- Storage availability;

Understanding Azure regions and geographies becomes important when you consider the available storage replication options. Depending on the storage type, you have different replication options.

- Storage costs;

Prices vary depending on the storage type and availability that you select.

- Latency to end users; proximity to the end user

### Challenges overcame:

Not much because i was familiar with most of the terms.

# Sources

https://docs.microsoft.com/en-us/azure/virtual-machines/regions

https://docs.microsoft.com/en-us/azure/virtual-machines/regions#what-are-azure-regions

https://docs.microsoft.com/en-us/azure/availability-zones/az-overview?context=%2Fazure%2Fvirtual-machines%2Fcontext%2Fcontext
