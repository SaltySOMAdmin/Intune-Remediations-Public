# Define Software Name - no wild cards
$AppName = "Acrobat"

# Try WMI
$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq $AppName}
if ($MyApp -ne $null){
	echo "Uninstalling $AppName"
	$MyApp.Uninstall()
	exit 0
}

# Try Registry path. Get uninstall string and start process
$MyApp = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty | Where-Object { $_.DisplayName -match $AppName } | Select-Object -ExpandProperty UninstallString
if ($MyApp -ne $null)
{
	# If MSI code, uninstall with msiexec
	if ($MyApp -like "*msiexec.exe*") {
		echo "Uninstalling $AppName"
		# replace /I if it's one of those dumb uninstall strings
		if ($MyApp -match "MsiExec\.exe /I") {
		$MyApp = $MyApp -replace "MsiExec\.exe /I", "MsiExec.exe /X"
		}
		$MyApp = $MyApp -replace "MsiExec.exe", ""
		$arguments = "$MyApp /qn REBOOT=REALLYSUPRESS"		
		(Start-Process msiexec.exe -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode	
		exit 0
	}
	# If EXE, start process
	else{	    
		# Split the string at ".exe"
		$splitStrings = $MyApp -split '(?<=\.exe")'

		# Assign to variables
		$MyApp = $splitStrings[0]
		$arguments = $splitStrings[1].Trim() # Trim to remove any leading spaces
		
		#add silent flag
		$arguments += " /silent /S"
		# Uninstall Shield response file if needed
		<#
		copy-item "\\IP\Public_Share\WatchDogUninstall.iss" "c:\temp\WatchDogUninstall.iss"
		$iss = ' /s /f1"c:\surgtemp\WatchDogUninstall.iss"'
		$arguments = $iss
		#>
		
		# Start Uninstall
		echo "Uninstalling $AppName"
		(Start-Process $MyApp -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
		exit 0
	}
}

# If all fails, exit 1
echo "failed"
Exit 1