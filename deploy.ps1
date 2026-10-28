# Karpathy Skills CLAUDE.md 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/multica-ai/andrej-karpathy-skills#install
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

git clone --depth=1 https://github.com/multica-ai/andrej-karpathy-skills.git
Copy-Item "andrej-karpathy-skills\CLAUDE.md" ".\CLAUDE.md" -Force
(Get-Content .\CLAUDE.md).Count
Write-Host '安装完成：CLAUDE.md 已放到当前项目根目录'

Write-Host ''

Write-Host '安装完成：项目根目录多了一个 CLAUDE.md，重新打开 AI 会话后四条原则开始生效'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/multica-ai/andrej-karpathy-skills#install'
