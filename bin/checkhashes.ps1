if (!$env:SCOOP_HOME) {
    $env:SCOOP_HOME = Convert-Path (scoop prefix scoop)
}

$checkhashes = "$env:SCOOP_HOME/bin/checkhashes.ps1"
$dir = "$PSScriptRoot/../bucket"
#megadot takes FOREVER to download and hash, with no fault to this hosting provider.
#therefore, it is excluded from testing.
$exclude = 'megadot'

Get-ChildItem $dir -Filter '*.json' |
    Where-Object BaseName -ne $exclude |
    ForEach-Object {
        & $checkhashes -Dir $dir -App $_.BaseName @Args
    }
