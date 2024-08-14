Write-Host "Activting vckpg..."
. $env:USERPROFILE\.vcpkg\vcpkg-init.ps1
vcpkg x-update-registry --all
vcpkg activate
