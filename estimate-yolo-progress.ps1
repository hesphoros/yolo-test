# 检查 YOLO 成就估算（基于本地 force push 操作记录）

Write-Host "`nEstimating YOLO progress based on git reflog..."

# 获取最近 force push 记录
$yoloCount = git reflog | Select-String --Pattern 'push --force' | Measure-Object | Select-Object -ExpandProperty Count

# 判断等级（仅估算，实际等级由 GitHub 系统更新后确认）
function Get-YOLOLevel($count) {
    if ($count -ge 16) { return "🏆 Gold (16+ force pushes)" }
    elseif ($count -ge 8) { return "🥈 Silver (8+ force pushes)" }
    elseif ($count -ge 4) { return "🥉 Bronze (4+ force pushes)" }
    else { return "🕸️ Unranked (<4 force pushes)" }
}

$level = Get-YOLOLevel -count $yoloCount

Write-Host "========================================="
Write-Host "Estimated YOLO Force Push Count: $yoloCount"
Write-Host "Estimated YOLO Level: $level"
Write-Host "========================================="
Write-Host "`nReminder: Achievements update on GitHub with delay. This is a local estimate."
