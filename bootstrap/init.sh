#!/bin/bash
# Codebook Bootstrap Script
# Usage: bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh)
#        bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --update
#
# This script installs the Codebook system into your project directory.
# Use --update to update existing codebook files (backs up first).

set -e

# Parse arguments
UPDATE_MODE=false
TARGET_DIR="."

while [[ $# -gt 0 ]]; do
    case $1 in
        --update|-u)
            UPDATE_MODE=true
            shift
            ;;
        *)
            TARGET_DIR="$1"
            shift
            ;;
    esac
done

# Configuration
CODEBOOK_REPO="https://github.com/plannededge/codebook.git"
CODEBOOK_CACHE="$HOME/.claude/codebook-cache"
CODEBOOK_VERSION="1.1.0"
BACKUP_DIR="$TARGET_DIR/.codebook-backup/$(date +%Y%m%d-%H%M%S)"

# Colors for output (if terminal supports it)
if [ -t 1 ]; then
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    NC='\033[0m' # No Color
else
    GREEN=''
    BLUE=''
    YELLOW=''
    RED=''
    NC=''
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
if [ "$UPDATE_MODE" = true ]; then
    echo -e "${BLUE}║     Codebook Update v${CODEBOOK_VERSION}          ║${NC}"
else
    echo -e "${BLUE}║    Codebook Bootstrap v${CODEBOOK_VERSION}         ║${NC}"
fi
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""
echo "Repository: $CODEBOOK_REPO"
echo "Target:     $TARGET_DIR"
if [ "$UPDATE_MODE" = true ]; then
    echo "Mode:       UPDATE (will backup and overwrite)"
fi
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

# Core codebook files that should be updated (not user-customized)
CORE_FILES=(
    "CLAUDE.md"
    ".claude/skills/_skill-index.md"
    ".claude/rules/_rules-index.md"
    "agentdocs/_agent-index.md"
    "checklists/_checklists-index.md"
    "standards/_standards-index.md"
    "templates/_templates-index.md"
    "buildlogs/_buildlog-index.md"
)

# Function to backup a file
backup_file() {
    local file="$1"
    if [ -f "$TARGET_DIR/$file" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"
        cp "$TARGET_DIR/$file" "$BACKUP_DIR/$file"
    fi
}

# Copy structure
if [ "$UPDATE_MODE" = true ]; then
    echo -e "${YELLOW}Updating codebook structure...${NC}"
    echo "  Backups will be saved to: $BACKUP_DIR"

    for dir in .claude agentdocs buildlogs checklists devdocs guides standards templates workflows; do
        if [ -d "$CODEBOOK_CACHE/$dir" ]; then
            if [ -d "$TARGET_DIR/$dir" ]; then
                echo "  [update] $dir/"
                # In update mode, copy all files (with backup)
                find "$CODEBOOK_CACHE/$dir" -type f | while read src; do
                    rel="${src#$CODEBOOK_CACHE/}"
                    dest="$TARGET_DIR/$rel"
                    if [ -f "$dest" ]; then
                        backup_file "$rel"
                    fi
                    mkdir -p "$(dirname "$dest")"
                    cp "$src" "$dest"
                done
            else
                echo "  [new]    $dir/"
                cp -r "$CODEBOOK_CACHE/$dir" "$TARGET_DIR/"
            fi
        fi
    done

    # Update CLAUDE.md
    backup_file "CLAUDE.md"
    echo "  [update] CLAUDE.md"
    cp "$CODEBOOK_CACHE/CLAUDE.md" "$TARGET_DIR/"
else
    echo -e "${YELLOW}Installing codebook structure...${NC}"
    for dir in .claude agentdocs buildlogs checklists devdocs guides standards templates workflows; do
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
            echo "           Use --update to overwrite, or manually copy from: $CODEBOOK_CACHE/CLAUDE.md"
        fi
    else
        echo "  [new]    CLAUDE.md"
        cp "$CODEBOOK_CACHE/CLAUDE.md" "$TARGET_DIR/"
    fi
fi

# Write version file
echo "$CODEBOOK_VERSION" > "$TARGET_DIR/.claude/codebook-version"
echo "  [version] $CODEBOOK_VERSION"

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
        echo "  To update: bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --update"
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
if [ "$UPDATE_MODE" = true ]; then
    echo -e "${GREEN}║       Codebook Updated!              ║${NC}"
else
    echo -e "${GREEN}║       Codebook Initialized!          ║${NC}"
fi
echo -e "${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""

if [ "$UPDATE_MODE" = true ]; then
    echo "Codebook has been updated to v${CODEBOOK_VERSION}."
    echo "Your previous files were backed up to:"
    echo "  $BACKUP_DIR"
    echo ""
else
    echo "Next steps:"
    echo "  1. cd $TARGET_DIR"
    echo "  2. Start Claude Code"
    echo "  3. Claude will read CLAUDE.md and become Head Cook"
    echo "  4. Run the pre-flight checklist before any development"
    echo ""
    echo "Update notifications are enabled. You'll be notified"
    echo "when new codebook versions are available."
    echo ""
    echo "To update later, run:"
    echo "  bash <(curl -s https://raw.githubusercontent.com/plannededge/codebook/main/bootstrap/init.sh) --update"
    echo ""
fi
