---
name: proposal-craft
description: |
  Triggers when the user needs to create, review, or improve a sales proposal, SOW,
  or executive summary. Also triggers on "write a proposal", "proposal for [company]",
  "help me with the executive summary", "how should I price this", "ROI calculation",
  "value prop", "business case", "case study selection", or "proposal review".
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - Bash
  - WebSearch
  - WebFetch
---

# Proposal Craft Skill

## When to Use

Activate this skill when:
- User needs to **create a proposal** for a specific deal
- User asks for help with an **executive summary** or value proposition
- User wants to **calculate ROI** or build a business case for a buyer
- User needs to **select case studies** or proof points for a proposal
- User asks for **pricing guidance** or deal structure advice
- User wants a **proposal reviewed** against quality standards
- User is building a **presentation deck** for a client pitch
- User asks about **proposal best practices** or formatting

## Step-by-Step Methodology

### Step 1: Gather Context

1. Read the deal file from `data/memory/deals/` — understand stage, value, key contacts
2. Read the company file from `data/memory/companies/` — understand pain points, industry, competitive landscape
3. Read all contact files for this deal from `data/memory/contacts/` — understand stakeholder priorities
4. Read `data/memory/learnings/proposal-effectiveness.md` — what's worked in past proposals
5. Read `data/templates/proposal-template.md` for the structural skeleton

### Step 2: Apply the SCRAP Framework

Build the proposal following SCRAP (detailed below). Every section must earn its place — if a section doesn't advance the buyer toward "yes," cut it.

### Step 3: Quantify Value

Never submit a proposal without quantified value. Use the Value Quantification Methodology below to calculate ROI, payback period, and cost of inaction.

### Step 4: Select Social Proof

Choose case studies and references using the Case Study Selection Logic below. Wrong case study = worse than no case study.

### Step 5: Structure Pricing

Apply the Pricing Strategy Guidance below. How you present the number matters as much as the number itself.

### Step 6: Run Quality Gate

Before finalizing, run the proposal through the 10-Point Quality Gate. Every point must pass. No exceptions for "the client needs it today."

### Step 7: Update Memory

- Update the deal file with proposal details (date sent, value proposed, key terms)
- Log to `data/memory/learnings/proposal-effectiveness.md` after outcome is known

---

## SCRAP Framework — Proposal Structure

SCRAP is designed for executive readers who will spend 90 seconds on your proposal before deciding whether to read more. Front-load the insight, not the product description.

### S — Situation (10% of proposal)

**Purpose:** Prove you understand their world before you ask them to consider yours.

**What to include:**
- Their business context: industry position, strategic priorities, recent developments
- The specific challenge or opportunity that prompted this conversation
- Relevant market dynamics affecting their business

**What NOT to include:**
- Your company history ("Founded in 2005, we are a leading...")
- Generic industry statistics they already know
- Anything that doesn't connect directly to THEIR situation

**How to write it:**
Start with something only YOU could write because you've done the discovery work. The first sentence should make them think "they get us."

**Example:**
"Meridian Media Group is navigating a shift from linear-first to digital-first advertising revenue, with digital now representing 38% of total ad revenue — up from 22% two years ago. This growth has created both opportunity and pressure: your sales team is fielding more RFPs with digital components, but your programmatic infrastructure and data capabilities lag behind your premium content position. The result is a growing gap between the audience you can reach and the audience you can monetize efficiently."

### C — Complication (15% of proposal)

**Purpose:** Articulate the cost of the status quo. Make inaction feel expensive and risky.

**What to include:**
- The specific pain points validated during discovery (use their words, not yours)
- Quantified impact: what is this problem costing them in revenue, margin, time, or competitive position?
- The trend line: is this getting better or worse without intervention?
- What competitors or peers are doing differently

**How to write it:**
This section should create discomfort. Not fear-mongering — honest, evidence-based discomfort. The buyer should read this and think "yes, that's exactly what keeps me up at night."

**Example:**
"Three dynamics are compounding this challenge:

1. **CPA inflation** — Your average cost per acquisition has risen 34% YoY on programmatic channels, outpacing the 12% industry average. At current trajectory, you'll spend $1.8M more in 2027 to acquire the same number of customers as 2026.

2. **Audience fragmentation** — Your first-party data covers 40% of your addressable audience. The remaining 60% is reached through third-party segments that are degrading quarterly as cookie deprecation accelerates. This creates a targeting accuracy problem that directly impacts campaign ROI.

