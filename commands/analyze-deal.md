---
name: analyze-deal
description: |
  Analyze a specific deal using MEDDIC scoring, stage-gate validation,
  and risk assessment. Outputs a Deal Health Card with scoring, risk
  factors, and prioritized next actions.
usage: /analyze-deal [company-name]
arguments:
  - name: company-name
    description: The name of the company to analyze
    required: true
---

# /analyze-deal [company-name]

## What This Command Does

Performs a comprehensive deal health assessment for the specified company using the MEDDIC framework. Produces a Deal Health Card that includes qualification scoring, stage validation, risk assessment, and recommended next actions.

## Execution Steps

### 1. Load Deal Context

```
Read data/memory/deals/[company-name].md
Read data/memory/companies/[company-name].md
Glob data/memory/contacts/*[company-name]* OR scan all contacts for company match
Read data/memory/learnings/stage-progression.md
Read data/memory/learnings/win-rate-factors.md
```

If no deal file exists for this company:
- Check if a company file exists — if yes, create a deal file from available context
- If neither exists, ask the user for: company name, deal value, current stage, key contacts, and timeline
- Create both company and deal files from the information gathered

### 2. Run MEDDIC Scoring

Load the MEDDIC framework from `skills/deal-analysis/SKILL.md` and score each dimension:

- **Metrics (M):** Score 1-10 based on evidence of quantified business impact
- **Economic Buyer (E):** Score 1-10 based on identification and engagement level
- **Decision Criteria (D):** Score 1-10 based on understanding and influence of evaluation criteria
- **Decision Process (D):** Score 1-10 based on mapped and validated buying process
- **Identify Pain (I):** Score 1-10 based on depth and urgency of validated pain
- **Champion (C):** Score 1-10 based on internal advocate strength and motivation

For each dimension, provide:
- The numerical score
- Supporting evidence (specific facts, quotes, or observations)
- The gap (what's missing to score higher)

### 3. Validate Deal Stage

Cross-reference the deal's claimed stage against the stage-gate criteria:
- List each gate criterion for the claimed stage
- Mark each as PASSED or FAILED
- If any critical gate fails, recommend the correct stage
- Be honest — stage inflation is the #1 forecasting error

### 4. Assess Risk

Calculate the weighted risk score using the risk model:
- Score each of the 7 risk factors (0-10)
- Apply weights to calculate overall risk score
- Categorize as Low / Moderate / High / Critical
- Identify the top 3 risk factors with specific explanations

### 5. Generate Next Actions

Based on the lowest MEDDIC scores and highest risk factors:
- Recommend 3 specific next actions in priority order
- Each action must include: what to do, why, who owns it, and a deadline
- Actions should be concrete enough to execute without further guidance

### 6. Output the Deal Health Card

Use the Deal Health Card template from the deal-analysis skill.

### 7. Update Memory

- Write or update `data/memory/deals/[company-name].md` with:
  - Updated MEDDIC scores
  - Date of analysis
  - Risk assessment summary
  - Recommended next actions
- Update `data/memory/learnings/stage-progression.md` if stage validation revealed a mismatch
- Update contact files if new intelligence was surfaced

## Example Usage

```
/analyze-deal meridian-media
/analyze-deal snap
/analyze-deal "Johnson & Johnson"
```

## Example Output

See the Deal Health Card example in `skills/deal-analysis/SKILL.md` for a complete output demonstration.
