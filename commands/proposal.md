---
name: proposal
description: |
  Generate a structured sales proposal using the SCRAP framework,
  then dispatch the proposal-reviewer agent for quality review.
  Pulls from deal context, company pain points, and relevant case studies.
usage: /proposal [company] [deal-value] [deal-type]
arguments:
  - name: company
    description: The company name the proposal is for
    required: true
  - name: deal-value
    description: "The proposed deal value (e.g., 350000 or 350K)"
    required: false
  - name: deal-type
    description: "Type of deal (e.g., new-business, expansion, renewal, upsell)"
    required: false
    default: new-business
---

# /proposal [company] [deal-value] [deal-type]

## What This Command Does

Generates a complete sales proposal following the SCRAP framework (Situation, Complication, Resolution, Action, Proof). After generation, automatically dispatches the proposal-reviewer agent to run the 10-point quality gate. The user receives both the proposal and the review with fix recommendations.

## Execution Steps

### 1. Load Full Deal Context

```
Read data/memory/deals/[company].md — deal stage, history, MEDDIC scores
Read data/memory/companies/[company].md — pain points, industry, strategic priorities
Glob data/memory/contacts/* — all contacts at this company
Read data/memory/learnings/proposal-effectiveness.md — what's worked before
Read data/templates/proposal-template.md — structural skeleton
Read data/frameworks/meddic.md — for qualification context
```

If deal file doesn't exist:
- Warn the user: "No deal file found for [company]. A proposal without discovery context will be generic. Consider running /analyze-deal first."
- If user wants to proceed, create a deal file from available information

If deal value is not provided:
- Check the deal file for a value
- If none found, ask the user

### 2. Validate Readiness

Before generating a proposal, check:
- Is the deal at Stage 3 (Qualification) or later? If not, warn: "This deal is at Stage [N]. Proposals sent before qualification have a <15% close rate. Consider completing qualification first."
- Is the MEDDIC score >= 30? If not, flag specific gaps that should be addressed before proposing.
- Has pain been validated (Identify Pain score >= 6)? If not, warn: "Pain hasn't been deeply validated. The Complication section will be weak."

These are warnings, not blockers — the user can proceed.

### 3. Build the Proposal (SCRAP)

**Situation (10% of content):**
- Pull from company file: business context, strategic priorities, industry position
- Reference specific things learned in discovery conversations
- Use buyer's language, not yours
- First sentence should prove you understand their world

**Complication (15% of content):**
- Pull from deal file: validated pain points with quantified impact
- Structure as 2-3 compounding dynamics
- Include trend line (getting worse without action)
- Calculate cost of inaction

**Resolution (25% of content):**
- Map each complication to a specific capability
- Frame as outcomes, not features
- Include timeline to value
- Reference implementation approach at high level

**Action (15% of content):**
- State the investment clearly
- Present 3 tiers if appropriate (Premium / Standard / Starter)
- Provide a phased timeline with milestones
- List what you need from them
- Define success at 30/60/90 days
- Include the mutual action plan

**Proof (35% of content):**
- Select 2-3 case studies using the selection logic (prioritize: same industry > similar size > same pain > similar value > recent > named > quantified)
- Include quantified results from each case study
- Add customer quotes if available
- List relevant team credentials
- Include any third-party validation

### 4. Calculate Value

Apply the Value Quantification Methodology:
- ROI percentage with transparent inputs
- Payback period
- Cost of inaction
- Sensitivity analysis (at 60% of projected performance)

### 5. Run Quality Gate (Dispatch Proposal Reviewer)

Dispatch the proposal-reviewer agent to review the generated proposal:
- Run all 10 quality gate checks
- Identify top 5 issues
- Provide rewritten versions of any failing sections
- Give a send recommendation (Ready / Revise / Major Revision)

Present both the proposal and the review to the user.

### 6. Update Memory

- Update deal file with: proposal date, proposed value, key terms, pricing tier
- Log to `data/memory/learnings/proposal-effectiveness.md` (entry created, outcome TBD)
- Update contact files if the proposal reveals stakeholder gaps

## Example Usage

```
/proposal meridian-media 350000 new-business
/proposal snap 275K expansion
/proposal "Johnson & Johnson" 1.2M renewal
/proposal meridian-media  (uses deal file value if available)
```

## Output Format

The proposal follows the SCRAP structure from `skills/proposal-craft/SKILL.md`, followed immediately by the proposal-reviewer agent's quality assessment. The user sees both the draft and the critique in a single output.
