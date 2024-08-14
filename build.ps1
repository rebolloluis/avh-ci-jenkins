# You must call this after activate.ps1 in the same terminal session
Write-Host "Building get started example..."
cbuild .\get_started.csolution.yml --packs --update-rte --context .debug+avh
