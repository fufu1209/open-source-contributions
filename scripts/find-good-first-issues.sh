#!/usr/bin/env bash
# find-good-first-issues.sh —— 批量扫描 projects.txt 中知名项目的 good-first-issue 候选
# 用法:
#   ./find-good-first-issues.sh            # 扫描 projects.txt,结果写入 candidates.jsonl
#   ./find-good-first-issues.sh 清单.txt 输出.jsonl   # 自定义输入/输出
# 支持断点续跑:已检查过的仓库记录在 .repos_done,重跑自动跳过。
set -euo pipefail

cd "$(dirname "$0")"
LIST="${1:-../projects.txt}"
OUT="${2:-../candidates.jsonl}"
DONE=".repos_done"
TOTAL=$(grep -vc '^$' "$LIST")

echo "开始扫描 $TOTAL 个仓库(断点续跑,跳过已检查的)..."
count=0
while IFS=$'\t' read -r _ repo; do
  [ -z "$repo" ] && continue
  if grep -Fqx "$repo" "$DONE" 2>/dev/null; then
    continue
  fi
  count=$((count + 1))
  if data=$(gh issue list --repo "$repo" --label "good first issue" \
            --state open --limit 10 \
            --json number,title,url 2>/dev/null); then
    echo "$data" | jq -c --arg repo "$repo" \
      '.[] | {repo: $repo, number, title, url}' >> "$OUT"
    echo "$repo" >> "$DONE"
    printf '  ✓ %s (%s)\n' "$repo" "$(echo "$data" | jq 'length')"
  else
    printf '  - %s (无 good-first-issue 或无权限)\n' "$repo"
    echo "$repo" >> "$DONE"
  fi
  sleep 1
done < "$LIST"

checked=$(wc -l < "$DONE" 2>/dev/null || echo 0)
hits=$(wc -l < "$OUT" 2>/dev/null || echo 0)
echo "完成 ✅ 已检查 $checked / $TOTAL 个仓库,筛出 $hits 条候选,详见 $OUT"
