# Get the list of installed printers
$printers = Get-Printer

# Check if the specific printer is in the list
$printerName = "HP OfficeJet Pro 9010"
$printerInstalled = $printers | Where-Object { $_.Name -eq $printerName }

if ($printerInstalled) {
    Write-Output "Printer '$printerName' is installed."
	Exit 1
} else {
    Write-Output "Printer '$printerName' is not installed."
	Exit 0
}