3. **Competitive gap** — Three of your direct competitors (including [named competitor]) have invested in integrated data platforms in the last 18 months. Their pitch to advertisers now includes deterministic audience matching that you can't currently offer."

### R — Resolution (25% of proposal)

**Purpose:** Present your solution as the bridge from complication to desired outcome. Focus on outcomes, not features.

**What to include:**
- How your solution specifically addresses each complication identified
- Expected outcomes tied to the metrics the buyer cares about
- Implementation approach (high-level — not a project plan, a confidence builder)
- Timeline to value: when will they see results?

**Structure this as outcome blocks, not feature lists:**

BAD:
- "Real-time bidding optimization"
- "Cross-device audience graph"
- "Customizable reporting dashboard"

GOOD:
- "Reduce CPA by 25-35% through contextual + behavioral targeting fusion"
- "Reach 85%+ of your addressable audience with deterministic matching"
- "Provide weekly performance insights with recommended optimizations"

**Example:**
"Our proposed solution addresses each of these challenges:

**CPA Reduction: Target 25-35% decrease within 90 days**
By combining our proprietary contextual engine with your first-party audience data, we create a targeting model that's 3x more predictive than third-party segments alone. For Meridian's audience profile, our modeling suggests CPA compression from $42 to $28-$31 within the first campaign flight, based on performance benchmarks from [comparable client].

**Audience Extension: 85%+ addressable reach without third-party dependency**
Our identity graph covers 240M US adults with deterministic matching. Integrated with your CRM data, this extends your targetable audience from 40% to 85%+ of your total addressable market — without reliance on deprecated third-party cookies.

**Competitive Positioning: Data-driven advertising capability within 60 days**
Full platform integration and first campaign live within 60 days of contract signature. Your sales team will have a data story to tell advertisers by Q3, closing the competitive gap before upfront season."

### A — Action (15% of proposal)

**Purpose:** Make the next steps crystal clear. Reduce the cognitive burden of saying yes.

**What to include:**
- Specific investment and what it covers
- Timeline with milestones (not a Gantt chart — a simple phase plan)
- What you need from them (data access, stakeholder time, technical resources)
- What "success" looks like at 30/60/90 days
- The mutual action plan to get from here to signed contract

**How to write it:**
Make it feel easy. The buyer should read this and think "this team has done this before and they'll make it simple for us."

### P — Proof (35% of proposal)

**Purpose:** Eliminate doubt with evidence. This is the longest section because proof is what converts consideration to commitment.

**What to include:**
- 2-3 case studies selected using the logic below
- Quantified results from each case study
- Customer quotes (attributed if possible)
- Awards, certifications, or third-party validation
- Implementation success rate and average time-to-value
- Team credentials (who will work on their account)

**Proof hierarchy (most to least persuasive):**
1. Named customer in their industry with quantified results
2. Named customer in adjacent industry with quantified results
3. Aggregate performance data across your customer base
4. Third-party analyst endorsement or award
5. Your team's credentials and experience

---

## Value Quantification Methodology

### The Three Numbers Every Proposal Needs

**1. ROI Percentage**
```
ROI = (Net Gain from Investment / Cost of Investment) x 100

Net Gain = (Revenue Increase + Cost Savings + Efficiency Gains) - Investment Cost

Example:
- Investment: $350,000 (annual contract)
- Revenue increase from better targeting: $480,000
- Cost savings from CPA reduction: $220,000
- Efficiency gains from automation: $65,000
- Net Gain: $765,000 - $350,000 = $415,000
- ROI: ($415,000 / $350,000) x 100 = 119%
```

**2. Payback Period**
```
Payback Period = Investment / Monthly Net Gain

Example:
- Investment: $350,000
- Monthly net gain: $415,000 / 12 = $34,583
- Payback: $350,000 / $34,583 = 10.1 months

For quarterly contracts, calculate per-quarter payback.
```

**3. Cost of Inaction (The Most Powerful Number)**
```
Cost of Inaction = (Current Loss Rate x Time Period) + (Opportunity Cost of Delay)

Example:
- CPA inflation costs $150K/year extra and growing at 34% YoY
- Competitive gap costs estimated $400K in lost RFP revenue per quarter
- 6-month delay = $75K additional CPA waste + $800K lost revenue opportunity
- Cost of Inaction (6 months): $875,000

Compare: $875K cost of waiting vs. $350K cost of acting.
```

