# Get username and remove org
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$username = $username -replace "*\\", ""
$hostname = $env:COMPUTERNAME

# Define the email parameters
$smtpServer = "smtprelay."   # Replace with your SMTP server
$from = ""   # Replace with your email address
$to = ""    # Replace with the recipient's email address
$subject = "OneDrive Not Happy"
$body = "OneDrive CurrentStateString = $CurrentStateString. Hostname = $hostname"

# exit if no user signed in
If ([string]::IsNullOrEmpty($username)){
	Write-Output "No user signed in"
	Exit 2
}

# exit if no path to OneDrive
If (-not (test-path "C:\Users\$username\OneDrive - #replacewithOrg\" )){
	Write-Output "No path to OneDrive"
	Exit 3
}

# Get OneDrive Current State
$CurrentStateString = &"c:\temp\ODSyncUtil-64-bit\Get-ODStatus.ps1" | select CurrentStateString

# Check if $CurrentStateString is "paused" or null/empty
if ($CurrentStateString -ne "Synced" -and $variable -ne "Syncing" -and -not [string]::IsNullOrEmpty($variable)) {
    Write-Output "OneDrive Not Happy"
    Send-MailMessage -SmtpServer $smtpServer -From $smtpFrom -To $smtpTo -Subject $subject -Body $body
    exit 1
} else {
    Write-Output "CurrentStateString is not 'paused' or null."
    exit 0
}
