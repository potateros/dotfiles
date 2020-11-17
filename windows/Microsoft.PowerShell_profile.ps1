##############
# potateros' Windows PowerShell profile
##############

## Sets initial PowerShell terminal location
# set-location default\location

## Some aliases and functions to make it more Unix-like
new-alias -name l -value dir
new-alias -name trash -value Remove-ItemSafely

Function touch {
  set-content -Path ($args[0]) -Value ($null)
}

Function rmd {
	Remove-Item -Recurse -Force -Path $args
}

## Modules to import
Import-Module 'path\to\Documents\WindowsPowerShell\Modules\posh-git\0.7.3\posh-git.psd1'
Import-Module posh-git
Import-Module oh-my-posh

## Sets theme for ZSH (oh-my-posh)
Set-Theme Robbyrussell

## Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
