# === Configuration ===
$repeat_count = 5  # Number of force pushes (recommend <10 per run)
$repo_path = "D:\codespace\yolo-test"  # Path to your local Git repo

# === Start YOLO process ===
Set-Location $repo_path

for ($i = 1; $i -le $repeat_count; $i++) {
    Write-Host "[$i/$repeat_count] Creating temporary commit..."
    Add-Content -Path "README.md" -Value "YOLO force push #$i - $(Get-Date)"
    git add README.md
    git commit -m "YOLO commit #$i"

    Write-Host "[$i/$repeat_count] Resetting commit to simulate rebase..."
    git reset --hard HEAD~1

    Write-Host "[$i/$repeat_count] Force pushing to remote..."
    git push --force

    Write-Host "[$i/$repeat_count] Force push completed.`n"
    Start-Sleep -Seconds 3
}

Write-Host "All $repeat_count YOLO force pushes completed. Achievement should update shortly."
