$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Digital Delivery Services"}
$MyApp.Uninstall()

Exit 0