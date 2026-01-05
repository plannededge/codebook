#!/bin/bash
# Codebook Validation Test Suite
# Usage: ./tests/validate-codebook.sh [--verbose]
#
# Validates the codebook implementation:
# - Directory structure
# - YAML preambles
# - Codebook ID consistency
# - Cross-references
# - Bootstrap functionality

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0

# Options
VERBOSE=false
[[ "$1" == "--verbose" || "$1" == "-v" ]] && VERBOSE=true

# Get script directory and codebook root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODEBOOK_ROOT="$(dirname "$SCRIPT_DIR")"

# Temp directory for bootstrap tests
TEST_DIR="/tmp/codebook-validation-$$"

# Cleanup on exit
cleanup() {
    rm -rf "$TEST_DIR" 2>/dev/null || true
}
trap cleanup EXIT

#=============================================================================
# Helper Functions
#=============================================================================

log_pass() {
    echo -e "${GREEN}✓${NC} $1"
    PASS=$((PASS + 1))
}

log_fail() {
    echo -e "${RED}✗${NC} $1"
    FAIL=$((FAIL + 1))
}

log_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
    WARN=$((WARN + 1))
}

log_info() {
    $VERBOSE && echo -e "${BLUE}ℹ${NC} $1" || true
}

section() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
}

subsection() {
    echo ""
    echo -e "${YELLOW}--- $1 ---${NC}"
}

#=============================================================================
# Test 1: Directory Structure
#=============================================================================

test_directory_structure() {
    section "1. Directory Structure Tests"

    cd "$CODEBOOK_ROOT"

    subsection "Required Directories"

    local dirs=(
        ".claude"
        ".claude/skills"
        ".claude/rules"
        "agentdocs"
        "agentdocs/templates"
        "buildlogs"
        "checklists"
        "devdocs"
        "devdocs/architecture"
        "devdocs/business"
        "devdocs/data"
        "devdocs/ui"
        "guides"
        "standards"
        "templates"
        "workflows"
        "bootstrap"
    )

    for dir in "${dirs[@]}"; do
        if [ -d "$dir" ]; then
            log_pass "Directory exists: $dir"
        else
            log_fail "Directory missing: $dir"
        fi
    done

    subsection "Required Root Files"

    local files=(
        "CLAUDE.md"
        "README.md"
        "CHANGELOG.md"
        "LICENSE"
        "bootstrap/init.sh"
    )

    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            log_pass "File exists: $file"
        else
            log_fail "File missing: $file"
        fi
    done

    subsection "Empty File Check"

    local empty_files=$(find . -name "*.md" -size 0 -not -path "./.git/*" 2>/dev/null)
    if [ -n "$empty_files" ]; then
        while IFS= read -r f; do
            log_warn "Empty file: $f"
        done <<< "$empty_files"
    else
        log_pass "No empty markdown files found"
    fi
}

#=============================================================================
# Test 2: Index Files
#=============================================================================

test_index_files() {
    section "2. Index File Tests"

    cd "$CODEBOOK_ROOT"

    subsection "Index File Existence"

    local indexes=(
        "agentdocs/_agent-index.md"
        ".claude/skills/_skill-index.md"
        ".claude/rules/_rules-index.md"
        "checklists/_checklists-index.md"
        "devdocs/_devdocs-index.md"
        "guides/_guides-index.md"
        "standards/_standards-index.md"
        "workflows/_workflows-index.md"
        "buildlogs/_buildlog-index.md"
        "templates/_templates-index.md"
    )

    for idx in "${indexes[@]}"; do
        if [ -f "$idx" ]; then
            # Check it has content
            local lines=$(wc -l < "$idx" | tr -d ' ')
            if [ "$lines" -gt 10 ]; then
                log_pass "Index valid: $idx ($lines lines)"
            else
                log_warn "Index too short: $idx ($lines lines)"
            fi
        else
            log_fail "Index missing: $idx"
        fi
    done

    subsection "Index Has Codebook ID"

    for idx in "${indexes[@]}"; do
        if [ -f "$idx" ]; then
            if grep -q "codebook_id:" "$idx"; then
                log_pass "Has codebook_id: $idx"
            else
                log_fail "Missing codebook_id: $idx"
            fi
        fi
    done
}

#=============================================================================
# Test 3: YAML Preamble Validation
#=============================================================================

