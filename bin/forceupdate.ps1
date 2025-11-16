$bucketDir = "$env:USERPROFILE\scoop\buckets"

Get-ChildItem $bucketDir | ForEach-Object {
    Write-Host "Force updating $($_.Name) ..."
    git -C $_.FullName fetch --all
    git -C $_.FullName reset --hard origin/master 2>$null
    git -C $_.FullName reset --hard origin/main 2>$null
}
