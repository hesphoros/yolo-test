# 文件名：unlock-yolo.ps1

$co_author_name = "jehovahBlack"
$co_author_email = "luciferau@163.com"
$pr_title = "Unlock YOLO Achievement"
$pr_body = "Merge without review to earn YOLO."

# 创建唯一分支
$timestamp = Get-Date -Format "yyyyMMddHHmmssfff"
$branch_name = "yolo-$timestamp"
git checkout -b $branch_name

# 确保文件变更
Add-Content -Path "README.md" -Value "`nYOLO boost at $timestamp"
git add README.md
git commit -m "YOLO Boost Commit`n`nCo-authored-by: $co_author_name <$co_author_email>"
git push origin $branch_name

# 创建 PR（不加 reviewer）
gh pr create --title "$pr_title" --body "$pr_body" --base main --head $branch_name

# 等待 5 秒后直接合并，不要等 Review
Start-Sleep -Seconds 5
gh pr merge --merge --delete-branch

Write-Host "`n✅ YOLO PR created and merged without review. Wait a bit for GitHub to unlock the achievement."
