Create File Share &amp; upload Files on Azure
=============================================

            
This Script was created to** create File Share & upload file on Azure
**


Simply edit the PS1 file based on the comments in the file to match your environment


Be sure to take note of the comments in the PS1 file to insert your input according to your environment.



PowerShell
Edit|Remove
powershell
## Enter the input data on first 3 lines
## Enter Storage Account name e.g. azure15
## Enter share Name e.g. assets
## Enter folder share e.g. invoice

$storageAccountName = '<Storage Account Name>'
$shareName = '<Share Name>'
$folderName = '<Folder Name>'

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
$sourcefolder = '$thisfolder\$folderName'



#Upload each file in the local subfolder to the folder in the share
$files = Get-ChildItem $sourcefolder
foreach($file in $files){
  $fileName = '$sourcefolder\$file'
  Set-AzureStorageFileContent -Share $s -Source $fileName -Path $folderName
}




## Enter the input data on first 3 lines 
## Enter Storage Account name e.g. azure15 
## Enter share Name e.g. assets 
## Enter folder share e.g. invoice 
 
$storageAccountName = '<Storage Account Name>' 
$shareName = '<Share Name>' 
$folderName = '<Folder Name>' 
 
# Get the storage account key and context 
$storageAccountKey = (Get-AzureStorageKey -StorageAccountName $storageAccountName).Primary 
$ctx = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey 
 
 
 
# create a share 
 
$s = New-AzureStorageShare -Name $shareName -Context $ctx 
 
 
 
# create a new folder in the share 
 
New-AzureStorageDirectory -Share $s -Path $folderName 
 
 
 
# Find the folder where this script is saved 
$thisfolder = Split-Path -parent $MyInvocation.MyCommand.Definition 
 
# The local source subfolder 
$sourcefolder = '$thisfolder\$folderName' 
 
 
 
#Upload each file in the local subfolder to the folder in the share 
$files = Get-ChildItem $sourcefolder 
foreach($file in $files){ 
  $fileName = '$sourcefolder\$file' 
  Set-AzureStorageFileContent -Share $s -Source $fileName -Path $folderName 
} 
 
 





You can use this script in following steps:    



  *  Download the script. 
  *  Open it using PowerShell 
  *  Edit on top of the script file, and then enter storage account name, folder name & share name.

  *  Save the file and then run the script on the computer.


    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
