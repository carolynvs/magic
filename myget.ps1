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

#echo "Running bash script..."
#& $bash -c "./build.sh"

echo "Looking at the env"
ls 'c:\'
ls 'c:\git'
ls 'c:\Program Files'
ls 'c:\Program Files (x86)'
& $bash -c "set -x; uname -a"
& $bash -c "set -x; echo `$PWD"
& $bash -c "set -x; echo `echo `$PATH"
& $bash -c "set -x; which make"
& $bash -c "set -x; which go"
& $bash -c "set -x; ls /usr/bin | grep make"
& $bash -c "set -x; ls /bin | grep make"
c:\git-sdk-64\usr\bin\bash.exe --login -i -c "set -x; ls /usr/bin | grep make"
c:\git-sdk-64\usr\bin\bash.exe --login -i -c "set -x; ls /bin | grep make"
c:\git-sdk-64\usr\bin\bash.exe --login -i -c "set -x; which pacman"
#echo "Running make script..."
#& $bash -c "/usr/bin/make"
