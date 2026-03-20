---
name: competitor-intel
description: |
  Triggers when the user asks about a competitor, needs a battle card, wants competitive
  positioning help, or is preparing for a deal where a specific competitor is involved.
  Trigger phrases include "battle card", "how do we compare to [competitor]", "they're
  also looking at [competitor]", "competitive analysis", "win against [competitor]",
  "what's [competitor]'s weakness", "SWOT", or "trap questions".
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

# Competitor Intelligence Skill

## When to Use

Activate this skill when:
- User asks to **create or update a battle card** for a specific competitor
- User is in a **competitive deal** and needs positioning help
- User asks "how do we compare to [competitor]?"
- User needs **trap questions** to highlight competitor weaknesses
- User wants to understand a competitor's **strategy, pricing, or product changes**
- User asks for a **SWOT analysis** of a competitor
- User has **won or lost** a deal against a competitor and wants to analyze why
- User is preparing for a meeting where the **buyer mentioned a competitor**

## Step-by-Step Methodology

### Step 1: Identify the Competitor and Context

1. Confirm the competitor name and the context (active deal, general preparation, win/loss analysis)
2. Check `data/memory/companies/` for any existing intel on this competitor
3. Check `data/memory/deals/` for any active deals where this competitor is mentioned
4. Check `data/memory/wins/` and `data/memory/losses/` for historical outcomes against this competitor

### Step 2: Gather Intelligence

For existing battle cards, review and update. For new competitors:

1. **Public Sources** — Use WebSearch to find:
   - Recent press releases, product announcements, and funding news
   - Leadership changes and key hires
   - Customer reviews and case studies they publish
   - Pricing information (public or reported)
   - Technology partnerships and integrations

2. **Internal Sources** — Check memory for:
   - Past deal notes mentioning this competitor
   - Win/loss reports from deals against them
   - Anecdotal intelligence from sales team interactions
   - Customer feedback comparing the two solutions

3. **Product Intelligence** — Understand:
   - Core product capabilities and architecture
   - Target market and ideal customer profile
   - Key differentiators they claim
   - Known limitations and common complaints

### Step 3: Build the Competitive Analysis

Apply the frameworks below in this order:
1. SWOT Analysis — strengths, weaknesses, opportunities, threats
2. Positioning Matrix — where you win, where they win, where it's neutral
3. Battle Card Generation — actionable talk tracks for reps

### Step 4: Design Trap Questions and Landmines

Create questions the rep can ask the buyer that naturally reveal competitor weaknesses without directly attacking the competitor. Also identify competitor claims that should be challenged with follow-up questions.

### Step 5: Save and Share

- Save the battle card to `data/memory/companies/[competitor]-battlecard.md`
- Update deal files if this analysis is for a specific deal
- Note the date — competitive intel has a shelf life (review quarterly)

---

## SWOT Analysis Methodology

### How to Conduct a Rigorous SWOT

Most SWOTs are lazy lists that tell you nothing actionable. A good SWOT follows these rules:

**Strengths (Internal to the competitor — things they do well):**
- Must be specific and evidence-based, not assumed
- Ask: "Would their customers confirm this strength?"
- Categorize: Product, Brand, Distribution, Talent, Financial, Data

**Weaknesses (Internal to the competitor — things they do poorly):**
- Must be validated by customer feedback, lost deals, or public complaints
- Ask: "Has this weakness actually cost them deals we know about?"
- Categorize: Product gaps, Service issues, Scale limitations, Technical debt, Talent gaps

**Opportunities (External factors that could help the competitor):**
- Market trends, regulatory changes, or industry shifts that benefit them
- Partnership or M&A possibilities that would strengthen them
- Ask: "What could happen in the next 12 months that makes them stronger?"

**Threats (External factors that could hurt the competitor):**
- Market shifts, technology disruption, or regulatory changes that hurt them
- Key customer or talent attrition risk
- Ask: "What could happen in the next 12 months that makes them weaker?"

### SWOT-to-Action Translation

A SWOT that doesn't produce action is useless. For each quadrant:

- **Their Strength → Our Response:** How do we neutralize or reframe this?
- **Their Weakness → Our Exploit:** How do we make the buyer discover this naturally?
- **Their Opportunity → Our Watch:** What should we monitor and prepare for?
- **Their Threat → Our Leverage:** How can we accelerate this to our advantage?

---

## Competitive Positioning Matrix

Map your solution and the competitor's across these dimensions. Score each 1-5.

| Dimension | Us | Them | Advantage | Talk Track |
|---|---|---|---|---|
| **Product Breadth** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Product Depth** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Ease of Use** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Integration Ecosystem** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Data & Analytics** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Customer Support** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Pricing Flexibility** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Brand / Reputation** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Innovation Velocity** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |
| **Vertical Expertise** | [1-5] | [1-5] | [Us/Them/Neutral] | [One-sentence positioning] |

### How to Use the Matrix

1. **Lead with your advantages** — In discovery and demos, spend time on dimensions where you score higher
2. **Neutralize their advantages** — For dimensions where they score higher, have a prepared reframe ("Yes, they have X, but the real question for your use case is Y")
3. **Anchor on buyer priorities** — The matrix is only useful if weighted by what THIS buyer cares about. A strength they don't value is irrelevant.