### Value Quantification Rules

1. **Use their numbers, not yours.** If they told you their CPA is $42, use $42. Don't substitute your benchmark.
2. **Be conservative.** If your data says 30% improvement, propose 25%. Under-promise, over-deliver. Credibility is worth more than a bigger number on the slide.
3. **Show your math.** Don't just say "119% ROI." Show every input and assumption. Buyers trust transparent math; they distrust magic numbers.
4. **Include a sensitivity analysis.** "Even if we only achieve 60% of projected improvement, ROI is still 47%." This handles the buyer's internal skepticism.
5. **Tie to THEIR metrics.** If they measure success by ROAS, calculate ROAS. If they care about subscriber growth, calculate subscriber growth. Don't force your metrics on their framework.

---

## Case Study Selection Logic

Wrong case study = worse than no case study. Selection criteria, in priority order:

### Selection Matrix

| Priority | Criterion | Why It Matters |
|---|---|---|
| 1 | Same industry | Buyer thinks "they understand my world" |
| 2 | Similar company size | Buyer thinks "they can handle my scale" |
| 3 | Same pain point | Buyer thinks "they've solved this exact problem" |
| 4 | Similar deal size | Buyer thinks "this is a reasonable investment" |
| 5 | Recent (< 18 months) | Buyer thinks "this is current, not legacy" |
| 6 | Named customer | Buyer can verify; adds credibility |
| 7 | Quantified results | Numbers > adjectives. Always. |

### Selection Rules

- **Must match at least 3 of 7 criteria.** Below 3, the case study creates more questions than answers.
- **Never use a case study from a direct competitor.** The buyer will wonder if you're sharing their data too.
- **Include the customer's challenge, not just the result.** The buyer needs to see themselves in the story.
- **If you don't have a perfect match, acknowledge it.** "While [case study company] is in [different industry], the challenge they faced — [specific challenge] — mirrors yours."

---

## Pricing Strategy Guidance

### Pricing Presentation Principles

1. **Never lead with price.** Price appears AFTER value is established. If the buyer sees $350K before understanding the $875K cost of inaction, $350K feels expensive. After understanding the cost of inaction, $350K feels like a bargain.

2. **Anchor high, offer options.** Present 3 tiers:
   - **Premium:** Full solution + strategic services + priority support ($X)
   - **Standard:** Core solution + standard support ($0.7X)
   - **Starter:** Minimum viable solution to prove value ($0.4X)
   Most buyers choose the middle. The premium makes the standard feel reasonable. The starter gives budget-constrained buyers a path in.

3. **Frame investment, not cost.** Language matters:
   - YES: "The annual investment for the full platform is $350,000"
   - NO: "The cost is $350,000 per year"
   - YES: "At $29K/month, that's less than the cost of one FTE..."
   - NO: "$350K annual contract"

4. **Address TCO proactively.** If your solution replaces existing spend, show the net new investment:
   "Your current programmatic spend is $200K/year with a $42 CPA. Our solution is $350K/year but reduces your CPA to $28. Net new investment: $150K. Net new customer acquisition: 5,400 additional customers. Cost per incremental customer: $27.78."

5. **Build in flexibility for negotiation.** Know your walk-away number before the proposal goes out. Build enough margin that you can offer:
   - Phased implementation (smaller initial commitment)
   - Performance guarantees (shared risk)
   - Longer term = lower annual rate
   - Upfront payment discount

### Pricing Red Flags

- Buyer asks for pricing before discovery is complete → they're shopping, not buying
- Buyer immediately says "that's in our range" → you probably priced too low
- Buyer shares competitor pricing without being asked → negotiation tactic, not a blocker
- Buyer asks for a discount as the first response → test: "What would you need to see to feel the full price is justified?"

---

## 10-Point Proposal Quality Gate

Run every proposal through these checks before sending. Score Pass/Fail on each. Minimum 8/10 to send. Below 8, revise.

### 1. Buyer's Voice Test
**Question:** Would the buyer recognize their own words and priorities in the first page?
**Check:** The Situation and Complication sections reference specific things the buyer said in discovery, not generic industry platitudes. Direct quotes from the buyer appear at least once.
**Fail condition:** You could swap in any company name and the intro would still work.

### 2. So-What Test
**Question:** Does every section answer "so what does this mean for the buyer?"
**Check:** Every feature mentioned is tied to an outcome. Every statistic is tied to an impact. No orphan facts.
**Fail condition:** Any paragraph that describes what you do without explaining why the buyer should care.

