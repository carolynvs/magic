param (
  [string]$version
)

choco pack $PSScriptRoot\magic.nuspec -version $version
