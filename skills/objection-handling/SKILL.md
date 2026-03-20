---
name: objection-handling
description: |
  Triggers when the user encounters a sales objection, needs help responding to buyer
  pushback, or asks how to handle resistance. Trigger phrases include "they said it's too
  expensive", "they want to wait", "they're looking at [competitor]", "they need to check
  with their boss", "they don't think they need this", "how do I respond to", "objection",
  "pushback", "they're stalling", or "they said no".
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - Bash
---

# Objection Handling Skill

## When to Use

Activate this skill when:
- User shares a **specific objection** a buyer raised (quoted or paraphrased)
- User asks **"how do I respond to..."** any form of buyer resistance
- User mentions a deal is **stalling** and needs to understand why
- User asks for **objection handling** help, scripts, or frameworks
- User is **preparing for a meeting** where known objections are expected
- User wants to **practice** or role-play objection responses
- User asks about **negotiation tactics** tied to buyer pushback

## Step-by-Step Methodology

### Step 1: Classify the Objection

Read the objection carefully and classify it into one of six categories:
1. **Price** — "It's too expensive" / "We don't have the budget" / "Competitor is cheaper"
2. **Timeline** — "Not right now" / "Maybe next quarter" / "We're not ready"
3. **Competition** — "We're also looking at X" / "Why not just use X?"
4. **Authority** — "I need to run this by my boss" / "This isn't my decision"
5. **Need** — "We don't really need this" / "What we have works fine"
6. **Risk** — "This seems risky" / "What if it doesn't work?" / "We've been burned before"

If the objection spans multiple categories, address the primary category first, then note the secondary.

### Step 2: Assess the Objection's Nature

