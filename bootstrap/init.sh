#!/bin/bash
# Codebook Bootstrap Script
# Usage: bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh)
#
# This script installs the Codebook system into your project directory.
# It clones the codebook repo, copies the structure, and sets up update notifications.

set -e

# Configuration
CODEBOOK_REPO="https://github.com/plannededge/codebook.git"
CODEBOOK_CACHE="$HOME/.claude/codebook-cache"
TARGET_DIR="${1:-.}"

# Colors for output (if terminal supports it)
if [ -t 1 ]; then
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
else
    GREEN=''
    BLUE=''
    YELLOW=''
    NC=''
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       Codebook Bootstrap v1.0        ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""
echo "Repository: $CODEBOOK_REPO"
echo "Target:     $TARGET_DIR"
echo ""

# Check for git
if ! command -v git &> /dev/null; then
    echo "Error: git is required but not installed."
    exit 1
fi

# Clone or update cache
echo -e "${YELLOW}Fetching codebook...${NC}"
mkdir -p "$HOME/.claude"
if [ -d "$CODEBOOK_CACHE" ]; then
    git -C "$CODEBOOK_CACHE" fetch origin main --quiet 2>/dev/null || true
    git -C "$CODEBOOK_CACHE" reset --hard origin/main --quiet 2>/dev/null || true
else
    git clone --depth 1 "$CODEBOOK_REPO" "$CODEBOOK_CACHE"
fi

# Create target directory if needed
mkdir -p "$TARGET_DIR"

# Copy structure (don't overwrite existing files)
echo -e "${YELLOW}Installing codebook structure...${NC}"
for dir in .claude agentdocs buildlogs standards templates workflows guides devdocs; do
    if [ -d "$CODEBOOK_CACHE/$dir" ]; then
        if [ -d "$TARGET_DIR/$dir" ]; then
            echo "  [exists] $dir/ - merging new files only"
            # Copy files that don't exist in target
            find "$CODEBOOK_CACHE/$dir" -type f | while read src; do
                rel="${src#$CODEBOOK_CACHE/}"
                dest="$TARGET_DIR/$rel"
                if [ ! -f "$dest" ]; then
                    mkdir -p "$(dirname "$dest")"
                    cp "$src" "$dest"
                fi
            done
        else
            echo "  [new]    $dir/"
            cp -r "$CODEBOOK_CACHE/$dir" "$TARGET_DIR/"
        fi
    fi
done

# Copy CLAUDE.md (always overwrite seed, but warn if different content exists)
if [ -f "$TARGET_DIR/CLAUDE.md" ]; then
    if grep -q "CB-BOOTSTRAP-SEED" "$TARGET_DIR/CLAUDE.md" 2>/dev/null; then
        echo "  [replace] CLAUDE.md (was seed file)"
        cp "$CODEBOOK_CACHE/CLAUDE.md" "$TARGET_DIR/"
    else
        echo "  [skip]   CLAUDE.md (existing file preserved)"
        echo "           To update, manually copy from: $CODEBOOK_CACHE/CLAUDE.md"
    fi
else
    echo "  [new]    CLAUDE.md"
    cp "$CODEBOOK_CACHE/CLAUDE.md" "$TARGET_DIR/"
fi

# Setup SessionStart hook for update notifications
echo -e "${YELLOW}Setting up update notifications...${NC}"
mkdir -p "$TARGET_DIR/.claude/hooks"
cat > "$TARGET_DIR/.claude/hooks/check-codebook-updates.sh" << 'HOOK'
#!/bin/bash
# Codebook Update Checker
# Runs at Claude Code session start, notifies if updates are available
# Does NOT auto-apply changes - user must manually update

CODEBOOK_CACHE="$HOME/.claude/codebook-cache"

if [ -d "$CODEBOOK_CACHE" ]; then
    cd "$CODEBOOK_CACHE" || exit 0

    # Fetch latest (silent, no-fail)
    git fetch origin main --quiet 2>/dev/null || exit 0

    # Compare local and remote
    LOCAL=$(git rev-parse HEAD 2>/dev/null)
    REMOTE=$(git rev-parse origin/main 2>/dev/null)

    if [ -n "$LOCAL" ] && [ -n "$REMOTE" ] && [ "$LOCAL" != "$REMOTE" ]; then
        echo ""
        echo "[Codebook] Updates available!"
        echo "  To update: cd $CODEBOOK_CACHE && git pull"
        echo "  Then re-run bootstrap in your project"
        echo ""
    fi
fi
HOOK
chmod +x "$TARGET_DIR/.claude/hooks/check-codebook-updates.sh"

# Create or merge settings.local.json with SessionStart hook
SETTINGS_FILE="$TARGET_DIR/.claude/settings.local.json"
if [ -f "$SETTINGS_FILE" ]; then
    echo "  [exists] .claude/settings.local.json - hook may need manual addition"
    echo "           Add SessionStart hook for: \$CLAUDE_PROJECT_DIR/.claude/hooks/check-codebook-updates.sh"
else
    cat > "$SETTINGS_FILE" << 'SETTINGS'
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/check-codebook-updates.sh"
          }
        ]
      }
    ]
  }
}
SETTINGS
    echo "  [new]    .claude/settings.local.json"
fi

# Success message
echo ""
echo -e "${GREEN}╔══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║       Codebook Initialized!          ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. Start Claude Code"
echo "  3. Claude will read CLAUDE.md and become Head Cook"
echo "  4. Run the pre-flight checklist before any development"
echo ""
echo "Update notifications are enabled. You'll be notified"
echo "when new codebook versions are available."
echo ""
