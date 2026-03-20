#!/usr/bin/env bash
# =============================================================================
# load-sales-context.sh
# =============================================================================
# Purpose: Runs at session startup (SessionStart hook) to scan all deal files
#          and produce a compact pipeline summary. This gives Claude immediate
#          context about the user's active pipeline without them having to ask.
#
# How it works:
#   1. Locates the plugin root directory (relative to this script's location)
#   2. Scans data/memory/deals/ for all .md files
#   3. Extracts YAML frontmatter fields: name, stage, value, last_contact
#   4. Calculates days since last contact for stall detection
#   5. Outputs a one-line pipeline summary as additional context
#
# Output format (printed to stdout for Claude to consume):
#   "Active Pipeline: 4 deals worth $3.2M total. 1 at risk (Snap — stalled 14 days)."
#
# Edge cases handled:
#   - No deal files exist → outputs "No active deals in pipeline."
#   - Deal file missing frontmatter fields → skips gracefully
#   - Empty deals directory → handled without errors
#   - Script is run from any working directory → uses absolute paths
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Determine the plugin root directory. This script lives in scripts/, so the
# plugin root is one level up from this script's directory.
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
DEALS_DIR="${PLUGIN_ROOT}/data/memory/deals"

# ---------------------------------------------------------------------------
# Check if the deals directory exists and contains .md files. If not, output
# a simple message and exit cleanly. No deals = no pipeline to summarize.
# ---------------------------------------------------------------------------
if [[ ! -d "$DEALS_DIR" ]]; then
    echo "No active deals in pipeline. Use /analyze-deal to create your first deal record."
    exit 0
fi

# Collect all .md files in the deals directory
deal_files=()
while IFS= read -r -d '' file; do
    deal_files+=("$file")
done < <(find "$DEALS_DIR" -maxdepth 1 -name "*.md" -type f -print0 2>/dev/null)

# If no deal files found, output a message and exit
if [[ ${#deal_files[@]} -eq 0 ]]; then
    echo "No active deals in pipeline. Use /analyze-deal to create your first deal record."
    exit 0
fi

# ---------------------------------------------------------------------------
# Parse each deal file to extract key metrics from YAML frontmatter.
# We look for these frontmatter fields:
#   - name: The company/deal name
#   - stage: Current pipeline stage (1-6)
#   - value: Deal value in dollars
#   - last_contact: Date of last meaningful contact (YYYY-MM-DD)
# ---------------------------------------------------------------------------
total_value=0
deal_count=0
at_risk_deals=()
deal_summaries=()
today_epoch=$(date +%s)

for deal_file in "${deal_files[@]}"; do
    # Extract frontmatter values using simple grep + sed
    # We read until the closing --- of the frontmatter block
    name=""
    stage=""
    value=""
    last_contact=""
    in_frontmatter=false

    while IFS= read -r line; do
        # Detect frontmatter boundaries (--- at start and end)
        if [[ "$line" == "---" ]]; then
            if [[ "$in_frontmatter" == false ]]; then
                in_frontmatter=true
                continue
            else
                # End of frontmatter — stop reading
                break
            fi
        fi

        # Only parse lines inside frontmatter
        if [[ "$in_frontmatter" == true ]]; then
            # Extract key: value pairs, trimming whitespace and quotes
            case "$line" in
                name:*)
                    name="$(echo "$line" | sed 's/^name:[[:space:]]*//' | sed 's/^["'\'']//' | sed 's/["'\'']$//')"
                    ;;
                stage:*)
                    stage="$(echo "$line" | sed 's/^stage:[[:space:]]*//' | sed 's/^["'\'']//' | sed 's/["'\'']$//')"
                    ;;
                value:*)
                    value="$(echo "$line" | sed 's/^value:[[:space:]]*//' | sed 's/[^0-9]//g')"
                    ;;
                last_contact:*)
                    last_contact="$(echo "$line" | sed 's/^last_contact:[[:space:]]*//' | sed 's/^["'\'']//' | sed 's/["'\'']$//')"
                    ;;
            esac
        fi
    done < "$deal_file"

    # Skip files that don't have a name (not a valid deal file)
    if [[ -z "$name" ]]; then
        continue
    fi

    # Increment deal count
    deal_count=$((deal_count + 1))

    # Add value to total (default to 0 if not set or not a number)
    if [[ -n "$value" && "$value" =~ ^[0-9]+$ ]]; then
        total_value=$((total_value + value))
    fi

    # ---------------------------------------------------------------------------
    # Check for stall risk: if last_contact is more than 14 days ago, the deal
    # is considered at risk. This is a simple heuristic — the deal-analysis
    # skill does more sophisticated risk scoring.
    # ---------------------------------------------------------------------------
    if [[ -n "$last_contact" ]]; then
        # Convert last_contact date to epoch for comparison
        # macOS date and GNU date have different syntax, so we try both
        if contact_epoch=$(date -j -f "%Y-%m-%d" "$last_contact" +%s 2>/dev/null); then
            : # macOS date succeeded
        elif contact_epoch=$(date -d "$last_contact" +%s 2>/dev/null); then
            : # GNU date succeeded
        else
            contact_epoch=""
        fi

        if [[ -n "$contact_epoch" ]]; then
            days_since=$(( (today_epoch - contact_epoch) / 86400 ))
            if [[ $days_since -ge 14 ]]; then
                at_risk_deals+=("${name} — stalled ${days_since} days")
            fi
        fi
    fi

    # Build a brief summary for each deal
    stage_display="${stage:-?}"
    deal_summaries+=("${name} (Stage ${stage_display})")
done

# ---------------------------------------------------------------------------
# Format the output as a concise pipeline summary. This is injected into the
# Claude session as context so the assistant knows the pipeline state
# without the user having to explain it.
# ---------------------------------------------------------------------------

# Format total value in human-readable form (e.g., $3.2M, $450K)
if [[ $total_value -ge 1000000 ]]; then
    # Format as millions with one decimal place
    millions=$(echo "scale=1; $total_value / 1000000" | bc 2>/dev/null || echo "$((total_value / 1000000))")
    formatted_value="\$${millions}M"
elif [[ $total_value -ge 1000 ]]; then
    # Format as thousands
    thousands=$((total_value / 1000))
    formatted_value="\$${thousands}K"
elif [[ $total_value -gt 0 ]]; then
    formatted_value="\$${total_value}"
else
    formatted_value="\$0"
fi

# Build the output string
output="Active Pipeline: ${deal_count} deal"
if [[ $deal_count -ne 1 ]]; then
    output="${output}s"
fi
output="${output} worth ${formatted_value} total."

# Add risk information if any deals are stalled
if [[ ${#at_risk_deals[@]} -gt 0 ]]; then
    risk_count=${#at_risk_deals[@]}
    output="${output} ${risk_count} at risk ("
    # Join risk deals with ", "
    first=true
    for risk_deal in "${at_risk_deals[@]}"; do
        if [[ "$first" == true ]]; then
            output="${output}${risk_deal}"
            first=false
        else
            output="${output}, ${risk_deal}"
        fi
    done
    output="${output})."
fi

echo "$output"
