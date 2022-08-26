#1. Go to the folder
cd.. templates

#2. Sign-in to your Azure-account.

Connect-AzAccount

AzLogin

#3. Set Standard-Subscription for all Azure PowerShell commands you want to run  

$context = Get-AzSubscription -SubscriptionName 'Adminname here'
Set-AzContext $context

#4. Get your Subscription-id and Tenant-id

Get-AzSubscription

#5. Deploy your ResourceGroup

New-AzResourceGroup -Name IsmailAzProject -Location "Westeurope"

Then deploy all the modules 1 by 1 or:

#6. Deploy your Bicep Template to Azure 
New-AzResourceGroupDeployment -TemplateFile main.bicep

#7. Check your deployment via Azure Portal or via command in powershell: 
Get-AzResourceGroupDeployment -ResourceGroupName [your ResourceGroup Name] | Format-Table

#8. Delete  the resourceGroup by:

az group delete --name V1AzProject  



