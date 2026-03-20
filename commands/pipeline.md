---
name: pipeline
description: |
  Analyze pipeline health, generate forecasts, identify at-risk deals,
  and measure deal velocity. Reads all active deals and produces
  actionable analytics.
usage: /pipeline [action]
arguments:
  - name: action
    description: "One of: review, forecast, risk, velocity. Defaults to review."
    required: false
    default: review
---

# /pipeline [action]

## What This Command Does

Performs pipeline analytics across all active deals. Four action modes provide different lenses on pipeline health.

| Action | Purpose | Output |
|---|---|---|
| `review` | Full pipeline summary with health scores per deal | Pipeline Review report |
| `forecast` | Weighted forecast with commit/upside/best-case categories | Forecast report |
| `risk` | Identifies deals with declining health or stalled progression | Risk report |
| `velocity` | Average days per stage, conversion rates, bottleneck analysis | Velocity report |

## Execution Steps

### 1. Load All Pipeline Data

```
Glob data/memory/deals/*.md — read every active deal file
Glob data/memory/companies/*.md — read all company context
Glob data/memory/wins/*.md — historical wins for benchmarking
Glob data/memory/losses/*.md — historical losses for pattern recognition
Read data/memory/learnings/stage-progression.md — velocity benchmarks
Read data/memory/learnings/win-rate-factors.md — predictive factors
```

### 2. Parse Deal Data

For each deal file, extract:
- Company name
- Deal value
- Current stage (1-6)
- MEDDIC score (if available)
- Close date (target)
- Last contact date
- Days in current stage
- Key contacts and champion status
- Competitive landscape
- Risk factors

### 3. Execute the Requested Action

#### Action: `review`

1. Calculate total pipeline (raw sum of all deal values)
2. Calculate weighted pipeline (each deal x stage probability x health modifiers)
3. Calculate coverage ratio (pipeline value / quota target, if known)
4. Build stage distribution table
5. Rank top deals by weighted value
6. Flag deals requiring attention (stalled, understaged, single-threaded)
7. Calculate pipeline trend (new vs. aged out in last 30 days)
8. Generate top 3 prioritized recommendations

Dispatch the pipeline-analyst agent to generate the full Pipeline Review output.

#### Action: `forecast`

1. Categorize each deal:
   - **Commit (85%+):** High MEDDIC score, strong champion, clear timeline, economic buyer engaged
   - **Upside (50-84%):** Good qualification but 1-2 gaps, or stage 3-4 without full validation
   - **Best Case (25-49%):** Early stage or significant gaps, but theoretically closeable
2. Calculate weighted value for each category
3. Determine forecast range (sum of Commit = floor, sum of all = ceiling)
4. Identify the 2-3 deals that determine whether you hit target
5. List forecast risks and upside scenarios

Dispatch the pipeline-analyst agent to generate the full Forecast output.

#### Action: `risk`

1. Scan every deal for risk indicators:
   - No activity in 14+ days
   - MEDDIC score below stage minimum
   - Close date pushed 2+ times
   - Single-threaded (only 1 contact)
   - Champion gone quiet
   - No compelling event
   - Competitive threat without battle card
2. Score each risk factor using the weighted risk model
3. Categorize deals as Critical / Elevated / Moderate / Low risk
4. Identify systemic risks (patterns across multiple deals)
5. Generate a mitigation plan with specific actions per deal

Dispatch the pipeline-analyst agent to generate the full Risk Report output.

#### Action: `velocity`

1. Calculate average days per stage transition (current deals + historical)
2. Calculate stage-to-stage conversion rates
3. Determine average sales cycle length (first meeting to close)
4. Segment velocity by deal size, source, and type
5. Identify the bottleneck stage (where deals spend the most time)
6. Compare current velocity to historical benchmarks
7. Recommend actions to accelerate stuck stages

Dispatch the pipeline-analyst agent to generate the full Velocity Report output.

### 4. Update Memory

- Update `data/memory/learnings/stage-progression.md` with any new velocity data
- Update `data/memory/learnings/win-rate-factors.md` with any new conversion patterns
- Flag deals that need immediate attention in their deal files

## Example Usage

```
/pipeline                — defaults to review
/pipeline review         — full pipeline summary
/pipeline forecast       — weighted forecast with categories
/pipeline risk           — identify at-risk deals
/pipeline velocity       — deal speed and conversion analysis
```

## Output Format

Each action produces a different report format. See the pipeline-analyst agent (`agents/pipeline-analyst.md`) for the full output templates for each action type.
