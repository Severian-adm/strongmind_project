# Interactive prompt
$GroupName = Read-Host "Enter the group name"
$GroupDescription = Read-Host "Enter a description for the group"

# Creates security group
New-ADGroup -Name $GroupName -GroupScope Global -GroupCategory Security -Description $GroupDescription -Path "OU=Groups,DC=strongmind,DC=local"

Write-Host "AD security group '$GroupName' has been created."