# Check for updates and filter for those that need to be installed
$updates = Get-WindowsUpdate -AcceptAll 

# Check if there are updates needed
if ($updates.Count -gt 0) {
    Write-Output "Updates needed to be installed:"
    foreach ($update in $updates) {
        Write-Output "Title: $($update.Title)"
        Write-Output "KB Article: $($update.KB)"
        Write-Output "Description: $($update.Description)"
        Write-Output "Installation Result: $($update.InstallationResult)"
        Write-Output "-----"
    }
    
    # Ask to install needed updates
    $install = Read-Host "Do you want to install the updates? (Y/N)"
    if ($install -eq 'Y') {
        # Perform update installation
        Write-Output "Installing updates..."
        Install-WindowsUpdate -Update $updates
        Write-Output "Updates installed successfully."
    }
} else {
 Write-Output "No updates are needed to be installed."
}
