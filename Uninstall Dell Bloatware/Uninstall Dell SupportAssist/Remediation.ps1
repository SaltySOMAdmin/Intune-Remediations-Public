$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist OS Recovery Plugin for Dell Update"}
$MyApp.Uninstall()

$supportassist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist Remediation" } | Select-Object -ExpandProperty UninstallString
if ($supportassist -ne $null)
{
	if ($supportassist -like "*msiexec.exe*") {
		echo "Uninstalling Dell SupportAssist"
		$supportassist = $supportassist -replace "MsiExec.exe", ""
		$arguments = "$supportassist /qn REBOOT=REALLYSUPRESS"		
		(Start-Process msiexec.exe -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode	
	}
	else{	    
		echo "Uninstalling Dell SupportAssist"
		$arguments = "/qn REBOOT=REALLYSUPRESS"
		(Start-Process $supportassist -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
	}
}

$supportassist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist" } | Select-Object -ExpandProperty UninstallString
if ($supportassist -ne $null)
{
	if ($supportassist -like "*msiexec.exe*") {
		echo "Uninstalling Dell SupportAssist"
		$supportassist = $supportassist -replace "MsiExec.exe", ""
		$arguments = "$supportassist /qn REBOOT=REALLYSUPRESS"			
		(Start-Process msiexec.exe -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
	}		
	else{	    
		echo "Uninstalling Dell SupportAssist"
		$arguments = "/qn REBOOT=REALLYSUPRESS"
		(Start-Process $supportassist -wait -NoNewWindow -PassThru -ArgumentList $arguments).ExitCode
	}
}

Exit 0