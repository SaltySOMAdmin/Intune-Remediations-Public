$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Core Services"}
$MyApp.Uninstall()

Exit 0