#!/usr/bin/env bash
set -euo pipefail
# Karpathy Skills CLAUDE.md 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/multica-ai/andrej-karpathy-skills#install
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }

mkdir -p .download
cd .download

git clone --depth=1 https://github.com/multica-ai/andrej-karpathy-skills.git
cp andrej-karpathy-skills/CLAUDE.md ./CLAUDE.md
wc -l CLAUDE.md
echo "安装完成：CLAUDE.md 已放到当前项目根目录"

echo ""

echo "安装完成：项目根目录多了一个 CLAUDE.md，重新打开 AI 会话后四条原则开始生效"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/multica-ai/andrej-karpathy-skills#install"
