# Azure Storage Account

To store data in Azure you need an Azure Storage Account. 

A Storage Account contains all Azure Storage data objects such as blobs, files, disks and tables.

Data in a Storage Account is secure, highly available, durable and massively scalable. 

All data in a Storage Account is accessible via the internet with HTTP and HTTPS. Because it is easy to access, you have to be careful that only the correct identities have permissions to access the data.

Azure Storage explorer is a free GUI to manage your data in Azure. So I downloadeed it

Many IaaS and PaaS services from Azure also use Azure Storage Accounts.


# Assignment:
#### Create an Azure Storage Account. Make sure that only you have access to the data.

![storageacc](../../00_includes/StorContname-1.png)

So here below i changed the access level to private.



![strgacconly](../../00_includes/Storagcontchngacc-001.png)

Then this was the results where i was the only one who had access to the photo.

![katfoto](../../00_includes/StoragecontKatfoto-01.png)

#### Place data in a storage service of your choice via the console (for example a cat photo in Blob storage).

![katfotopublic](../../00_includes/storagecontKatfoto-02.png)


#### Retrieve the data to your own computer using the Azure Storage Explorer.

![Azurestorageexpl](../../00_includes/StorageAzure-explo.png)


# Challenges overcame

connecting with Azure storage explorer and changing the li (in permissions) rights in order to generate the SAS token and url.

# Sources

https://docs.microsoft.com/nl-nl/azure/storage/common/storage-account-create?tabs=azure-portal

https://docs.microsoft.com/nl-nl/azure/vs-azure-tools-storage-manage-with-storage-explorer?tabs=windows