### 3. Quantified Value Test
**Question:** Is the financial case clear, specific, and credible?
**Check:** ROI is calculated with transparent inputs. Cost of inaction is stated. Payback period is included. At least one sensitivity scenario.
**Fail condition:** Value is stated in vague terms ("significant improvement", "substantial ROI").

### 4. Proof Relevance Test
**Question:** Would the buyer see themselves in the case studies?
**Check:** Case studies match at least 3/7 selection criteria. Results are quantified. The customer's challenge is described, not just the result.
**Fail condition:** Case studies are from unrelated industries with unrelated challenges.

### 5. Executive Readability Test
**Question:** Could a C-level executive understand the proposal in 3 minutes?
**Check:** Executive summary is under 1 page. No jargon without definition. Clear visual hierarchy (headers, bold, bullets). Key numbers are easy to find.
**Fail condition:** Wall-of-text paragraphs. Acronyms without definitions. Buried punchlines.

### 6. Differentiation Test
**Question:** Does the proposal explain why YOU, not just why this type of solution?
**Check:** At least 2 differentiators are specific to your company/product, not the category. Competitive advantages are stated without naming competitors.
**Fail condition:** The proposal reads like a category pitch. A competitor could put their logo on it and it would still make sense.

### 7. Action Clarity Test
**Question:** Does the buyer know exactly what happens next?
**Check:** Next steps are specific (who does what by when). Investment is clearly stated. Timeline has dates, not just phases. What you need from the buyer is explicit.
**Fail condition:** "We look forward to discussing next steps" — this is a non-action disguised as a closing statement.

### 8. Objection Anticipation Test
**Question:** Does the proposal address the buyer's likely concerns before they raise them?
**Check:** Pricing includes value justification. Implementation section addresses complexity concerns. Risk mitigation is included. Competitive positioning is woven in (without naming names).
**Fail condition:** The proposal assumes the buyer has no concerns and will say yes on first read.

### 9. Consistency Test
**Question:** Are all numbers, names, dates, and claims consistent throughout?
**Check:** Deal value matches between sections. Company name is spelled correctly. Dates in the timeline are realistic. No contradicting claims.
**Fail condition:** Executive summary says $350K, pricing section says $375K. These errors destroy credibility.

### 10. Ask Test
**Question:** Is there a clear, specific ask?
**Check:** The proposal ends with a specific request: "We'd like to schedule a 30-minute review of this proposal on [date]. If the approach aligns, we can have the MSA ready for legal review by [date]."
**Fail condition:** The proposal trails off or ends with "let us know your thoughts."

---

## Learnings Integration

After each proposal:
1. Read `data/memory/learnings/proposal-effectiveness.md`
2. When outcome is known, log:
   ```
   ## [Date] — [Company] — $[Value] — [Won/Lost/Pending]
   - **Proposal approach:** [SCRAP emphasis — which section was strongest?]
   - **Buyer feedback:** [What they said about the proposal, positive and negative]
   - **Winning element:** [What moved them most — pricing, proof, value calc?]
   - **Weakness:** [What they pushed back on or didn't find compelling]
   - **Time from proposal to decision:** [X days]
   - **Lesson:** [One-sentence takeaway for future proposals]
   ```
3. Over time, patterns emerge: which proof types convert best, which pricing structures close fastest, which Complication framings create the most urgency

---

## Example: Executive Summary (Best-in-Class)

```
EXECUTIVE SUMMARY

Meridian Media Group is losing $1.2M annually to CPA inflation and audience
fragmentation — a gap that widens every quarter as third-party data degrades
and competitors invest in first-party infrastructure.

We propose a 12-month strategic partnership ($350K annual investment) to:
- Reduce programmatic CPA by 25-35% (from $42 to $28-31)
- Extend addressable audience reach from 40% to 85%+
- Deliver a live data-driven advertising capability within 60 days

Based on conservative projections, this investment delivers a 119% ROI
with a 10-month payback period. Even at 60% of projected performance,
ROI exceeds 47%.

Three comparable media companies (including [named reference]) achieved
these results within the first two campaign flights. We've included their
case studies and would welcome a reference call with any of them.

Proposed timeline: Contract signature by April 15 → Platform integration
by May 30 → First campaign live by June 15 → Q3 performance review
with optimization recommendations.

We'd like to review this proposal with you and Sarah Chen on [proposed date].
```
