$packagePath = "src/github.com/carolynvs/magic"
$ErrorActionPreference = "SilentlyContinue"

echo "Configuring the GOPATH and GOBIN..."
$env:GOPATH = "$PSScriptRoot"
$env:PATH+=";$env:GOPATH\bin"

echo "Moving source code into the GOPATH..."
mkdir -f $packagePath *> $null
ls -exclude @("src","myget.ps1") | %{mv $_.fullname $packagePath}
cd $packagePath

# Copy the Git for Windows bash wrapper into the Git for Windows SDK
$bash = "C:\git-sdk-64\bin\bash.exe"
mkdir -f (split-path $bash) *> $null
if(!(Test-Path $bash)) { cp "C:\Program Files (x86)\Git\bin\bash.exe" $bash }

echo "Running bash script..."
& $bash -c "./build.sh"

echo "Running make script..."
& $bash -c "make"