test_yaml_preambles() {
    section "3. YAML Preamble Tests"

    cd "$CODEBOOK_ROOT"

    subsection "Required Fields Check"

    local required_fields=(
        "document_name"
        "location"
        "codebook_id"
        "version"
        "document_type"
        "purpose"
        "ai_parser_instructions"
    )

    # Sample key files
    local sample_files=(
        "CLAUDE.md"
        "agentdocs/head-cook.agent.md"
        "agentdocs/_agent-index.md"
        ".claude/skills/project-setup.skill.md"
        ".claude/skills/_skill-index.md"
        ".claude/rules/github-cli.rule.md"
        "standards/naming-conventions.md"
        "checklists/security-openssf.checklist.md"
        "workflows/deployment.md"
        "devdocs/architecture/architecture-overview.md"
    )

    for file in "${sample_files[@]}"; do
        if [ -f "$file" ]; then
            local missing=""
            for field in "${required_fields[@]}"; do
                if ! grep -q "^${field}:" "$file" && ! grep -q "^  ${field}:" "$file"; then
                    missing="$missing $field"
                fi
            done

            if [ -z "$missing" ]; then
                log_pass "All required fields: $file"
            else
                log_fail "Missing fields in $file:$missing"
            fi
        else
            log_warn "Sample file not found: $file"
        fi
    done

    subsection "Preamble Format Check (starts with ---)"

    local all_md=$(find . -name "*.md" -not -path "./.git/*" -not -size 0 2>/dev/null | head -20)
    local checked=0
    local valid=0

    while IFS= read -r f; do
        checked=$((checked + 1))
        if head -1 "$f" | grep -q "^---$"; then
            valid=$((valid + 1))
            log_info "Valid preamble: $f"
        else
            log_fail "Invalid preamble start: $f"
        fi
    done <<< "$all_md"

    log_pass "Checked $checked files, $valid have valid preamble format"
}

#=============================================================================
# Test 4: Codebook ID Consistency
#=============================================================================

