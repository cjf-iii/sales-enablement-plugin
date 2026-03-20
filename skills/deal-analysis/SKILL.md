---
name: deal-analysis
description: |
  Triggers when the user asks to analyze a deal, assess deal health, score a deal,
  validate a deal stage, identify deal risks, or evaluate pipeline quality.
  Also triggers on phrases like "how healthy is this deal", "what's the risk on [company]",
  "is this deal real", "should we forecast this", or "MEDDIC score".
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

# Deal Analysis Skill

## When to Use

Activate this skill when:
- User asks to **analyze** or **assess** a specific deal
- User wants a **MEDDIC score** or deal health rating
- User asks "is this deal real?" or "should I forecast this?"
- User needs **stage-gate validation** (is the deal really at the stage the CRM says?)
- User asks about **deal risk**, stall indicators, or red flags
- User wants a **Deal Health Card** for an upcoming pipeline review
- User mentions reviewing deals before a forecast call or QBR

## Step-by-Step Methodology

### Step 1: Gather Deal Context

1. Check `data/memory/deals/` for an existing deal file matching the company name
2. Check `data/memory/companies/` for the company profile
3. Check `data/memory/contacts/` for all contacts associated with this deal
4. If no deal file exists, ask the user for: company name, deal value, current stage, key contacts, and timeline
5. Read `data/memory/learnings/stage-progression.md` for historical patterns

### Step 2: Run MEDDIC Scoring

Score each dimension on a 1-10 scale using the rubric below. Be honest — inflated scores help nobody.

### Step 3: Validate the Deal Stage

Cross-reference the claimed stage against the stage-gate criteria. Deals frequently sit at a stage they haven't truly earned. Call it out.

### Step 4: Assess Risk

Apply the weighted risk model. Identify the top 3 risk factors and their mitigation paths.

### Step 5: Generate the Deal Health Card

Output the structured Deal Health Card (template below) with scoring, risk assessment, and concrete next actions.

### Step 6: Update Memory

- Write/update the deal file in `data/memory/deals/`
- Update `data/memory/learnings/stage-progression.md` if this analysis reveals a pattern
- Update contact files if new intelligence surfaces

---

## MEDDIC Framework — Detailed Scoring Rubric

MEDDIC is the gold standard for enterprise deal qualification. Each letter represents a dimension that must be validated — not assumed, not hoped for, validated with evidence.

### M — Metrics (Weight: 15%)

**What it means:** The quantified business impact the buyer expects from your solution. Not "they want better performance" — actual numbers tied to their P&L.

| Score | Criteria |
|-------|----------|
| 1-2   | No metrics identified. Conversation is feature-focused, not outcome-focused. |
| 3-4   | Vague metrics: "improve efficiency" or "grow revenue." No baseline, no target. |
| 5-6   | General metrics identified but not validated by the buyer. You've done the math, they haven't confirmed it. |
| 7-8   | Buyer has confirmed specific metrics: "We need to reduce CPA by 20%" or "grow audience reach by 3M impressions." Baseline and target are documented. |
| 9-10  | Metrics are buyer-authored, tied to a business case or internal initiative, and have been presented to their leadership. The buyer is using YOUR metrics in THEIR internal conversations. |

**Red flags at low scores:**
- Deal is being sold on features, not outcomes
- No executive sponsor will approve without quantified impact
- Competitor who quantifies value will win

**How to improve:**
- Ask: "What would success look like in numbers 12 months after launch?"
- Ask: "What's the cost of doing nothing for another quarter?"
- Build a joint value model with the champion

### E — Economic Buyer (Weight: 20%)

**What it means:** You have identified AND engaged the person who can sign the contract and allocate budget without further approval. This is the single most important dimension.

| Score | Criteria |
|-------|----------|
| 1-2   | Unknown. You're talking to someone who "thinks" they can make the decision. |
| 3-4   | Identified by name/title but no direct engagement. Your champion says they'll "handle it internally." |
| 5-6   | Identified and you've had one interaction (email, brief meeting), but no substantive conversation about the deal. |
| 7-8   | Direct engagement. Economic buyer understands the value proposition, has confirmed budget availability, and has expressed a timeline preference. |
| 9-10  | Economic buyer is actively driving the deal internally. They've asked their team to prioritize evaluation, allocated resources for implementation, or issued verbal commitment. |

**Red flags at low scores:**
- Deals without economic buyer access close at <15% rate
- "My boss will approve whatever I recommend" is almost never true for deals >$50K
- If you can't get a meeting, the deal isn't real

**How to improve:**
- Ask your champion: "Walk me through your approval process — who signs, who influences, who can say no?"
- Offer an executive-to-executive alignment meeting
- Create content specifically designed for the EB (executive summary, ROI brief)

