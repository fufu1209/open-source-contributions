#!/usr/bin/env bash
repo="$1"
f="readme_${repo//\//_}.md"
echo "===== $repo 图片 ====="
grep -oE '!\[[^]]*\]\([^)]+\)' "$f" 2>/dev/null | sed -E 's/.*\]\((.*)\)/\1/' | grep -E '^https' | sort -u | while read -r l; do
  code=$(curl -s -o /dev/null -m 8 -w "%{http_code}" -L "$l" 2>/dev/null)
  [ "$code" != "200" ] && [ "$code" != "301" ] && [ "$code" != "302" ] && echo "$code  $l"
done
echo "  图片检查完成"
