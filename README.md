# Fucai Xie · 开源贡献履历 / Open-Source Contributions

> 持续向知名开源项目提交**真实、可追溯**的高质量贡献(文档、测试、bug 修复、功能),并记录每一次贡献。

## 👤 关于我

- **姓名**:谢福财 (Fucai Xie)
- **GitHub**: [@fufu1209](https://github.com/fufu1209)
- **个人网站**: https://jl.fucaixie.xyz/
- **研究领域**:异常检测 / 网络安全威胁检测 / Transformer 对抗鲁棒性 / 可解释 AI / 智能教育
- **邮箱**: xiefucai42@gmail.com

## 🎯 目标

- 向 **100 个知名开源项目**逐项提交真实贡献;
- 每项贡献均记录:项目、贡献内容、PR 链接、合并状态 —— 见 [CONTRIBUTIONS.md](CONTRIBUTIONS.md);
- 宁精勿滥:优先文档修正、bug 修复、测试补充等**能被维护者接受**的高质量改动。

## 📁 仓库结构

| 文件 | 说明 |
|------|------|
| `CONTRIBUTIONS.md` | 100 个目标项目 + 贡献跟踪表(状态:待跟进/进行中/已提交/已合并) |
| `projects.txt` | 100 个知名项目清单(`分类<TAB>owner/repo`,供脚本批量查询) |
| `scripts/find-good-first-issues.sh` | 批量筛选各项目 `good first issue` 候选 issue |
| `candidates.jsonl` | 脚本输出的候选 issue 列表(JSON Lines) |

## 📈 进度

- 目标项目:100
- 已提交 PR:1([first-contributions#123134](https://github.com/firstcontributions/first-contributions/pull/123134))
- 已合并:`见 CONTRIBUTIONS.md 统计`

## 🔍 已筛选候选

`candidates.jsonl` 已收录 **178 条** good-first-issue 候选(覆盖 100 个仓库,断点续跑生成)。
筛选真实贡献时注意:
- 大厂项目(keras/pytorch/tensorflow 等)要求先签 **CLA**,否则 PR 的 `cla/*` 检查会挂;
- 部分项目(scipy 等)明确**禁止 AI 生成内容**,此类贡献会被拒并影响声誉;
- 优先选无人认领、范围明确、可本地验证正确性的修复。

## 🚀 使用方法

```bash
# 1. 批量筛选 good-first-issue 候选
./scripts/find-good-first-issues.sh

# 2. 查看候选,挑选可做的 issue
cat candidates.jsonl | jq -r '.url + "  " + .title'

# 3. 对选中的项目:fork → clone → 修改 → push → 发起 PR
gh repo fork owner/repo --clone
# ... 修改代码/文档 ...
git push -u origin 分支名
gh pr create --repo owner/repo --title "..." --body "..."

# 4. 在 CONTRIBUTIONS.md 中更新该项目的状态与 PR 链接
```

## ⚖️ 原则

- 只提交**真实、有意义**的改动,拒绝刷量式垃圾 PR;
- 所有贡献都以 PR 链接为准可验证;
- 被拒绝的 PR 也会如实记录,以便复盘改进。
