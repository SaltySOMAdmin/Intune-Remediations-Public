$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Optimizer"}
$MyApp.Uninstall()

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Optimizer Core"}
$MyApp.Uninstall()

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "DellOptimizerUI"}
$MyApp.Uninstall()

Exit 0