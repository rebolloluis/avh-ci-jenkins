# You must call this after activate.ps1 in the same terminal session
Write-Host "Running test on Virtual Platform..."
FVP_MPS2_Cortex-M3 --simlimit 100 -f Project/fvp_config.txt -a out/Project/avh/debug/Project.axf  | Out-File -FilePath "Project.avh.log" -Encoding utf8
Write-Host "Test finished with exit code $LASTEXITCODE"
