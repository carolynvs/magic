param (
  [string]$version
  [string]$apikey = $null
)

choco pack $PSScriptRoot\magic.nuspec -version $version
choco push magic.$version.nupkg $apikey
