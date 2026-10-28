# Karpathy Skills CLAUDE.md 安装指南

> 第三方部署指南 · 非 Karpathy Skills 官方仓库。官方项目：[multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/multica-ai/andrej-karpathy-skills#install)为准。

[![⚡ CLAUDE.md 安装](https://img.shields.io/badge/%E2%9A%A1_CLAUDE.md_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#claudemd安装推荐用百度搭子)

## CLAUDE.md 安装（推荐：用百度搭子）

> [!TIP]
> AI 总爱自作主张、过度设计、顺手改无关代码？让百度搭子把这份约束文件放进项目。

⚠️ 这只是一个 Markdown 规则文件，不会自动运行任何程序。Claude Code 会自动读取项目根目录的 CLAUDE.md，其它客户端需要你确认是否支持同名规则文件。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/karpathy-skills-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子克隆仓库，把 CLAUDE.md 复制到你的项目根目录，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Karpathy Skills 是什么？

Karpathy Skills 是开源的225.6k stars，MIT，把 Karpathy 总结的四条编码原则写进 CLAUDE.md，约束 AI 的坏习惯（协议：MIT，<img src="https://img.shields.io/github/stars/multica-ai/andrej-karpathy-skills?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把 Karpathy 对 LLM 编码毛病的观察，整理成四条可执行原则写进一个文件：先想再写、简单优先、外科手术式修改、目标驱动执行。

- 225.6k stars：单文件项目也能冲到 20 万
- 四条原则：Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution
- 直接对应病灶：乱做假设、过度抽象、顺手改无关代码
- 零依赖：一个 Markdown 文件，放进项目就生效
- 可合并：追加到已有 CLAUDE.md，不覆盖你的项目规则
- MIT：可自由改

（来源：[官方仓库](https://github.com/multica-ai/andrej-karpathy-skills)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 225.6k stars | 单文件项目里的现象级 |
| 零依赖 | 一个 Markdown 文件 |
| 直击痛点 | 四条原则对应最常见的 AI 毛病 |
| 可合并 | 不覆盖原有项目规则 |
| 跨客户端 | CLAUDE.md 与 Cursor 规则都提供 |
| MIT | 可自由修改 |

| 需要注意 | 说明 |
|---|---|
| 只是提示词 | 不能硬性拦截，模型仍可能忽略 |
| 偏保守 | 简单任务也会显得慢 |
| 效果看模型 | 弱模型对规则遵守度差 |
| 需要项目级放置 | 放错目录等于没装 |
| 非 Claude 客户端 | 要确认是否读取同名文件 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
git clone --depth=1 https://github.com/multica-ai/andrej-karpathy-skills.git
cp andrej-karpathy-skills/CLAUDE.md ./CLAUDE.md
wc -l CLAUDE.md
echo "安装完成：CLAUDE.md 已放到当前项目根目录"
```

部署步骤来源：[https://github.com/multica-ai/andrej-karpathy-skills#install](https://github.com/multica-ai/andrej-karpathy-skills#install)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据核对：225,587 stars、22,533 forks、2026-01-27 建仓 | 已核对 2026-10-27 |
| README 确认许可证为 MIT（API 的 license 字段为空） | 已核对 2026-10-27 |
| GitHub Trending 周榜 +4039 | 已核对 2026-10-27 |
| README 确认两种安装方式：插件市场与 CLAUDE.md 文件 | 已核对 2026-10-27 |
| 未实测规则在不同模型上的实际约束效果 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

本项目不是 MCP server，只是一个规则文件；本仓库只负责安装，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\karpathy-skills-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 四条原则在管什么

| 原则 | 治的问题 |
|---|---|
| **Think Before Coding** | 默默挑一个理解就开跑，不问也不说 |
| **Simplicity First** | 100 行能搞定的写成 1000 行 |
| **Surgical Changes** | 顺手重构、删注释、改无关代码 |
| **Goal-Driven Execution** | 不知道成功标准就开始写 |

### 已有项目怎么合并

不要直接覆盖，把内容追加到你现有的 `CLAUDE.md` 末尾：

```bash
cat andrej-karpathy-skills/CLAUDE.md >> CLAUDE.md
```

```powershell
Get-Content andrej-karpathy-skills\CLAUDE.md | Add-Content .\CLAUDE.md
```

### 怎么判断生效了

- diff 里只剩你要的改动，没有顺手「优化」
- 第一次就能写对，不用因为过度设计重写
- 动手前会先问你，而不是出错后再解释
- PR 小而干净，没有夹带重构

### 用 Cursor / 其它客户端

仓库里带了 `.cursor/rules/karpathy-guidelines.mdc`，把那个文件复制到你项目的 `.cursor/rules/` 下即可。其它客户端如果支持项目级规则文件，同样按对应文件名复制。

> ⚠️ 这套规则偏向「稳」而不是「快」。改错别字、加一行日志这种小事，不必强求走完整流程。

## 常见坑

- 放错位置：必须在项目根目录，子目录不会被自动读取
- 覆盖了原有规则：用追加而不是 `cp` 覆盖
- 感觉没生效：确认客户端版本支持 CLAUDE.md，重启会话
- Cursor 里无效：把 `.cursor/rules/karpathy-guidelines.mdc` 一起复制过去
- 模型完全不理：先换更强的模型，再考虑把关键条款写进系统提示
- 文件太大影响上下文：只保留你真正需要的原则，删掉示例

## 免责声明

本仓库为第三方指南，与 Karpathy Skills 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/multica-ai/andrej-karpathy-skills#install)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
