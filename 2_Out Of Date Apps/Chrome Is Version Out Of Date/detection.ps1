# Define the version to compare with (130.0.6723.92)
 $compareVersion = "130.0.6723.92"
 $compareVersionArray = $compareVersion -split '\.'

# Get the path of the installed 64 bit executable
$exePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Check if Chrome is installed
if (Test-Path $exePath) {
    # Get the version
    $exeVersion = (Get-Item $exePath).VersionInfo.FileVersion

    # Split the version string into an array of numbers
    $exeVersionArray = $exeVersion -split '\.'

    # Compare each version segment
    for ($i = 0; $i -lt 4; $i++) {
        if ([int]$exeVersionArray[$i] -lt [int]$compareVersionArray[$i]) {
            Write-output "Google Chrome is out of date."
			exit 1
        } elseif ([int]$exeVersionArray[$i] -gt [int]$compareVersionArray[$i]) {
			Write-output "Google Chrome is up to date."
            exit 0
        }
    }

    Write-output "the versions are equal"
    exit 0
}


# Get the path of the installed 32 bit executable
$exePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

if (Test-Path $exePath) {
    # Get the version
    $exeVersion = (Get-Item $exePath).VersionInfo.FileVersion

    # Split the version string into an array of numbers
    $exeVersionArray = $exeVersion -split '\.'

    # Compare each version segment
    for ($i = 0; $i -lt 4; $i++) {
        if ([int]$exeVersionArray[$i] -lt [int]$compareVersionArray[$i]) {
            Write-output "Application is out of date."
			exit 1
        } elseif ([int]$exeVersionArray[$i] -gt [int]$compareVersionArray[$i]) {
			Write-output "Application is up to date."
            exit 0
        }
    }

    Write-output "the versions are equal"
    exit 0
}
else {
	Write-output "Application not installed" 
	Exit 0
}