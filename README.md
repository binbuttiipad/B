# B - Banana Claude Integration

Repository with banana-claude AI image generation skill integration.

## About Banana Claude

**Banana Claude** is an AI image generation skill for Claude Code where Claude acts as a Creative Director powered by Google's Gemini models.

Unlike simple API wrappers, Claude interprets your intent, selects domain expertise, constructs optimized prompts using a 5-component formula, and orchestrates Gemini for superior results.

## Quick Start

For full documentation, see [skills/banana/SKILL.md](skills/banana/SKILL.md).

## Installation

Install the `banana` skill into `~/.claude/skills/banana` with a single command, then restart Claude Code and run `/banana setup`.

### macOS · Linux · WSL · Git Bash

```bash
curl -fsSL https://raw.githubusercontent.com/binbuttiipad/B/main/install.sh | bash
```

### Windows · PowerShell 5.1+

```powershell
irm https://raw.githubusercontent.com/binbuttiipad/B/main/install.ps1 | iex
```

If the skill is already installed, re-run with the overwrite flag: `bash install.sh --force` or `powershell -ExecutionPolicy Bypass -File install.ps1 -Force` from a local clone (or `... install.sh | bash -s -- --force` for the curl one-liner).

For the upstream project and full documentation, see the banana-claude repository: https://github.com/AgriciDaniel/banana-claude#installation

## Commands

| Command | Description |
|---------|-------------|
| `/banana` | Interactive -- Claude detects intent and guides you |
| `/banana generate <idea>` | Full Creative Director pipeline |
| `/banana edit <path> <instructions>` | Intelligent image editing |
| `/banana chat` | Multi-turn visual session (maintains consistency) |
| `/banana inspire [category]` | Browse 2,500+ prompt database |
| `/banana batch <idea> [N]` | Generate N variations (default: 3) |
| `/banana setup` | Configure MCP and API key |
| `/banana preset [list\|create\|show\|delete]` | Manage brand/style presets |
| `/banana cost [summary\|today\|estimate]` | View cost tracking and estimates |

## License

MIT License -- see [LICENSE](LICENSE) for details.

## Credits

Built by [@AgriciDaniel](https://github.com/AgriciDaniel) - AI Workflow Architect.
