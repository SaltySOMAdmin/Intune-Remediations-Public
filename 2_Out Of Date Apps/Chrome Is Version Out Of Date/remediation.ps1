# Get the path of the installed 64 bit executable
$exePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Chrome is installed
if (Test-Path $exePath) {
	&"C:\Program Files\Google\Chrome\Application\*\Installer\setup.exe" --uninstall --msi --system-level --verbose-logging --force-uninstall
	Write-Output "Uninstalled"
	
	# trigger Intune Sync
	Get-ScheduledTask | ? {$_.TaskName -eq "PushLaunch"} | Start-ScheduledTask
	Exit 0
}

# Get the path of the installed 32 bit executable
$exePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

if (Test-Path $exePath) {
	&"C:\Program Files (x86)\Google\Chrome\\Application\*\Installer\setup.exe" --uninstall --msi --system-level --verbose-logging --force-uninstall
	Write-Output "Uninstalled"
	
	# trigger Intune Sync
	Get-ScheduledTask | ? {$_.TaskName -eq "PushLaunch"} | Start-ScheduledTask
	Exit 0
}