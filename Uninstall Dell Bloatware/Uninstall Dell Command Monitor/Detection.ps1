# Checks if Software Exists
$AppName = "Dell Watchdog Timer"

# Try WMI
$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq $AppName}
if ($MyApp -ne $null){
	Write-Output "$AppName Exists."
	exit 1
}

# Check Registry for MSI Code
$MyApp = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty | Where-Object { $_.DisplayName -match $AppName } | Select-Object -Property DisplayName, UninstallString

If ( $MyApp -ne $null ) {
	Write-Output "$AppName Exists."
	Exit 1
	}
	
Exit 0