### D — Decision Criteria (Weight: 15%)

**What it means:** You know the specific criteria the buyer will use to evaluate solutions AND you've influenced those criteria in your favor.

| Score | Criteria |
|-------|----------|
| 1-2   | No understanding of how they'll decide. You're guessing. |
| 3-4   | General sense: "they care about price and integration." No formal criteria documented. |
| 5-6   | Buyer has shared their evaluation criteria (maybe an RFP or scorecard), but you haven't influenced it. |
| 7-8   | Criteria are documented, and at least 2-3 criteria favor your solution because you helped shape them. |
| 9-10  | You co-authored the evaluation criteria. The scorecard reads like your feature sheet. Competitor would need to rewrite the RFP to win. |

**Red flags at low scores:**
- An RFP you didn't influence is an RFP you'll lose
- "We're evaluating based on best fit" means they haven't thought about it, which means the loudest vendor will define it
- Technical criteria without business criteria = procurement-driven deal (bad)

### D — Decision Process (Weight: 15%)

**What it means:** You understand every step between today and a signed contract — and you've validated it with the buyer, not inferred it from past deals.

| Score | Criteria |
|-------|----------|
| 1-2   | No idea. "They said they'd get back to us." |
| 3-4   | General sense: "They need legal review and board approval." No timeline, no sequence. |
| 5-6   | Process steps identified (eval → pilot → legal → sign), but no dates committed and no mutual action plan. |
| 7-8   | Mutual action plan exists with dates. Both sides have committed resources. You know the approval chain. |
| 9-10  | Joint execution plan with milestones, calendar holds for key meetings, legal/procurement pre-engaged, and a fallback timeline if things slip. |

**Red flags at low scores:**
- No process = no urgency = deal will stall
- "We'll make a decision by Q2" without a plan to get there is a wish, not a process
- Watch for process steps that appear late (security review, procurement, legal) — these add 4-8 weeks

### I — Identify Pain (Weight: 20%)

**What it means:** You understand the specific business pain this deal solves — not the feature they want, but the PROBLEM that's costing them money, time, or competitive position.

| Score | Criteria |
|-------|----------|
| 1-2   | No pain identified. Buyer is "exploring options" or "seeing what's out there." |
| 3-4   | Surface-level pain: "We need a better ad platform" or "Our current vendor is too expensive." |
| 5-6   | Real pain identified and articulated: "We're losing 30% of our digital budget to fraud" or "Our campaign setup takes 3 weeks instead of 3 days." |
| 7-8   | Pain is quantified, attributed to a business impact (revenue loss, margin compression, competitive disadvantage), and acknowledged by multiple stakeholders. |
| 9-10  | Pain is urgent. There's a compelling event — a contract expiration, a board mandate, a regulatory deadline, a competitive threat — that creates a "must solve by X date" dynamic. |

**Red flags at low scores:**
- No pain = no urgency = deal dies of indifference
- "Nice to have" deals close at <10% rate
- Pain that only one person feels isn't organizational pain

**How to improve:**
- Ask: "What happens if you don't solve this in the next 6 months?"
- Ask: "How is this problem affecting your team's goals this quarter?"
- Map pain to their published business priorities (earnings calls, press releases, job postings)

### C — Champion (Weight: 15%)

**What it means:** You have an internal advocate who has POWER (not just interest), INFLUENCE (people listen to them), and MOTIVATION (they personally benefit from your solution winning).

| Score | Criteria |
|-------|----------|
| 1-2   | No internal advocate. You're selling from the outside. |
| 3-4   | Friendly contact who takes your calls, but has no influence on the decision. |
| 5-6   | Advocate with some influence who is willing to share information and make introductions. |
| 7-8   | Champion who actively sells internally on your behalf, coaches you on objections and politics, and has credibility with the economic buyer. |
| 9-10  | Champion who has staked their reputation on this deal. They're presenting to their leadership, removing internal blockers, and proactively sharing competitive intelligence. |

**Red flags at low scores:**
- A deal without a champion is a deal without an internal engine
- "Everyone there likes us" is not a champion — it's politeness
- Champions who won't give you access to the EB aren't real champions

---

## Stage-Gate Validation

Deals frequently sit at stages they haven't earned. Use these gates to validate.

### Stage 1: Prospecting
- [ ] Target account identified with initial research completed
- [ ] At least one contact identified with valid contact information
- [ ] Initial outreach sent or meeting scheduled
- **Minimum MEDDIC total: 5**

### Stage 2: Discovery
- [ ] At least one substantive meeting completed (not just an intro)
- [ ] Pain identified at surface level (score >= 4)
- [ ] At least 2 contacts engaged
- [ ] Company profile created in memory
- **Minimum MEDDIC total: 15**

