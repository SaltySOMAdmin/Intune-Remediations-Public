# Get username and remove SOM\
$username = Get-WMIObject -class Win32_ComputerSystem | select -ExpandProperty username
$username = $username -replace "*\\", ""

<#

Start Chrome bookmark Backup here

#>

#Path to chrome bookmarks
$pathToJsonFile = "c:\users\$username\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"

# Define the output HTML file path
$htmlOut = "C:\Users\$username\OneDrive - ORG\$username-ChromeBookmarks.html"

#exit if no one is logged In
If ([string]::IsNullOrEmpty($username)){
	Write-Output "No user signed in"
	Exit 2
}

#exit if no path to OneDrive
If (-not (test-path "C:\Users\$username\OneDrive - ORG\" )){
	Write-Output "No path to OneDrive"
	Exit 3
}

#exit if no Chrome Bookmarks
If (-not (test-path $pathToJsonFile )){
	Write-Output "No Chrome Bookmarks"
	Exit 1
}

#Header info for HTML file - Needs ' intead of " if format changes
$htmlHeader = @'
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<!--This is an automatically generated file.
    It will be read and overwritten.
    Do Not Edit! -->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<Title>Bookmarks</Title>
<H1>Bookmarks</H1>
<DL><p>
'@

$htmlHeader | Out-File -FilePath $htmlOut -Force -Encoding utf8 #line59

#A nested function to enumerate bookmark folders
Function Get-BookmarkFolder {
[cmdletbinding()]
Param(
[Parameter(Position=0,ValueFromPipeline=$True)]
$Node
)

Process 
{

 foreach ($child in $node.children) 
 {
   $da = [math]::Round([double]$child.date_added / 1000000) #date_added - from microseconds (Google Chrome {dates}) to seconds 'standard' epoch.
   $dm = [math]::Round([double]$child.date_modified / 1000000) #date_modified - from microseconds (Google Chrome {dates}) to seconds 'standard' epoch.
   if ($child.type -eq 'Folder') 
   {
     "    <DT><H3 FOLDED ADD_DATE=`"$($da)`">$($child.name)</H3>" | Out-File -FilePath $htmlOut -Append -Force -Encoding utf8
     "       <DL><p>" | Out-File -FilePath $htmlOut -Append -Force -Encoding utf8
     Get-BookmarkFolder $child
     "       </DL><p>" | Out-File -FilePath $htmlOut -Append -Force -Encoding utf8
   }
   else 
   {
        "       <DT><a href=`"$($child.url)`" ADD_DATE=`"$($da)`">$($child.name)</a>" | Out-File -FilePath $htmlOut -Append -Encoding utf8
  } #else url
 } #foreach
 } #process
} #end function

$data = Get-content $pathToJsonFile -Encoding UTF8 | out-string | ConvertFrom-Json
$sections = $data.roots.PSObject.Properties | select -ExpandProperty name
ForEach ($entry in $sections) {
    $data.roots.$entry | Get-BookmarkFolder
}
'</DL>' | Out-File -FilePath $htmlOut -Append -Force -Encoding utf8

Exit 0
<#

Start FireFox Bookmark Backup here

#>
