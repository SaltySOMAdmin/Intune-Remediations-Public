$officeApps = @('WINWORD', 'EXCEL', 'POWERPNT', 'OUTLOOK', 'ONENOTE')

Write-Output "Office Requires Update"
# Iterate through each app and force close it
foreach ($app in $officeApps) {
	Get-Process -Name $app -ErrorAction SilentlyContinue | Stop-Process -Force
}

Start-Process -Wait -FilePath "C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe" -ArgumentList "/update user", "displaylevel=false", "forceappshutdown=true", "updatepromptuser=false"

#&"C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe" /update user updatepromptuser=false forceappshutdown=true displaylevel=false
exit 0