#!/usr/bin/env bash
# banana-claude — installer (macOS / Linux / WSL / Git Bash).
#
# One-line install:
#   curl -fsSL https://raw.githubusercontent.com/binbuttiipad/B/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/binbuttiipad/B/main/install.sh | bash -s -- --force
#
# Local clone:
#   bash install.sh [--force]
#
# Installs the `banana` skill into ~/.claude/skills/banana so Claude Code
# picks it up as a user-level skill.

set -euo pipefail

REPO="binbuttiipad/B"
BRANCH="main"
SKILL_NAME="banana"

SKILLS_ROOT="$HOME/.claude/skills"
DEST="$SKILLS_ROOT/$SKILL_NAME"

FORCE=0
for arg in "$@"; do
  case "$arg" in
    -f|--force) FORCE=1 ;;
    *)
      echo "banana-claude: unknown option: $arg" >&2
      echo "usage: install.sh [--force]" >&2
      exit 1
      ;;
  esac
done

if [ -e "$DEST" ] && [ "$FORCE" -ne 1 ]; then
  echo "banana-claude: $DEST already exists. Re-run with --force to overwrite:" >&2
  echo "  curl -fsSL https://raw.githubusercontent.com/$REPO/$BRANCH/install.sh | bash -s -- --force" >&2
  exit 1
fi

# If we're inside the repo clone, install straight from it. BASH_SOURCE is
# unset when bash reads the script from stdin (curl | bash), and `set -u`
# would trip on a bare reference — default to empty so the curl-pipe path
# falls through cleanly.
source_dir=""
here="$(cd "$(dirname "${BASH_SOURCE[0]:-}")" 2>/dev/null && pwd)" || here=""
if [ -n "$here" ] && [ -f "$here/skills/$SKILL_NAME/SKILL.md" ]; then
  source_dir="$here/skills/$SKILL_NAME"
fi

tmp_dir=""
cleanup() {
  if [ -n "$tmp_dir" ] && [ -d "$tmp_dir" ]; then
    rm -rf "$tmp_dir"
  fi
}
trap cleanup EXIT

if [ -z "$source_dir" ]; then
  # Curl-pipe path: download the repo tarball and install from it.
  tmp_dir="$(mktemp -d "${TMPDIR:-/tmp}/banana-claude-install.XXXXXX")"
  tarball_url="https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz"
  echo "banana-claude: downloading $tarball_url"
  curl -fsSL "$tarball_url" | tar -xz -C "$tmp_dir"

  # The tarball unpacks to a single "<repo>-<branch>" directory.
  extracted="$(find "$tmp_dir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  if [ -z "$extracted" ] || [ ! -f "$extracted/skills/$SKILL_NAME/SKILL.md" ]; then
    echo "banana-claude: skills/$SKILL_NAME not found in the downloaded archive." >&2
    exit 1
  fi
  source_dir="$extracted/skills/$SKILL_NAME"
fi

mkdir -p "$SKILLS_ROOT"
rm -rf "$DEST"
cp -R "$source_dir" "$DEST"

echo ""
echo "banana-claude: installed skill to $DEST"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code (or start a new session) to pick up the skill."
echo "  2. Run /banana setup to configure the MCP server and API key."
