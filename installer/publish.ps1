param (
  [string]$version,
  [string]$apikey,
  # Change the source to https://chocolatey.org/ when done testing
  [string]$source = "https://www.myget.org/F/carolynvs/api/v3/index.json"
)

choco pack $PSScriptRoot\magic.nuspec -version $version
choco push magic.$version.nupkg --source $source --key $apikey
