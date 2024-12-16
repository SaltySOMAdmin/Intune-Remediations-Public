#Checks if Dell Command | Update for Windows Universal Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Command | Update for Windows Universal"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell Command | Update for Windows Universal Exists."
	Exit 1

}Else {
	Write-Output "Dell Command | Update for Windows Universal Does Not Exists."
	Exit 0
}