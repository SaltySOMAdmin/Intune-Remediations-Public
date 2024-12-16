#Checks if Dell Digital Delivery Services Exists

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Digital Delivery Services"}

If ( $MyApp -ne $null ) {
	Write-Output "Dell Digital Delivery Services Exists."
	Exit 1

}Else {
	Write-Output "Dell Digital Delivery Services Does Not Exists."
	Exit 0
}