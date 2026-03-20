---
name: battle-card
description: |
  Generate or update a competitive battle card for a specific competitor.
  Includes positioning, strengths/weaknesses, objection responses, trap
  questions, and pricing intelligence.
usage: /battle-card [competitor-name]
arguments:
  - name: competitor-name
    description: The name of the competitor to analyze
    required: true
---

# /battle-card [competitor-name]

## What This Command Does

Generates a comprehensive competitive battle card for the specified competitor. If a battle card already exists, it updates it with any new intelligence. The battle card is designed to be a quick-reference tool a rep can pull up during a live conversation.

## Execution Steps

### 1. Check Existing Intelligence

```
Read data/memory/companies/[competitor-name]-battlecard.md  (if exists)
Grep data/memory/deals/ for mentions of [competitor-name]
Grep data/memory/wins/ for deals won against [competitor-name]
Grep data/memory/losses/ for deals lost to [competitor-name]
Read data/memory/learnings/win-rate-factors.md
```

### 2. Gather Intelligence

**If battle card exists (update mode):**
- Check last updated date — if > 90 days, flag as stale and refresh
- Use WebSearch to find news, product changes, and pricing updates since last refresh
- Cross-reference with any new deal outcomes against this competitor
- Update relevant sections while preserving validated intelligence

**If no battle card exists (create mode):**
- Use WebSearch to research:
  - Company overview, size, funding, and leadership
  - Product capabilities, target market, and pricing model
  - Customer reviews, complaints, and case studies they publish
  - Recent news, product launches, and strategic changes
  - Technology partnerships and integrations
- Use WebFetch on the competitor's website for product and pricing details
- Cross-reference with any internal deal data mentioning this competitor

### 3. Build SWOT Analysis

Apply the SWOT methodology from the competitor-intel skill:
- Strengths: evidence-based, specific, categorized
- Weaknesses: validated by customer feedback or deal outcomes
- Opportunities: external factors that could help them
- Threats: external factors that could hurt them
- For each quadrant: action translation (how to leverage or defend)

### 4. Build Positioning Matrix

Score both your solution and the competitor across 10 dimensions (1-5 each):
- Product Breadth, Product Depth, Ease of Use, Integration Ecosystem
- Data & Analytics, Customer Support, Pricing Flexibility
- Brand / Reputation, Innovation Velocity, Vertical Expertise

For each dimension, provide a one-sentence talk track.

### 5. Design Trap Questions

Create 3-5 trap questions following the design methodology:
- Start with a real weakness
- Frame as a buyer question (not an attack)
- Include expected answers and follow-ups
- Test each question: would it sound natural in a conversation?

### 6. Identify Landmines

Document competitor claims that don't hold up under scrutiny:
- What they'll say
- What's actually true
- The follow-up question that exposes the gap

### 7. Compile Pricing Intel

Document everything known about their pricing:
- Pricing model and structure
- Typical price range
- Hidden costs (implementation, minimums, overages)
- Response strategy if they're cheaper

### 8. Generate the Battle Card

Use the battle card template from the competitor-intel skill. The output must be scannable — a rep should be able to find any section in under 10 seconds.

### 9. Save to Memory

- Save to `data/memory/companies/[competitor-name]-battlecard.md`
- Update any deal files where this competitor is mentioned
- Log the creation/update date for freshness tracking

## Example Usage

```
/battle-card tradedesk
/battle-card "Google DV360"
/battle-card criteo
/battle-card magnite
```

## Output Format

See the battle card template and example in `skills/competitor-intel/SKILL.md`.
