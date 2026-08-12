#!/usr/bin/env bash
# 用法: check_links.sh owner/repo
repo="$1"
echo "===== $repo ====="
url="https://raw.githubusercontent.com/$repo/master/README.md"
curl -s -m 15 "$url" -o "readme_${repo//\//_}.md" || curl -s -m 15 "https://raw.githubusercontent.com/$repo/main/README.md" -o "readme_${repo//\//_}.md"
links=$(grep -oE 'https://[a-zA-Z0-9./?=_%#&:+-]+' "readme_${repo//\//_}.md" | sort -u | head -60)
total=0
for l in $links; do
  total=$((total+1))
  code=$(curl -s -o /dev/null -m 8 -w "%{http_code}" -L "$l" 2>/dev/null)
  if [ "$code" = "404" ]; then echo "404  $l"; fi
done
echo "  检查 $total 个链接完成"
