 # Define script path
 $ScriptPath = "C:\scripts\check4updates.ps1"

 # Create trigger variable
 $Trigger = New-ScheduledTaskTrigger -Daily -At "10:00 AM"
 
 # Create action variable
 $Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File $ScriptPath"
 
 # Register task and set to system user for higher permission
 Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "CheckForUpdates" -Description "Check for and report on available updates" -User "System"  