### Stage 3: Qualification
- [ ] MEDDIC score >= 30 overall
- [ ] No single dimension below 3
- [ ] Economic buyer identified (score >= 4)
- [ ] Pain quantified (score >= 6)
- [ ] Champion identified (score >= 5)
- [ ] Decision process mapped at least roughly
- **If any gate fails: deal should be moved BACK to Discovery**

### Stage 4: Proposal / Solution Design
- [ ] MEDDIC score >= 42 overall
- [ ] Metrics confirmed by buyer (score >= 7)
- [ ] Economic buyer engaged directly (score >= 6)
- [ ] Decision criteria known and influenced (score >= 6)
- [ ] Mutual action plan drafted
- [ ] Budget range confirmed
- **If any gate fails: deal should stay at Qualification**

### Stage 5: Negotiation
- [ ] MEDDIC score >= 50 overall
- [ ] Proposal delivered and discussed
- [ ] Economic buyer has given verbal support
- [ ] Legal/procurement engaged
- [ ] Only commercial terms remain (price, terms, scope)
- [ ] No unresolved technical blockers
- **If any gate fails: deal should stay at Proposal**

### Stage 6: Closed Won
- [ ] Contract signed
- [ ] PO received or payment terms confirmed
- [ ] Implementation kickoff scheduled
- [ ] Win documented in `data/memory/wins/`

---

## Risk Scoring Model

Each risk factor has a weight. Total risk score = sum of (factor score x weight). Higher = more risk.

| Risk Factor | Weight | Score Range | How to Assess |
|---|---|---|---|
| No economic buyer access | 0.25 | 0-10 | 0 = direct access, 10 = never met them |
| Single-threaded (one contact) | 0.15 | 0-10 | 0 = 5+ contacts, 10 = only 1 contact |
| No compelling event | 0.20 | 0-10 | 0 = hard deadline, 10 = "whenever" |
| Champion weakness | 0.15 | 0-10 | 0 = strong champion, 10 = no champion |
| Competitive threat | 0.10 | 0-10 | 0 = no competition, 10 = incumbent advantage |
| Stalled progression | 0.10 | 0-10 | 0 = moving fast, 10 = no activity 30+ days |
| Budget uncertainty | 0.05 | 0-10 | 0 = budget allocated, 10 = no budget discussion |

**Risk Categories:**
- **0.0 - 2.5**: Low risk — deal is well-qualified and progressing
- **2.5 - 5.0**: Moderate risk — 1-2 gaps need attention this week
- **5.0 - 7.5**: High risk — deal is at serious risk of stalling or losing. Escalate.
- **7.5 - 10.0**: Critical — this deal should not be in forecast. Requantify or disqualify.

---

## Next-Action Recommendation Engine

Based on the MEDDIC scores and risk factors, recommend actions from this library:

### For Low Metrics Scores (< 5):
- Schedule a value engineering workshop with the champion
- Build a draft ROI model and send for the champion's review
- Research the buyer's earnings calls / press releases for published metrics

### For Low Economic Buyer Scores (< 5):
- Ask champion to arrange an executive alignment meeting
- Create an executive brief (1-page) specifically for the EB
- Propose an executive-to-executive introduction from your leadership

### For Low Decision Criteria Scores (< 5):
- Request or propose an evaluation framework
- Share a "best practices" guide for evaluating solutions (that happens to favor you)
- Ask: "What would a perfect solution look like for your team?"

### For Low Decision Process Scores (< 5):
- Propose a mutual action plan with specific dates
- Ask: "If we could agree on a solution today, what steps would happen between now and go-live?"
- Map the approval chain: who reviews, who approves, who can block

### For Low Pain Scores (< 5):
- Conduct deeper discovery — you haven't found the real problem yet
- Ask second and third-level "why" questions
- Research industry pain points and test them with the buyer

### For Low Champion Scores (< 5):
- Identify who benefits most from your solution succeeding
- Invest in coaching your best contact on how to sell internally
- Ask: "Who on your team is most frustrated with the current situation?"

---

## Deal Health Card Template

