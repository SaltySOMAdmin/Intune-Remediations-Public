#Checks if Dell Optimizer Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Optimizer"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell Optimizer Exists."
	Exit 1

}Else {
	Write-Output "Dell Optimizer Does Not Exists."
	Exit 0
}