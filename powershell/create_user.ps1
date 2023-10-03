# Interactive prompt
$FirstName = Read-Host "Enter the first name"
$LastName = Read-Host "Enter the last name"
$Username = Read-Host "Enter the username"
$Description = Read-Host "Enter description"
$Password = Read-Host "Enter the password" -AsSecureString

# Creates new AD user
New-ADUser -Name "$FirstName $LastName" -DisplayName "$FirstName $LastName" -Description $Description -SamAccountName $Username -UserPrincipalName "$Username@strongmind.com" -EmailAddress "$Username@strongmind.com" -GivenName $FirstName -Surname $LastName -AccountPassword $Password 

Enable-ADAccount -Identity $Username

Write-Host "User '$Username' has been created."