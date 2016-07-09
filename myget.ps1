$packagePath = "src/github.com/carolynvs/magic"
$ErrorActionPreference = "SilentlyContinue"

echo "Moving source code into the GOPATH..."
$env:GOPATH = "$PSScriptRoot"
$env:PATH+=";$env:GOPATH\bin"
mkdir -f $packagePath *> $null
ls -exclude @("src","myget.ps1") | %{mv $_.fullname $packagePath}
cd $packagePath

# Grab the magical bash wrapper and put in a happy place
$bash = "c:\git-sdk-64\bin\bash.exe"
mv C:\git-sdk-64\mingw64\share\git\compat-bash.exe $bash

echo "Building..."
& $bash -c "make"

echo "Packaging..."
installer\publish.ps1 -version $env:PackageVersion
