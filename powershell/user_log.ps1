 # Define log path
 $logFilePath = "C:\logs\user_log.txt"

 # Start transcript logging
 Start-Transcript -Path $logFilePath -Append
 
 # Define timeframe
 $StartDate = (Get-Date).AddDays(-30)  # amount of days back
 $EndDate = Get-Date # End on the current date
 
 # Define event IDs for filtering
 $EventIDs = @(4720, 4722, 4725, 4738)
 
 # Filter and create hashtable
 $FilterHashtable = @{
     LogName = 'Security'
     ID = $EventIDs
     StartTime = $StartDate
     EndTime = $EndDate
 }
 
 # Pull events into hashtable
 $ADUserEvents = Get-WinEvent -FilterHashtable $FilterHashtable
 
 # Display event details
 $ADUserEvents | ForEach-Object {
     $EventTime = $_.TimeCreated
     $EventID = $_.Id
     $Message = $_.Message
     Write-Host "Event ID: $EventID" 
     Write-Host "Time: $EventTime"
     Write-Host "Message:"
     Write-Host $Message
     Write-Host "------------------------------------"
 } 
 
 # Stop transcript
 Stop-Transcript  