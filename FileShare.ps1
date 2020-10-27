## Enter the input data on first 3 lines
## Enter Storage Account name e.g. azure15
## Enter share Name e.g. assets
## Enter folder share e.g. invoice

$storageAccountName = "<Storage Account Name>"
$shareName = "<Share Name>"
$folderName = "<Folder Name>"

# Get the storage account key and context
$storageAccountKey = (Get-AzureStorageKey -StorageAccountName $storageAccountName).Primary
$ctx = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey



# create a share

$s = New-AzureStorageShare -Name $shareName -Context $ctx



# create a new folder in the share

New-AzureStorageDirectory -Share $s -Path $folderName



# Find the folder where this script is saved
$thisfolder = Split-Path -parent $MyInvocation.MyCommand.Definition

# The local source subfolder
$sourcefolder = "$thisfolder\$folderName"



#Upload each file in the local subfolder to the folder in the share
$files = Get-ChildItem $sourcefolder
foreach($file in $files){
  $fileName = "$sourcefolder\$file"
  Set-AzureStorageFileContent -Share $s -Source $fileName -Path $folderName
}


