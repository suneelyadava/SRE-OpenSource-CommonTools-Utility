<############################################
    .DESCRIPTION
        Creation of Microsoft Storage Account in any tenant.
    .NOTES  
        Additional details available at Create-SA-Containers.md
    .OUTPUTS
        Provision Storage Acconut and containers
############################################>
$storageaccountname='demo1-xxxxx'
$rgname='demo-1xxxxxxx'
$subid='yoursubid'
$location='westus'
$skuname='Standard_LRS_update_this_based_on-yourneed'
Connect-AzAccount
Set-AzContext -SubscriptionId $subid
$data = @(
    'demo1'
    'demo2'
    'demo3' 
    'dghgdj'
    'uwuiueee'
    'kdkldklkdkd'
    'ksjdjkjdkjsdkjds'
)

New-AzStorageAccount -ResourceGroupName $rgname `
    -Name $storageaccountname `
    -Location $location `
    -SkuName $skuname
# Retrieve the Context from the Storage Account
# Create a context object using Azure AD credentials
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $rgname -Name $storageaccountname).Value[0]

$ctx = New-AzStorageContext -StorageAccountName $storageaccountname -StorageAccountKey $storageAccountKey

for ($i=0; $i -le $data.Count-1; $i++)
{
    New-AzStorageContainer -Name (-join($data[$i])) ` -Context $ctx ` -Permission Off
}