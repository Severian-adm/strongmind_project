 # Interactive prompt
 $GroupName = Read-Host "Enter the name of the AD security group"
 $Usernames = Read-Host "Enter the usernames to add to the group (comma-separated)"
 
 # Split list of usernames into array
 $UsernameArray = $Usernames -split ','
 
 # Add user(s) to group
 foreach ($Username in $UsernameArray) {
     $Username = $Username.Trim()  # Remove leading/trailing spaces
     try {
         # Check if user exists
         $User = Get-ADUser -Identity $Username -ErrorAction Stop
 
         # Add user to the group
         Add-ADGroupMember -Identity $GroupName -Members $User
         Write-Host "User '$Username' added to group '$GroupName'"
     } catch {
         Write-Host "Error: User '$Username' not found. Exiting the script."
         return  # Exit the script if user is not found
     }
 }
 
 Write-Host "Users have been added to the group." 
 