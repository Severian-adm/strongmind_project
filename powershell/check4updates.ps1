 # Check for updates
 $updates = Get-WindowsUpdate -AcceptAll

 # If updates are needed, display details and send output to logfile
 if ($updates.Count -gt 0) {
     Write-Output "Updates needed to be installed:" | Out-File -FilePath C:\logs\update_log.txt -Append
     foreach ($update in $updates) {
         Write-Output "Title: $($update.Title)" | Out-File -FilePath C:\logs\update_log.txt -Append
         Write-Output "KB Article: $($update.KB)" | Out-File -FilePath C:\logs\update_log.txt -Append
         Write-Output "Description: $($update.Description)" | Out-File -FilePath C:\logs\update_log.txt -Append
         Write-Output "-----" | Out-File -FilePath C:\logs\update_log.txt -Append
     }
 } else {
     Write-Output "No updates are needed to be installed." | Out-File -FilePath C:\logs\update_log.txt -Append
 }  