---

## Battle Card Generation Framework

A battle card is a single-page (or close to it) reference that a rep can pull up during a live conversation. It must be scannable, actionable, and honest.

### Battle Card Structure

```markdown
# Battle Card: [Competitor Name]
**Last Updated:** [Date]
**Confidence Level:** [High / Medium / Low] — based on intel recency and quality

## In One Sentence
[How to position against this competitor in a single sentence]

## Where We Win (Lead With These)
1. [Advantage 1] — [Proof point or customer quote]
2. [Advantage 2] — [Proof point or customer quote]
3. [Advantage 3] — [Proof point or customer quote]

## Where They Win (Be Honest, Then Reframe)
1. [Their advantage 1] — **Reframe:** [How to neutralize or redirect]
2. [Their advantage 2] — **Reframe:** [How to neutralize or redirect]

## Where It's Neutral (Don't Waste Time Here)
- [Capability 1] — Both solutions handle this adequately
- [Capability 2] — Similar functionality, different UX

## Trap Questions (Ask the Buyer These)
1. "[Question that reveals competitor weakness 1]"
   - **Why it works:** [What their answer will reveal]
   - **If they say [X]:** [Your follow-up]
2. "[Question that reveals competitor weakness 2]"
   - **Why it works:** [What their answer will reveal]
   - **If they say [X]:** [Your follow-up]
3. "[Question that reveals competitor weakness 3]"
   - **Why it works:** [What their answer will reveal]

## Landmines (Competitor Claims to Challenge)
1. **They'll say:** "[Competitor claim]"
   **Reality:** [What's actually true]
   **Ask the buyer:** "[Follow-up question that exposes the gap]"
2. **They'll say:** "[Competitor claim]"
   **Reality:** [What's actually true]
   **Ask the buyer:** "[Follow-up question that exposes the gap]"

## Pricing Intel
- **Their model:** [How they price — CPM, flat fee, % of spend, etc.]
- **Typical range:** [Price range if known]
- **Hidden costs:** [Implementation fees, minimums, overage charges, etc.]
- **Our response if they're cheaper:** [Talk track for price comparison]

## Key References
- [Customer who evaluated both and chose us] — [What they'd say]
- [Customer who switched FROM competitor TO us] — [What they'd say]

## Recent News
- [Date]: [Relevant competitor news — product launch, acquisition, leadership change, etc.]
```

---

## Trap Question Design

Trap questions are the highest-leverage competitive tool. A great trap question:

1. **Sounds innocent** — It feels like a normal buyer question, not a competitive attack
2. **Reveals a real gap** — The answer (or inability to answer) exposes a genuine weakness
3. **Matters to the buyer** — The gap it reveals is relevant to their use case
4. **Has a follow-up** — You know what to do with the answer

### How to Design Trap Questions

**Step 1: Start with the competitor's weakness**
What do they genuinely struggle with? Not "our marketing says they're bad at X" — what have buyers, reviews, or lost deals revealed?

**Step 2: Turn the weakness into a buyer question**
Frame it as something the buyer should care about, not something that attacks the competitor.

BAD: "Did [competitor] tell you about their downtime issues?"
GOOD: "How important is guaranteed uptime for your campaign flights? What SLA are you targeting?"

**Step 3: Map the expected answers**
- If the buyer hasn't asked the competitor about this → you've planted a seed
- If the buyer has and got a weak answer → you've created doubt
- If the buyer has and got a strong answer → you've learned something (adapt)

### Trap Question Examples for Media/Advertising Sales

**If competitor has weak attribution:**
"How are you planning to measure the incremental impact of this campaign? Specifically, can you isolate the lift from this spend versus organic demand? What attribution methodology does your current partner use?"

**If competitor has limited inventory:**
"What's your reach ceiling for [target audience]? At what spend level do you start seeing diminishing returns from frequency capping? How does your partner handle audience extension when they max out their owned inventory?"

**If competitor has poor customer service:**
"When a campaign is underdelivering mid-flight, what's your SLA for optimization turnaround? Who's your day-to-day contact — is it a dedicated strategist or a shared support queue?"

**If competitor locks in long contracts:**
"How flexible is your current agreement if your priorities shift mid-year? Can you reallocate budget across channels or audiences without penalty? What does the exit clause look like?"

---

## Landmine Detection

Landmines are things competitors say in their sales process that sound good but don't hold up under scrutiny. Detecting them requires you to:

1. **Know what competitors commonly claim** — from their website, sales decks, and buyer reports
2. **Know where the claims break down** — from customer reviews, technical evaluations, and your own product team
3. **Prepare follow-up questions** — that the buyer can ask the competitor to test the claim

### Common Landmine Categories

**Vaporware** — Features announced but not shipped. "Ask them to show you that feature in a live demo, not a slide deck."

**Asterisk Metrics** — Performance numbers with hidden conditions. "Ask what audience, geography, vertical, and time period that case study covers. Performance varies dramatically by context."

