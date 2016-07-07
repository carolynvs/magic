$package = "github.com\carolynvs\magic"

# Move our repo into the GOPATH
echo "Setting up GOPATH"
$env:GOPATH="$PSScriptRoot-gopath"
$GOBIN="$env:GOPATH\bin"
if(!$env:PATH.Contains($GOBIN)) { $env:PATH+=";$GOBIN" }
Copy-Item -Force -Recurse $PSScriptRoot "$env:GOPATH\src\$package"

bash -c "./build.sh"
