#!/usr/bin/env bash
# =============================================================================
# inject-context.sh
# =============================================================================
# Purpose: Runs on every UserPromptSubmit hook. Reads the user's prompt from
#          stdin and checks if any company, contact, or deal names match files
#          in the memory system. If a match is found, outputs relevant context
#          so Claude has immediate access to deal intelligence without the user
#          having to say "look up the file for X."
#
# How it works:
#   1. Reads the user's prompt from stdin
#   2. Converts it to lowercase for case-insensitive matching
#   3. Scans data/memory/companies/, data/memory/contacts/, and data/memory/deals/
#      for filenames that match words in the prompt
#   4. If matches are found, outputs a brief context injection listing the
#      matched files and key details
#   5. If no matches are found, outputs nothing (zero noise)
#
# Performance considerations:
#   - Only reads filenames, not file contents (fast even with many files)
#   - Timeout is 5 seconds — if the scan takes longer, it exits silently
#   - Uses simple string matching, not regex (faster, fewer edge cases)
#
# Edge cases handled:
#   - Empty prompt → no output
#   - No memory files exist → no output
#   - File names with spaces or special characters → handled via proper quoting
#   - Multiple matches → all reported
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Determine the plugin root directory. This script lives in scripts/, so the
# plugin root is one level up from this script's directory.
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
MEMORY_DIR="${PLUGIN_ROOT}/data/memory"

# ---------------------------------------------------------------------------
# Read the user's prompt from stdin. The Claude Code hook system pipes the
# user's message to this script via stdin. If stdin is empty or not available,
# we exit silently — no context to match against.
# ---------------------------------------------------------------------------
user_prompt=""
if [[ -t 0 ]]; then
    # stdin is a terminal (not piped) — no prompt to read
    exit 0
fi

# Read all of stdin into a variable
user_prompt="$(cat)"

# If the prompt is empty, exit silently
if [[ -z "$user_prompt" ]]; then
    exit 0
fi

# Convert prompt to lowercase for case-insensitive matching
prompt_lower="$(echo "$user_prompt" | tr '[:upper:]' '[:lower:]')"

# ---------------------------------------------------------------------------
# Scan memory directories for matching file names. We check three directories:
#   - companies/  — company profiles and battle cards
#   - contacts/   — individual contact records
#   - deals/      — active deal files
#
# Matching strategy: For each .md file in these directories, extract the
# filename (without extension), convert to a human-readable form (replace
# hyphens and underscores with spaces), and check if any part of it appears
# in the user's prompt. This handles cases like:
#   - File: "meridian-media.md" → matches prompt containing "meridian" or "meridian media"
#   - File: "marcus-lee.md" → matches prompt containing "marcus" or "marcus lee"
# ---------------------------------------------------------------------------
matched_files=()
matched_labels=()

# Function to scan a directory for matching files
# Arguments: $1 = directory path, $2 = label (e.g., "Company", "Contact", "Deal")
scan_directory() {
    local dir="$1"
    local label="$2"

    # Skip if directory doesn't exist
    [[ -d "$dir" ]] || return 0

    # Iterate over all .md files in the directory
    for filepath in "$dir"/*.md; do
        # Skip if no .md files exist (glob didn't match)
        [[ -e "$filepath" ]] || continue

        # Extract filename without extension and path
        local filename
        filename="$(basename "$filepath" .md)"

        # Convert filename to a matchable form:
        # "meridian-media" → "meridian media"
        # "marcus_lee" → "marcus lee"
        local matchable
        matchable="$(echo "$filename" | sed 's/[-_]/ /g' | tr '[:upper:]' '[:lower:]')"

        # Check if the full matchable name appears in the prompt
        if [[ "$prompt_lower" == *"$matchable"* ]]; then
            matched_files+=("$filepath")
            matched_labels+=("${label}: ${matchable}")
            continue
        fi

        # Also check individual words from the filename (but only if they're
        # at least 4 characters to avoid false positives on short words like
        # "the", "and", "for", etc.)
        for word in $matchable; do
            if [[ ${#word} -ge 4 && "$prompt_lower" == *"$word"* ]]; then
                # Verify it's a word boundary match, not a substring
                # e.g., "snap" should match "snap" but not "snapshot"
                # Simple heuristic: check if the word appears surrounded by
                # spaces, punctuation, or at the start/end of the prompt
                if echo "$prompt_lower" | grep -qw "$word" 2>/dev/null; then
                    matched_files+=("$filepath")
                    matched_labels+=("${label}: ${matchable}")
                    break
                fi
            fi
        done
    done
}

# Scan each memory directory
scan_directory "${MEMORY_DIR}/companies" "Company"
scan_directory "${MEMORY_DIR}/contacts" "Contact"
scan_directory "${MEMORY_DIR}/deals" "Deal"

# ---------------------------------------------------------------------------
# If matches were found, output context for Claude to use. The output format
# is designed to be helpful but concise — just enough to trigger Claude to
# read the relevant files, not a full dump of their contents.
#
# If no matches were found, output nothing. Silence is better than noise.
# ---------------------------------------------------------------------------
if [[ ${#matched_files[@]} -eq 0 ]]; then
    exit 0
fi

# Remove duplicates (same file matched via multiple words)
declare -A seen_files
unique_labels=()
unique_files=()
for i in "${!matched_files[@]}"; do
    filepath="${matched_files[$i]}"
    if [[ -z "${seen_files[$filepath]:-}" ]]; then
        seen_files["$filepath"]=1
        unique_labels+=("${matched_labels[$i]}")
        unique_files+=("${matched_files[$i]}")
    fi
done

# Build the context output
echo "Sales context match: ${#unique_files[@]} file(s) found in memory."
for i in "${!unique_labels[@]}"; do
    echo "  - ${unique_labels[$i]} → ${unique_files[$i]}"
done
echo "Read these files for relevant deal intelligence before responding."
