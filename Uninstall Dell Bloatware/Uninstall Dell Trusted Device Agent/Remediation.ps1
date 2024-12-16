$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Trusted Device Agent"}
$MyApp.Uninstall()

Exit 0