# banana-claude — installer (Windows / PowerShell 5.1+).
#
# One-line install:
#   irm https://raw.githubusercontent.com/binbuttiipad/B/main/install.ps1 | iex
#
# Local clone:
#   powershell -ExecutionPolicy Bypass -File install.ps1 [-Force]
#
# Installs the `banana` skill into ~\.claude\skills\banana so Claude Code
# picks it up as a user-level skill.
#
# No top-level param() and all logic inside a function: `irm | iex` executes
# this file as a string, so $PSCommandPath is $null and a top-level param
# block cannot receive arguments through the pipe. Wrapping the logic in a
# function and forwarding $args keeps one script working for both the pipe
# path (no args, no script path) and the local-clone path.

function Install-BananaClaude {
  param(
    [switch]$Force
  )

  $ErrorActionPreference = "Stop"

  $Repo      = "binbuttiipad/B"
  $Branch    = "main"
  $SkillName = "banana"

  $skillsRoot = Join-Path (Join-Path $HOME ".claude") "skills"
  $dest       = Join-Path $skillsRoot $SkillName

  if ((Test-Path $dest) -and -not $Force) {
    # `exit` here would close the user's console under `irm | iex`, so throw.
    throw "banana-claude: $dest already exists. Re-run with -Force to overwrite (local clone), or delete the directory first."
  }

  # If we're inside the repo clone, install straight from it. $PSCommandPath
  # is $null when piped to iex, so guard before Split-Path.
  $source  = $null
  $tempDir = $null
  if ($PSCommandPath) {
    $here  = Split-Path -Parent $PSCommandPath
    $local = Join-Path (Join-Path $here "skills") $SkillName
    if (Test-Path (Join-Path $local "SKILL.md")) {
      $source = $local
    }
  }

  if (-not $source) {
    # Curl-pipe path: download the repo archive and install from it.
    # PowerShell 5.1 defaults to TLS 1.0 and GitHub requires TLS 1.2+.
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    $tempDir = Join-Path ([IO.Path]::GetTempPath()) ("banana-claude-install-" + [Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $tempDir | Out-Null

    $zipUrl  = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"
    $zipPath = Join-Path $tempDir "repo.zip"

    Write-Host "banana-claude: downloading $zipUrl"
    # The progress bar makes Invoke-WebRequest painfully slow on 5.1.
    $prevProgress = $ProgressPreference
    $ProgressPreference = "SilentlyContinue"
    try {
      Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
    } finally {
      $ProgressPreference = $prevProgress
    }

    Expand-Archive -Path $zipPath -DestinationPath $tempDir

    # The archive unpacks to a single "<repo>-<branch>" directory.
    $extracted = Get-ChildItem -Path $tempDir -Directory | Select-Object -First 1
    if (-not $extracted) {
      throw "banana-claude: downloaded archive did not contain a repository directory."
    }

    $source = Join-Path (Join-Path $extracted.FullName "skills") $SkillName
    if (-not (Test-Path (Join-Path $source "SKILL.md"))) {
      throw "banana-claude: skills/$SkillName not found in the downloaded archive."
    }
  }

  if (-not (Test-Path $skillsRoot)) {
    New-Item -ItemType Directory -Path $skillsRoot -Force | Out-Null
  }
  if (Test-Path $dest) {
    Remove-Item -Path $dest -Recurse -Force
  }
  Copy-Item -Path $source -Destination $dest -Recurse

  if ($tempDir -and (Test-Path $tempDir)) {
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
  }

  Write-Host ""
  Write-Host "banana-claude: installed skill to $dest"
  Write-Host ""
  Write-Host "Next steps:"
  Write-Host "  1. Restart Claude Code (or start a new session) to pick up the skill."
  Write-Host "  2. Run /banana setup to configure the MCP server and API key."
}

# $args is the automatic variable: populated when run as a file
# (`powershell -File install.ps1 -Force`), empty under `irm | iex`.
Install-BananaClaude @args