Not all objections are equal. Determine if this is:
- **A genuine concern** — The buyer has a real issue that needs solving
- **A negotiation tactic** — The buyer wants a concession (they'll buy either way)
- **A brush-off** — The buyer isn't interested and is being polite
- **A political objection** — The buyer is interested but has internal resistance

This distinction changes the response strategy entirely.

### Step 3: Load Context

1. Check `data/memory/deals/` for the relevant deal file
2. Check `data/memory/companies/` for company context
3. Read the relevant playbook from `data/playbooks/objections/`
4. Read `data/memory/learnings/objection-patterns.md` for what's worked before

### Step 4: Apply the AIRC Framework

**A — Acknowledge**
Validate the concern. Never dismiss, argue, or immediately counter. The buyer needs to feel heard before they'll listen. Use empathy and specificity — reflect back what they said in your own words to prove you understand.

**I — Isolate**
Determine if this is the ONLY concern or one of many. Ask: "If we could address this, would you feel comfortable moving forward?" This reveals whether the stated objection is the real objection or a smokescreen for something deeper.

**R — Respond**
Deliver a tailored response using the appropriate playbook. Choose the response pattern that best fits the objection's nature (genuine concern vs. negotiation tactic vs. brush-off). Include proof points, reframes, or concessions as appropriate.

**C — Confirm**
Verify the objection is resolved. Ask: "Does that address your concern?" or "How does that sit with you?" If not resolved, cycle back to Isolate — there's likely a deeper issue.

### Step 5: Recommend Follow-Up Actions

Based on the objection and response, recommend:
- What to send after the conversation (email recap, proof point, case study)
- Whether to involve additional stakeholders
- Whether to escalate to leadership
- How to prevent this objection from recurring in future deals

### Step 6: Update Learnings

After each objection handled, write to `data/memory/learnings/objection-patterns.md`:
```
## [Date] — [Company] — [Objection Category]
- **Objection:** [What the buyer said]
- **Nature:** [Genuine / Negotiation / Brush-off / Political]
- **Response Used:** [Which pattern from the playbook]
- **Outcome:** [Resolved / Partially resolved / Not resolved]
- **What Worked:** [Specific element that landed]
- **What Didn't:** [What fell flat, if applicable]
```

---

## AIRC Framework — Deep Dive

### A — Acknowledge (The Most Important Step)

Why most reps fail here: They jump to defending or countering immediately. This triggers the buyer's fight-or-flight response. They dig in harder. The objection gets WORSE.

**What excellent acknowledgment sounds like:**

For Price: "I completely understand — $400K is a significant investment, and you're right to pressure-test whether the ROI justifies it. That's exactly the kind of rigor I'd expect from someone in your position."

For Timeline: "That makes sense. You've got a lot of initiatives competing for attention right now, and the last thing I want is to push you into something before you're ready to execute it well."

For Competition: "I'm glad you're doing a thorough evaluation. Honestly, [competitor] is a solid company, and I'd be surprised if you weren't looking at them. The question is which solution fits your specific situation best."

**What bad acknowledgment sounds like:**
- "I hear you, BUT..." (the word "but" negates everything before it)
- "A lot of our customers felt that way too..." (dismissive, patronizing)
- "That's not really an issue because..." (invalidating)

### I — Isolate (The Diagnostic Step)

The stated objection is almost never the real objection. Isolating helps you find what's really going on.

**Power questions for isolation:**

- "If we could solve the [stated concern], is there anything else that would prevent us from moving forward?"
- "Help me understand — is this about [stated concern], or is there something bigger at play?"
- "On a scale of 1-10, how significant is this concern? What would make it a 2?"
- "Is this a dealbreaker, or is it something we can work through together?"

**What isolation reveals:**
- If they say "Yes, that's the only thing" — address it directly
- If they say "Well, there's also..." — the first objection wasn't the real one
- If they get vague — the real objection is political (internal resistance they can't/won't share)

### R — Respond (The Craft Step)

Response patterns by objection type are detailed in the playbooks (`data/playbooks/objections/`). Here is a summary of the approach for each:

#### Price Objections
Primary strategy: **Reframe from cost to value.** Never defend price — instead, make the buyer defend the cost of NOT buying.
- Pattern 1: ROI Reframe — show the cost of inaction exceeds the investment
- Pattern 2: Scope Alignment — "Let's align the investment to the outcomes you need most"
- Pattern 3: Risk Reversal — performance guarantees, pilots, phased rollout
- Pattern 4: Competitive TCO — total cost of ownership comparison (not just sticker price)
- Pattern 5: Executive Value Story — case study of a similar buyer who saw [specific ROI]

#### Timeline Objections
Primary strategy: **Create urgency through loss aversion.** People are more motivated to avoid losing something than to gain something.
- Pattern 1: Cost of Delay — quantify what waiting costs per month
- Pattern 2: Competitive Window — "Your competitors are already [doing X]"
- Pattern 3: Pilot Bridge — "Start small now, scale when ready"
- Pattern 4: Calendar Anchor — tie to a specific business event (upfront, Q4 planning, etc.)

#### Competition Objections
Primary strategy: **Differentiate on fit, not features.** Never trash the competitor — instead, highlight where YOUR solution uniquely fits THEIR situation.
- Pattern 1: Unique Fit — "For your specific [use case], here's why we're different"
- Pattern 2: Trap Questions — questions that reveal competitor weaknesses naturally
- Pattern 3: Risk Contrast — "Ask [competitor] about [area where they're weak]"
- Pattern 4: Proof Points — customer references who evaluated the same competitor and chose you

#### Authority Objections
Primary strategy: **Empower your contact to sell internally.** Don't try to go around them — equip them to succeed.
- Pattern 1: Champion Coaching — "What does your boss care about most? Let me help you build the case."
- Pattern 2: Executive Brief — create a 1-pager designed for the decision-maker
- Pattern 3: Upward Introduction — offer an exec-to-exec conversation to make it easier

#### Need Objections
Primary strategy: **Deepen discovery.** If they don't see the need, you haven't found the right pain yet.
- Pattern 1: Impact Questions — "What's the downstream effect of [current problem]?"
- Pattern 2: Peer Pressure — "Companies like [peer] are solving this because [reason]"
- Pattern 3: Future State — "Where do you want to be in 18 months? How do you get there with what you have?"

#### Risk Objections
Primary strategy: **Reduce perceived risk to zero.** Stack proof until the risk of NOT buying feels larger than the risk of buying.
- Pattern 1: Social Proof — "Here's a company just like you who felt the same way. Here's what happened."
- Pattern 2: Guarantee Structure — pilots, performance SLAs, exit clauses
- Pattern 3: Implementation Plan — make the path so clear that risk feels managed

### C — Confirm (The Closure Step)

Never assume the objection is resolved. Confirm explicitly.

**Good confirmation questions:**
- "Does that address your concern about [specific objection]?"
- "How does that sit with you?"
- "On that scale of 1-10, where are we now on [concern]?"
- "What else would you need to see to feel confident about this?"

**If the objection isn't resolved:**
- Don't push harder. Ask: "What would it take to get there?"
- If they can't articulate what would resolve it, the real objection is something else — go back to Isolate
- Consider whether this objection is a polite "no" — if so, qualify out gracefully

---

## Escalation Protocol

### When to Involve Leadership

Escalate to your manager or VP of Sales when:

1. **Economic Buyer Objection** — The EB raises a concern that requires executive-level response (pricing authority, strategic partnership terms, custom SLAs)
2. **Competitive Displacement** — You're being asked to displace an incumbent with an executive relationship at the target company
3. **Legal / Procurement Block** — Terms are being rejected that are non-negotiable at your level
4. **Champion Lost** — Your internal champion has left, been reassigned, or gone dark
5. **Multiple Unresolved Objections** — Three or more objections remain unresolved after two attempts each
6. **Deal Value Justifies It** — Any deal above your discount authority threshold

### How to Escalate Effectively

Don't just throw the deal at your manager. Present:
- The specific objection(s) and what you've tried
- Your assessment of the objection's nature (genuine vs. tactic)
- What you think the response should be but lack authority to deliver
- What you need from leadership (a call, a concession, a reference, a letter)

---

## Media / Advertising Sales Context

These objection patterns are particularly common in media and advertising sales:

### "CPMs are too high"
This is a Price objection with a Media-specific twist. Response: shift from CPM to cost-per-outcome. "CPMs measure how much you spend to show up. CPAs and ROAS measure how much you spend to make money. Let's look at which metric actually maps to your bonus."

### "We're locked into our upfront deal"
Timeline + Authority hybrid. Response: "Upfront commitments are annual — but scatter and digital budgets often have flexibility. Where do you have discretionary spend this quarter? Let's start there and prove the model before your next upfront."

### "We already have a DSP / SSP / ad server"
Need + Competition hybrid. Response: "Absolutely — and I wouldn't suggest ripping out what works. The question is: are you getting full value from your current stack, or are there gaps? Most of our clients ran both in parallel for a quarter before consolidating."

### "My agency handles media buying"
Authority objection. Response: "Great agencies want great options for their clients. Would it be helpful if we presented jointly to your agency? We've found that when the brand and agency evaluate together, decisions happen faster and alignment is stronger."

### "We're shifting budget to performance channels"
Need objection disguised as a strategy statement. Response: "That's smart — accountability matters. What we're seeing is that the brands winning in performance are the ones that also invest in mid-funnel. Without consideration, your performance channels are just bidding on people already ready to buy. Let me show you the data on how [similar brand] increased ROAS 40% by adding mid-funnel."

---

## Example Output: Handling a Price Objection

**Scenario:** The VP of Marketing at a CPG brand says "We like the proposal, but $350K for a 6-month campaign is beyond our budget. Our agency says we can get comparable reach for $200K with programmatic."

### Objection Classification
- **Category:** Price (with Competition secondary)
- **Nature:** Part genuine (real budget constraints), part negotiation tactic (using competitor price as leverage)

### AIRC Response

**Acknowledge:**
"$350K is a meaningful commitment, and I respect that you need to make every dollar accountable. Your agency is right that programmatic can deliver reach at a lower CPM — that's exactly what programmatic is designed for."

**Isolate:**
"Help me understand — if the investment were aligned to your budget, is this the right solution and the right time? Or are there other concerns beyond the number?"

*[If they confirm price is the main issue, proceed to Respond]*

**Respond (ROI Reframe + Competitive TCO):**
"Let's compare apples to apples. The $200K programmatic buy gets you impressions — but what's the expected conversion rate? In our experience with CPG brands, programmatic-only campaigns see a 0.3% CTR and a $45 CPA. Our integrated approach delivers a 1.2% CTR and a $22 CPA because we're reaching audiences in a contextually relevant environment where purchase intent is higher.

At $200K and a $45 CPA, you acquire roughly 4,400 customers. At $350K and a $22 CPA, you acquire roughly 15,900 customers. That's 3.6x the customer acquisition for 1.75x the investment. The real question isn't 'which costs less' — it's 'which delivers more revenue per dollar?'

And I want to be flexible here. If $350K is a hard ceiling, let's look at what a $275K version looks like — we can phase the campaign and prove the model in Q3, then scale in Q4 with the data to justify additional investment."

**Confirm:**
"Does that math change the way you're thinking about the comparison? And would a phased approach like that work with your budget cycle?"

### Recommended Follow-Up
1. Send the ROI comparison in a 1-page PDF within 24 hours
2. Include a case study from a comparable CPG brand
3. Propose a brief call with the agency to walk through the math together
4. Draft a phased SOW at $275K as an alternative
