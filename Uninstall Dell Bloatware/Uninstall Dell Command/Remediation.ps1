$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Command | Update for Windows Universal"}
$MyApp.Uninstall()

Exit 0