test_codebook_ids() {
    section "4. Codebook ID Consistency Tests"

    cd "$CODEBOOK_ROOT"

    subsection "ID Format Validation"

    # Check all codebook_id fields match pattern CB-XXX-
    local invalid_ids=$(grep -rh "codebook_id:" --include="*.md" 2>/dev/null | grep -v "CB-[A-Z]" || true)
    if [ -z "$invalid_ids" ]; then
        log_pass "All codebook IDs match CB-XXX- pattern"
    else
        log_fail "Invalid codebook ID format found"
        $VERBOSE && echo "$invalid_ids"
    fi

    subsection "Duplicate ID Check"

    local duplicates=$(grep -rh "codebook_id:" --include="*.md" 2>/dev/null | \
        sed 's/.*codebook_id: *"\?\([^"]*\)"\?.*/\1/' | \
        sort | uniq -d)

    if [ -z "$duplicates" ]; then
        log_pass "No duplicate codebook IDs found"
    else
        log_fail "Duplicate codebook IDs found:"
        echo "$duplicates"
    fi

    subsection "ID Count by Category"

    local total=$(grep -rh "codebook_id:" --include="*.md" 2>/dev/null | wc -l | tr -d ' ')
    log_pass "Total codebook IDs: $total"

    # Count by category
    for cat in AGENT SKILL RULE CHECK ARCH BIZ DATA UI STD WF GUIDE BUILD TPL MASTER; do
        local count=$(grep -rh "codebook_id:.*CB-${cat}" --include="*.md" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$count" -gt 0 ]; then
            log_info "CB-${cat}-*: $count"
        fi
    done
}

#=============================================================================
# Test 5: Cross-Reference Validation
#=============================================================================

test_cross_references() {
    section "5. Cross-Reference Tests"

    cd "$CODEBOOK_ROOT"

    subsection "@ref() References"

    local refs=$(grep -roh "@ref(CB-[A-Z0-9-]*)" --include="*.md" 2>/dev/null | sort -u)
    local ref_count=0
    local ref_valid=0

    while IFS= read -r ref; do
        [ -z "$ref" ] && continue
        ref_count=$((ref_count + 1))
        local id=$(echo "$ref" | sed 's/@ref(\(.*\))/\1/')
        if grep -rq "codebook_id:.*$id" --include="*.md" 2>/dev/null; then
            ref_valid=$((ref_valid + 1))
            log_info "Valid ref: $id"
        else
            log_fail "Broken @ref(): $id"
        fi
    done <<< "$refs"

    if [ "$ref_count" -eq "$ref_valid" ]; then
        log_pass "All $ref_count @ref() references are valid"
    else
        log_fail "$((ref_count - ref_valid)) broken @ref() references"
    fi

    subsection "@skill() References"

    local skills=$(grep -roh "@skill([a-z-]*)" --include="*.md" 2>/dev/null | sort -u)
    local skill_count=0
    local skill_valid=0

    while IFS= read -r skill_ref; do
        [ -z "$skill_ref" ] && continue
        skill_count=$((skill_count + 1))
        local skill=$(echo "$skill_ref" | sed 's/@skill(\(.*\))/\1/')
        if [ -f ".claude/skills/${skill}.skill.md" ]; then
            skill_valid=$((skill_valid + 1))
            log_info "Valid skill: $skill"
        else
            log_fail "Broken @skill(): $skill"
        fi
    done <<< "$skills"

    if [ "$skill_count" -eq "$skill_valid" ]; then
        log_pass "All $skill_count @skill() references are valid"
    else
        log_fail "$((skill_count - skill_valid)) broken @skill() references"
    fi

    subsection "@rule() References"

    local rules=$(grep -roh "@rule([a-z-]*)" --include="*.md" 2>/dev/null | sort -u)
    local rule_count=0
    local rule_valid=0

    while IFS= read -r rule_ref; do
        [ -z "$rule_ref" ] && continue
        rule_count=$((rule_count + 1))
        local rule=$(echo "$rule_ref" | sed 's/@rule(\(.*\))/\1/')
        # Rules might have different naming (e.g., github-cli vs gh)
        if ls .claude/rules/*"${rule}"*.rule.md 2>/dev/null | head -1 | grep -q .; then
            rule_valid=$((rule_valid + 1))
            log_info "Valid rule: $rule"
        elif ls .claude/rules/*.rule.md 2>/dev/null | xargs grep -l "CLI.*$rule\|$rule.*CLI" 2>/dev/null | head -1 | grep -q .; then
            rule_valid=$((rule_valid + 1))
            log_info "Valid rule (alias): $rule"
        else
            log_warn "Unverified @rule(): $rule (may be alias)"
        fi
    done <<< "$rules"

    log_pass "Checked $rule_count @rule() references"
}

#=============================================================================
# Test 6: Content Integrity
#=============================================================================

test_content_integrity() {
    section "6. Content Integrity Tests"

    cd "$CODEBOOK_ROOT"

    subsection "CLAUDE.md Required Sections"

    local claude_sections=(
        "PRE-FLIGHT CHECKLIST"
        "IMPORT REGISTRY"
        "DECISION TREES"
        "ORCHESTRATION PROTOCOLS"
        "QUICK REFERENCES"
        "BUILDLOG REQUIREMENTS"
        "CODEBOOK ID SYSTEM"
    )

    for section in "${claude_sections[@]}"; do
        if grep -q "$section" CLAUDE.md; then
            log_pass "CLAUDE.md has: $section"
        else
            log_fail "CLAUDE.md missing: $section"
        fi
    done

    subsection "Head Cook Agent Sections"

    if [ -f "agentdocs/head-cook.agent.md" ]; then
        local agent_sections=(
            "IDENTITY"
            "RESPONSIBILITIES"
            "SKILLS"
            "DECISION AUTHORITY"
        )

        for section in "${agent_sections[@]}"; do
            if grep -iq "$section" "agentdocs/head-cook.agent.md"; then
                log_pass "head-cook.agent.md has: $section"
            else
                log_fail "head-cook.agent.md missing: $section"
            fi
        done
    else
        log_fail "head-cook.agent.md not found"
    fi

    subsection "CLI Rules Safety Sections"

    local rules_checked=0
    local rules_with_safety=0

    for rule in .claude/rules/*.rule.md; do
        [ -f "$rule" ] || continue
        [[ "$(basename "$rule")" == "_"* ]] && continue
        rules_checked=$((rules_checked + 1))
        if grep -q "SAFETY RULES\|SAFETY GUIDELINES\|Critical Safety" "$rule"; then
            rules_with_safety=$((rules_with_safety + 1))
            log_info "Has safety section: $(basename "$rule")"
        else
            log_fail "Missing safety section: $(basename "$rule")"
        fi
    done

    log_pass "$rules_with_safety/$rules_checked CLI rules have safety sections"
}

#=============================================================================
# Test 7: Bootstrap Functionality
#=============================================================================

test_bootstrap() {
    section "7. Bootstrap Functionality Tests"

    mkdir -p "$TEST_DIR"

    subsection "Fresh Install Test"

    local install_dir="$TEST_DIR/fresh-install"
    mkdir -p "$install_dir"

    # Run bootstrap
    if bash "$CODEBOOK_ROOT/bootstrap/init.sh" "$install_dir" > /dev/null 2>&1; then
        log_pass "Bootstrap script executed successfully"

        # Check directories created
        local expected_dirs=(".claude" "agentdocs" "buildlogs" "checklists" "devdocs" "guides" "standards" "templates" "workflows")
        for dir in "${expected_dirs[@]}"; do
            if [ -d "$install_dir/$dir" ]; then
                log_pass "Created directory: $dir"
            else
                log_fail "Missing directory: $dir"
            fi
        done

        # Check CLAUDE.md
        if [ -f "$install_dir/CLAUDE.md" ]; then
            log_pass "CLAUDE.md created"
        else
            log_fail "CLAUDE.md not created"
        fi

        # Check version file
        if [ -f "$install_dir/.claude/codebook-version" ]; then
            local version=$(cat "$install_dir/.claude/codebook-version")
            log_pass "Version file created: $version"
        else
            log_fail "Version file not created"
        fi

        # Check skills directory has files
        local skill_count=$(find "$install_dir/.claude/skills" -name "*.skill.md" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$skill_count" -gt 30 ]; then
            log_pass "Skills installed: $skill_count files"
        else
            log_fail "Skills not fully installed: only $skill_count files"
        fi

        # Check rules directory has files
        local rule_count=$(find "$install_dir/.claude/rules" -name "*.rule.md" 2>/dev/null | wc -l | tr -d ' ')
        if [ "$rule_count" -gt 5 ]; then
            log_pass "Rules installed: $rule_count files"
        else
            log_fail "Rules not fully installed: only $rule_count files"
        fi
    else
        log_fail "Bootstrap script failed to execute"
    fi

    subsection "Update Mode Test"

    local update_dir="$TEST_DIR/update-test"
    mkdir -p "$update_dir"

    # First install
    bash "$CODEBOOK_ROOT/bootstrap/init.sh" "$update_dir" > /dev/null 2>&1

    # Run update
    if bash "$CODEBOOK_ROOT/bootstrap/init.sh" --update "$update_dir" > /dev/null 2>&1; then
        log_pass "Update mode executed successfully"

        # Check backup created
        if [ -d "$update_dir/.codebook-backup" ]; then
            local backup_count=$(ls -1 "$update_dir/.codebook-backup" 2>/dev/null | wc -l | tr -d ' ')
            log_pass "Backup directory created with $backup_count backups"
        else
            log_fail "Backup directory not created"
        fi
    else
        log_fail "Update mode failed"
    fi
}

#=============================================================================
# Test 8: File Count Validation
#=============================================================================

test_file_counts() {
    section "8. File Count Validation"

    cd "$CODEBOOK_ROOT"

    subsection "Expected File Counts"

    # Skills
    local skill_count=$(find .claude/skills -name "*.skill.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$skill_count" -ge 35 ]; then
        log_pass "Skills: $skill_count files (expected 35+)"
    else
        log_fail "Skills: $skill_count files (expected 35+)"
    fi

    # Rules
    local rule_count=$(find .claude/rules -name "*.rule.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$rule_count" -ge 9 ]; then
        log_pass "CLI Rules: $rule_count files (expected 9+)"
    else
        log_fail "CLI Rules: $rule_count files (expected 9+)"
    fi

    # Agent templates
    local template_count=$(find agentdocs/templates -name "*.template.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$template_count" -ge 14 ]; then
        log_pass "Agent templates: $template_count files (expected 14+)"
    else
        log_fail "Agent templates: $template_count files (expected 14+)"
    fi

    # Checklists
    local checklist_count=$(find checklists -name "*.checklist.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$checklist_count" -ge 2 ]; then
        log_pass "Checklists: $checklist_count files (expected 2+)"
    else
        log_fail "Checklists: $checklist_count files (expected 2+)"
    fi

    # Total markdown files
    local total_md=$(find . -name "*.md" -not -path "./.git/*" 2>/dev/null | wc -l | tr -d ' ')
    log_pass "Total markdown files: $total_md"
}

#=============================================================================
# Main
#=============================================================================

main() {
    echo ""
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║           CODEBOOK VALIDATION TEST SUITE                      ║${NC}"
    echo -e "${BLUE}║                    v1.1.0                                     ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Codebook Root: $CODEBOOK_ROOT"
    echo "Test Directory: $TEST_DIR"
    echo ""

    # Run all tests
    test_directory_structure
    test_index_files
    test_yaml_preambles
    test_codebook_ids
    test_cross_references
    test_content_integrity
    test_bootstrap
    test_file_counts

    # Summary
    section "TEST SUMMARY"

    echo ""
    echo -e "  ${GREEN}Passed:${NC}   $PASS"
    echo -e "  ${RED}Failed:${NC}   $FAIL"
    echo -e "  ${YELLOW}Warnings:${NC} $WARN"
    echo ""

    local total=$((PASS + FAIL))
    local percent=$((PASS * 100 / total))

    if [ "$FAIL" -eq 0 ]; then
        echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}  ALL TESTS PASSED! ($percent%)${NC}"
        echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
        exit 0
    else
        echo -e "${RED}═══════════════════════════════════════════════════════════════${NC}"
        echo -e "${RED}  $FAIL TESTS FAILED ($percent% pass rate)${NC}"
        echo -e "${RED}═══════════════════════════════════════════════════════════════${NC}"
        exit 1
    fi
}

main "$@"