```markdown
# Deal Health Card: [Company Name]

**Generated:** [Date]
**Deal Value:** $[value]
**Current Stage:** [stage] (Validated: [Yes/No])
**Close Date:** [target date]
**Days in Current Stage:** [N]

## MEDDIC Scorecard

| Dimension | Score | Evidence | Gap |
|---|---|---|---|
| Metrics | [1-10] | [Brief evidence] | [What's missing] |
| Economic Buyer | [1-10] | [Brief evidence] | [What's missing] |
| Decision Criteria | [1-10] | [Brief evidence] | [What's missing] |
| Decision Process | [1-10] | [Brief evidence] | [What's missing] |
| Identify Pain | [1-10] | [Brief evidence] | [What's missing] |
| Champion | [1-10] | [Brief evidence] | [What's missing] |
| **TOTAL** | **[X/60]** | | |

## Stage Validation

Current Stage: [N] — [Name]
Gate Status: [PASSED / FAILED — list failing criteria]
Recommended Stage: [N] — [Name]

## Risk Assessment

Overall Risk Score: [X.X / 10.0] — [Low/Moderate/High/Critical]

Top 3 Risk Factors:
1. [Factor]: [Score] — [Why]
2. [Factor]: [Score] — [Why]
3. [Factor]: [Score] — [Why]

## Recommended Next Actions (Priority Order)

1. **[Action]** — [Rationale] — Owner: [who] — By: [date]
2. **[Action]** — [Rationale] — Owner: [who] — By: [date]
3. **[Action]** — [Rationale] — Owner: [who] — By: [date]

## Deal Narrative

[2-3 sentence honest assessment of where this deal stands, what needs to happen
for it to close, and what the biggest single risk is. Written for a VP of Sales
who needs the truth, not optimism.]
```

---

## Learnings Integration

After each deal analysis:
1. Read `data/memory/learnings/stage-progression.md`
2. If the deal's stage didn't match validation, log the pattern:
   - `[Date] [Company] claimed Stage [N] but validated at Stage [N-1]. Gap: [dimension]`
3. If the risk model flagged something the user confirmed was accurate, log it:
   - `[Date] [Company] risk flag [factor] confirmed. Outcome: [what happened]`
4. Over time, these logs reveal which risk factors are most predictive for THIS user's pipeline
5. Read `data/memory/learnings/win-rate-factors.md` and update if the analysis reveals a pattern

---

## Example Output

Here is what an excellent Deal Health Card looks like in practice:

```
# Deal Health Card: Meridian Media Group

**Generated:** 2026-03-19
**Deal Value:** $480,000
**Current Stage:** 4 - Proposal (Validated: No — should be Stage 3)
**Close Date:** 2026-05-15
**Days in Current Stage:** 22

## MEDDIC Scorecard

| Dimension | Score | Evidence | Gap |
|---|---|---|---|
| Metrics | 7 | "Reduce CPA from $42 to $28 across programmatic" — confirmed by VP Marketing | Need CFO validation of savings model |
| Economic Buyer | 4 | CMO identified (Sarah Chen), one email exchange only | No direct meeting. Champion says "she'll approve" but no evidence. |
| Decision Criteria | 5 | Shared evaluation scorecard, but written by procurement — not shaped by us | Need to influence technical criteria around real-time optimization |
| Decision Process | 3 | "Legal will review after we decide" — no timeline, no mutual plan | No action plan. No clarity on procurement timeline. |
| Identify Pain | 8 | CPA inflation + audience fragmentation costing $1.2M/yr in wasted spend. CFO flagged in board meeting. | Pain is strong but need to confirm it's a THIS QUARTER priority |
| Champion | 6 | Director of Digital (Marcus Lee) is engaged and making intros, but hasn't presented to CMO yet | Not yet selling internally without us in the room |
| **TOTAL** | **33/60** | | |

## Stage Validation

Current Stage: 4 — Proposal
Gate Status: FAILED — Economic Buyer < 6, Decision Process < 6, no mutual action plan
Recommended Stage: 3 — Qualification

## Risk Assessment

Overall Risk Score: 5.8 / 10.0 — High Risk

Top 3 Risk Factors:
1. No economic buyer access: 7.5 — One email is not access. CMO has not engaged.
2. No compelling event: 6.0 — Pain is real but no deadline forcing action.
3. Single-threaded risk: 5.0 — Only Marcus is engaged. If he leaves or deprioritizes, deal dies.

## Recommended Next Actions (Priority Order)

1. **Get CMO meeting** — Ask Marcus to set up a 20-min exec alignment call. Offer to bring your VP. — Owner: AE — By: This week
2. **Build mutual action plan** — Draft a reverse-timeline from May 15 close date. Share with Marcus for validation. — Owner: AE — By: 3 days
3. **Multi-thread** — Request intro to the Programmatic team lead and the CFO's office (for budget validation). — Owner: AE — By: Next week

## Deal Narrative

This deal has real pain and decent metrics, but it's running on hope rather than process.
The biggest risk is that we've never spoken to the CMO directly, and we're 22 days into
"Proposal stage" without a mutual action plan. If we can't get CMO access in the next
10 days, this deal should be moved to Stage 3 and the close date pushed to Q3.
```
