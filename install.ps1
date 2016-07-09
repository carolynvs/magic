# Check if they have PowerShell 4+
if($PSVersionTable -eq $null -or $PSVersionTable.PSVersion.Major -lt 4){
  Write-Output "magic requires PowerShell version 4 or higher."
  Exit 1
}

# Download to the installation directory
$installDir = Join-Path $env:USERPROFILE .magic
iwr -uri https://example.com/magic.exe -outfile $installDir

# Print additional instructions
echo 'Magic is now installed!'
echo 'Add it to your path by running $env:PATH += ";" + $installDir'