**Integration Claims** — "Integrates with everything" usually means "has an API." "Ask them to walk through the specific integration with [your key system]. How many customers are live on that integration? What's the setup time?"

**Scale Claims** — "Handles billions of impressions" may be true globally but not for your use case. "Ask what the QPS is for your specific targeting parameters. Global scale doesn't mean your campaign gets priority."

**Customer Count Inflation** — "5,000 customers" may include free trials, inactive accounts, or acquired customers. "Ask how many active customers are in your vertical, at your spend level, using the specific product you're evaluating."

---

## Win/Loss Pattern Analysis

When historical win/loss data exists, analyze it for patterns.

### Win Analysis Questions
- What was the competitive field? (Which competitors were in the deal?)
- What was the primary reason the buyer chose us? (Feature, price, relationship, service, brand)
- Which MEDDIC dimensions were strongest in deals we won?
- Was there a champion? How strong were they?
- What was the deal cycle length compared to average?
- What content or proof points were most influential?

### Loss Analysis Questions
- Who did we lose to? (Specific competitor or "no decision"?)
- What was the stated reason for the loss?
- What was the REAL reason? (Often different from stated)
- At what stage did we lose momentum?
- Were there warning signs we missed?
- What would we do differently?

### Pattern Recognition
After 5+ data points against the same competitor, look for:
- **Win conditions** — scenarios where we consistently win (certain verticals, deal sizes, use cases)
- **Loss conditions** — scenarios where we consistently lose (avoid or adapt strategy)
- **Inflection points** — specific moments in the sales cycle where the deal tips one way or another
- **Champion profiles** — what kind of internal champion correlates with wins vs. losses

---

## Learnings Integration

After each competitive interaction:
1. Update the battle card in `data/memory/companies/[competitor]-battlecard.md`
2. If a deal was won or lost, create a record in `data/memory/wins/` or `data/memory/losses/`
3. Update `data/memory/learnings/win-rate-factors.md` with any new patterns
4. Note which trap questions worked and which didn't
5. Update pricing intel if new data surfaced
6. Date-stamp all intelligence — stale intel is dangerous

---

## Example Output: Battle Card

```
# Battle Card: TradeDesk
**Last Updated:** 2026-03-19
**Confidence Level:** High — based on 6 recent competitive deals and public data

## In One Sentence
TradeDesk is strong in programmatic self-serve but lacks the strategic partnership
model and premium inventory access that complex brand advertisers need.

## Where We Win (Lead With These)
1. **Premium inventory + context** — We offer brand-safe, contextually relevant placements
   that programmatic can't replicate. "Our average viewability is 82% vs. industry
   average of 54% on open exchange." — Case study: Unilever Q3 campaign.
2. **Strategic partnership model** — Dedicated strategist, custom insights, and business
   reviews. TradeDesk provides a platform, not a partner. Reference: Diageo switched
   from self-serve to us and saw 35% ROAS improvement from strategic optimization.
3. **First-party data assets** — Our audience data is deterministic and proprietary.
   TradeDesk relies on third-party data segments that are increasingly degraded
   post-cookie-deprecation.

## Where They Win (Be Honest, Then Reframe)
1. **Self-serve flexibility** — Buyers who want hands-on-keyboard control prefer TradeDesk's UI.
   **Reframe:** "Flexibility is great for teams with 3+ programmatic traders. For teams
   your size, our managed approach frees your team to focus on strategy, not trafficking."
2. **Programmatic breadth** — TradeDesk accesses more exchanges and SSPs.
   **Reframe:** "More inventory doesn't mean better inventory. 70% of open-exchange
   impressions never get seen by a human. Let's compare performance, not volume."

## Trap Questions
1. "What percentage of your programmatic impressions have a viewability rate above 70%?"
   - **Why it works:** TradeDesk's open-exchange average is ~50%. They'll either
     dodge or quote a number that's lower than ours.
   - **If they say "it depends on targeting":** Follow up with "Can you guarantee
     a viewability floor in the IO?"

2. "When a campaign underperforms mid-flight, who proactively reaches out with
   an optimization plan?"
   - **Why it works:** TradeDesk is self-serve. There's no proactive strategist.
   - **If they say "our support team":** Ask "Is that a dedicated person who
     knows my brand, or a ticket queue?"

## Landmines
1. **They'll say:** "We offer full transparency into every impression."
   **Reality:** Transparency into where an impression served is not the same as
   transparency into whether it worked. They show you the log file; we show you the business impact.
   **Ask the buyer:** "Can you walk me through how you measure incrementality, not just delivery?"

## Pricing Intel
- **Their model:** Platform fee (typically 15-20% of media spend) + media costs
- **Typical range:** $50K-$500K+ in platform fees depending on spend volume
- **Hidden costs:** Data segment costs, creative ad serving fees, and the LABOR cost
  of a team to operate the platform (1-2 FTEs at $80K-$120K each)
- **Our response if they're cheaper:** "Compare total cost of ownership: their platform
  fee + your team cost + data fees vs. our all-in managed rate. Most brands find
  the self-serve 'savings' disappear when you factor in headcount."
```
