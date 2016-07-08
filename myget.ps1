$packagePath = "src/github.com/carolynvs/magic"
$ErrorActionPreference = "SilentlyContinue"

echo "Configuring GOPATH and GOBIN..."
$env:GOPATH = "$PSScriptRoot"
$env:PATH+=";$env:GOPATH\bin"

echo "Moving source code into the GOPATH..."
mkdir -f $packagePath *> $null
ls -exclude @("src","myget.ps1") | %{mv $_.fullname $packagePath}
cd $packagePath

echo "Downloading the Git for Windows bash.exe wrapper..."
$bash = "C:\git-sdk-64\bin\bash.exe"
mkdir -f (split-path $bash) *> $null
curl -outfile $bash https://bintray.com/carolynvs/git-for-windows-tools/download_file?file_path=bash-x86.exe

echo "Building..."
& $bash -c "make"

echo "Packaging..."
installer\package.ps1 -version $env:PackageVersion
