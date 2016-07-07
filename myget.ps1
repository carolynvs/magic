$package = "github.com/carolynvs/magic"

echo "Configuring the GOPATH and GOBIN..."
$env:GOPATH = "$PSScriptRoot"
$gobin = "$env:GOPATH\bin"
if(!$env:PATH.Contains($gobin)) { $env:PATH+=";$gobin" }

echo "Moving source code into the GOPATH..."
mkdir -f src/$package > $null
ls -exclude @("src","myget.ps1") | %{mv $_.fullname src\$package}
ls src\$package

echo "Go information:"
(Get-Command go).definition
go version
go env

echo "Running build script..."
cd src/$package
bash -c "./build.sh"
