---
name: call-prep
description: |
  Triggers when the user is preparing for a sales meeting, needs a call briefing,
  or wants help structuring a conversation with a prospect or customer. Trigger
  phrases include "prep for my call with", "meeting with [company]", "what should
  I ask", "discovery questions", "agenda for", "call prep", "meeting prep",
  "demo prep", "negotiation prep", or "I have a meeting tomorrow with".
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

# Call Prep Skill

## When to Use

Activate this skill when:
- User is **preparing for an upcoming meeting** with a prospect or customer
- User asks for **discovery questions** or talking points
- User needs an **agenda** for a sales meeting
- User wants to **research a company or contact** before a call
- User asks "what should I cover in my meeting with [company]?"
- User needs help with **demo preparation** or presentation structure
- User is preparing for a **negotiation** or **close** meeting
- User wants a **post-call debrief** template or wants to record call notes

## Step-by-Step Methodology

### Step 1: Determine Meeting Type

Classify the meeting into one of six types (each has different prep requirements):

| Type | Goal | Prep Intensity | Key Output |
|---|---|---|---|
| **Discovery** | Understand buyer's world, identify pain, qualify opportunity | High | Question framework + research brief |
| **Demo** | Show relevant capabilities, advance to proposal | Medium-High | Demo script + objection prep |
| **Negotiation** | Align on terms, address commercial concerns | High | BATNA analysis + concession plan |
| **Close** | Get verbal/written commitment, finalize terms | Medium | Mutual action plan + paperwork |
| **Check-in** | Maintain relationship, identify expansion opportunities | Low-Medium | Account health review + expansion plays |
| **QBR** | Review performance, justify continued investment, expand | High | Performance report + growth proposal |

### Step 2: Gather Context

1. Check `data/memory/companies/` for the company profile
2. Check `data/memory/contacts/` for all known contacts at this company
3. Check `data/memory/deals/` for any active or past deals
4. Check `data/memory/wins/` and `data/memory/losses/` for historical context
5. If this is a new company, use WebSearch to gather:
   - Company overview (size, industry, key products, recent news)
   - Contact background (LinkedIn profile, role, tenure, background)
   - Industry trends and challenges
   - Competitive landscape
6. Read `data/memory/learnings/stage-progression.md` for patterns relevant to this deal stage

### Step 3: Build the Briefing

Generate a 1-page call briefing using the template below, adapted for the meeting type.

### Step 4: Prepare Meeting-Specific Content

Apply the relevant framework from the Meeting Type Adaptation section below.

### Step 5: Update Memory

After prep is complete:
- Create or update the company file in `data/memory/companies/`
- Create or update contact files in `data/memory/contacts/`
- Note the meeting date and type in the deal file
- After the meeting, prompt the user to record a debrief

---

## Pre-Meeting Research Checklist

### Company Research (Do This First)

- [ ] **Company basics:** Revenue, employee count, headquarters, public/private
- [ ] **Business model:** How do they make money? Who are their customers?
- [ ] **Strategic priorities:** What did their CEO say at the last earnings call / press release?
- [ ] **Recent news:** Any acquisitions, leadership changes, product launches, or layoffs in the last 90 days?
- [ ] **Industry context:** What macro trends are affecting their sector?
- [ ] **Tech stack:** What relevant technologies do they currently use? (Check job postings for clues)
- [ ] **Competitive landscape:** Who are THEIR competitors? How are they positioned?
- [ ] **Financial health:** Revenue growth, profitability, stock performance (if public). Any red flags?

### Contact Research (Do This Second)

- [ ] **Role and tenure:** What's their title? How long have they been in this role? At this company?
- [ ] **Background:** Where did they work before? What's their career trajectory?
- [ ] **Decision authority:** Are they a user, influencer, champion, or economic buyer?
- [ ] **Content signals:** Have they published articles, given talks, or posted on LinkedIn? What topics do they care about?
- [ ] **Shared connections:** Do you have mutual connections who could provide intel or a warm intro?
- [ ] **Communication style:** Based on previous interactions, are they detail-oriented or big-picture? Data-driven or story-driven? Fast-paced or deliberate?

### Deal Research (Do This Third)

- [ ] **Deal history:** What conversations have happened so far? Review all notes.
- [ ] **Current stage:** Where is this deal in the pipeline? Is the stage validated?
- [ ] **MEDDIC status:** What's the last known MEDDIC score? What gaps exist?
- [ ] **Competitor presence:** Are other vendors being evaluated? Who?
- [ ] **Outstanding questions:** What did we promise to follow up on? What questions remain unanswered?
- [ ] **Objections encountered:** What pushback have we received? What's unresolved?

---

## Agenda Design Methodology

### Principles

1. **Share the agenda in advance.** Send it 24 hours before the meeting. This signals professionalism and gives the buyer time to prepare (which makes the meeting more productive for you).

2. **Start with their priorities, not yours.** The first agenda item should be something the buyer cares about. "Understand your Q3 priorities" comes before "Walk through our platform."

3. **Build in time for discovery, even in non-discovery meetings.** Every meeting is an opportunity to learn something new. Reserve 20% of the time for open questions.

4. **End with clear next steps.** The last 5 minutes of every meeting should be: "Here's what we agreed to do, here's who's doing it, here's by when."

5. **Keep it short.** 4-6 bullet points. Not a detailed schedule — an agenda is a conversation map, not a script.

### Agenda Templates by Meeting Type

**Discovery (45-60 min):**
1. Introductions and context setting (5 min)
2. Understanding [Buyer]'s current priorities and challenges (15 min)
3. Exploring [specific pain area] in more depth (15 min)
4. Sharing relevant perspective from similar companies (10 min)
5. Discussing potential fit and next steps (5-10 min)

**Demo (45-60 min):**
1. Quick recap of key requirements discussed in discovery (5 min)
2. Walkthrough of [specific capability 1] — tied to [their pain point 1] (15 min)
3. Walkthrough of [specific capability 2] — tied to [their pain point 2] (15 min)
4. Q&A and discussion (10 min)
5. Alignment on next steps (5 min)

**Negotiation (30-45 min):**
1. Recap: what we've agreed on so far (5 min)
2. Discussion of outstanding items: [list specific items] (15-20 min)
3. Review of proposed timeline and implementation approach (5-10 min)
4. Agreement on path to close (5 min)

**Close (30 min):**
1. Final confirmation of scope and terms (10 min)
2. Review of mutual action plan: implementation timeline (10 min)
3. Contract logistics and signature process (5 min)
4. Kickoff scheduling (5 min)

**Check-in (30 min):**
1. How things are going on your end (10 min)
2. Performance review and wins since last meeting (10 min)
3. Upcoming opportunities and how we can help (5 min)
4. Any concerns or feedback (5 min)

**QBR (60 min):**
1. Executive summary of partnership performance (10 min)
2. Deep dive on key metrics and wins (15 min)
3. Challenges and optimization plan (10 min)
4. Roadmap and upcoming capabilities (10 min)
5. Growth opportunities and proposal for next phase (10 min)
6. Q&A and strategic alignment (5 min)

---

## Talking Points Framework

Every meeting should be prepared with this structure:

### 3 Discovery Questions

These are open-ended questions designed to uncover information you don't have yet. They should feel natural, not interrogative.

**Question design principles:**
- Start with "how" or "what" — never "do you" (yes/no questions kill conversation)
- Reference something specific about their business (shows preparation)
- Go beyond surface level — ask about impact, not just situation

**Examples by meeting type:**

*Discovery:*
1. "What's driving the urgency around [initiative] right now? I saw [specific trigger], and I'm curious how that's affecting your team's priorities."
2. "Walk me through how you're currently handling [specific process]. What works well, and where does it break down?"
3. "If you could wave a magic wand and fix one thing about [problem area], what would it be — and what would that be worth to the business?"

*Demo:*
1. "Before I show you the platform, what would you need to see to feel confident this fits your workflow?"
2. "You mentioned [specific requirement] in our last call. Has anything changed or evolved since then?"
3. "Who else on your team would be using this day-to-day? What would matter most to them?"

*Negotiation:*
1. "What does your internal approval process look like from here? Walk me through each step so I can help make it smooth."
2. "Is there anything in the proposal that doesn't make sense or feels off to you? I'd rather address it now."
3. "What would make this a clear yes for you? Not a 'probably yes' — a definitive yes."

### 2 Value Propositions

Tailored to THIS buyer, THIS meeting, THIS stage. Not your company's generic value prop — a specific articulation of what you can do for them.

**Structure:** "[Specific outcome] for [their company] by [specific mechanism], similar to what we did for [reference]."

**Examples:**
1. "We can reduce Meridian's programmatic CPA from $42 to under $30 by combining your first-party data with our contextual engine — the same approach that drove a 35% CPA reduction for [reference client] in their first quarter."
2. "We'll extend your addressable audience from 40% to 85% without any dependency on third-party cookies, which means your sales team can pitch data-driven targeting to advertisers — a capability that [competitor peer] already offers."

### 1 Close Question

The question or statement that advances the deal to the next stage. Adapted to meeting type.

**Discovery close:** "Based on what you've shared, I think there's a strong fit. Would it make sense to schedule a demo with your broader team next week?"

**Demo close:** "You've seen how this addresses [pain 1] and [pain 2]. What would you need to see to put together a proposal?"

**Negotiation close:** "It sounds like we're aligned on the approach. If I can get [specific concession] approved, can we target signing by [date]?"

**Close close:** "Everything looks good. Shall we lock in the start date and get the contract to legal?"

---

## Stakeholder Mapping for Multi-Person Meetings

When meeting with multiple people, map each stakeholder before the call:

### Stakeholder Map Template

| Name | Title | Role in Decision | Priority | Personality Type | Strategy |
|---|---|---|---|---|---|
| [Name] | [Title] | [EB/Champion/Influencer/User/Blocker] | [What they care about most] | [Analytical/Driver/Expressive/Amiable] | [How to engage them] |

### Role Definitions

- **Economic Buyer (EB):** Signs the check. Cares about ROI, risk, strategic alignment.
  - Strategy: Speak in outcomes and dollars. Be concise. Earn trust through preparation and directness.

- **Champion:** Wants you to win. Cares about their credibility and career advancement.
  - Strategy: Arm them with ammunition. Make them look smart. Coach them on internal selling.

- **Influencer:** Has an opinion that matters but doesn't decide. Often technical or operational.
  - Strategy: Respect their expertise. Address their criteria specifically. Don't try to sell them — inform them.

- **User:** Will use the product day-to-day. Cares about ease of use and impact on their workflow.
  - Strategy: Show empathy for their current pain. Demonstrate simplicity. Let them test-drive.

- **Blocker:** Opposes the deal for political, budgetary, or operational reasons.
  - Strategy: Understand their concern (it's usually valid). Address it directly, not around them. If possible, turn them into an influencer by incorporating their feedback.

### Personality-Based Engagement

**Analytical (data-driven, detail-oriented, skeptical):**
- Lead with data and proof points
- Don't rush them — they need time to process
- Provide written follow-up they can review on their own
- Never say "trust me" — show the evidence

**Driver (results-oriented, fast-paced, impatient):**
- Get to the point quickly — lead with outcomes
- Respect their time — if they ask a question, answer it directly
- Don't over-explain — they'll ask if they want more detail
- Frame everything as a competitive advantage

**Expressive (big-picture, enthusiastic, relationship-oriented):**
- Start with the vision — where could this partnership go?
- Tell stories and share examples — they respond to narrative
- Be energetic and engaging — match their style
- Follow up on personal details they share (shows you care)

**Amiable (collaborative, consensus-seeking, risk-averse):**
- Build trust before selling — take time to connect personally
- Emphasize team impact — how will this help their colleagues?
- Provide assurance and reduce risk — guarantees, references, phased approach
- Don't pressure — they'll resist if pushed

---

## Post-Call Debrief Template

After every call, record the following. This is the raw material for deal intelligence.

```markdown
# Post-Call Debrief: [Company] — [Date]

## Meeting Details
- **Type:** [Discovery / Demo / Negotiation / Close / Check-in / QBR]
- **Attendees (them):** [Names and titles]
- **Attendees (us):** [Names]
- **Duration:** [X minutes]

## Key Takeaways (Top 3)
1. [Most important thing learned or decided]
2. [Second most important]
3. [Third most important]

## Discovery Intel
- **New pain points identified:** [List]
- **New stakeholders mentioned:** [Names, titles, roles]
- **Budget signals:** [Any new info about budget, approval, timing]
- **Competitive mentions:** [Any competitors discussed]
- **Decision process updates:** [Any new info about how/when they'll decide]

## Objections or Concerns Raised
- **Objection 1:** [What they said] — **Response:** [What we said] — **Resolved?** [Y/N]
- **Objection 2:** [What they said] — **Response:** [What we said] — **Resolved?** [Y/N]

## What Went Well
- [Specific moment or exchange that landed]

## What Could Have Gone Better
- [Specific moment or exchange that fell flat or was missed]

## Agreed Next Steps
1. **[Action]** — Owner: [who] — By: [date]
2. **[Action]** — Owner: [who] — By: [date]
3. **[Action]** — Owner: [who] — By: [date]

## MEDDIC Impact
- [Which dimensions were strengthened or weakened by this meeting?]
- [Updated score for any dimension that changed]

## Follow-Up Required
- [ ] Send [document/email/resource] to [contact] by [date]
- [ ] Schedule [next meeting type] with [attendees] by [date]
- [ ] Update [CRM/deal file/contact file] with new information
- [ ] Prepare [deliverable] for next meeting
```

---

## Meeting Type Adaptation — Deep Dive

### Discovery Meeting Preparation

**Objective:** Understand the buyer's world deeply enough to determine mutual fit and identify their core pain. This is NOT a demo. Resist the urge to present.

**The 80/20 Rule:** The buyer should talk 80% of the time. You should talk 20%. If you're talking more, you're presenting, not discovering.

**Question Layering Technique:**
- **Level 1 (Situation):** "Tell me about your current approach to [area]."
- **Level 2 (Problem):** "What challenges are you running into with that approach?"
- **Level 3 (Impact):** "How does that affect [revenue/team/growth/competitiveness]?"
- **Level 4 (Root Cause):** "What do you think is driving that challenge?"
- **Level 5 (Quantification):** "If you had to put a number on the impact — dollars, hours, or percentage — what would it be?"

Most reps stop at Level 2. Great reps get to Level 4 and 5. That depth is what separates qualification from disqualification.

**Discovery danger signs (consider disqualifying):**
- Buyer gives one-word answers and doesn't engage → low interest or wrong person
- Buyer only asks about price → shopping, not buying
- Buyer can't articulate a problem → there may not be one
- Buyer says "we're just exploring" with no timeline → no urgency, no deal

### Demo Preparation

**Objective:** Show the buyer that your solution solves THEIR specific problem, not everything your product can do.

**The #1 Demo Mistake:** Showing every feature. Nobody cares about every feature. They care about the 3 features that solve their 3 problems.

**Demo Prep Formula:**
1. List the buyer's top 3 pain points (from discovery)
2. Map each pain to your strongest capability
3. Prepare a "day in the life" scenario using THEIR data/context
4. Rehearse the demo flow — 15 minutes per pain point, max
5. Prepare for objections at each transition point
6. End each section with: "Is this what you had in mind when you talked about [pain]?"

**Demo environment checklist:**
- [ ] Demo instance is loaded with relevant data/scenarios
- [ ] Screen sharing tested — no surprises with resolution, notifications, or bookmarks
- [ ] Backup plan if live demo fails (screenshots, recorded walkthrough)
- [ ] Every attendee's name and role confirmed — so you can direct comments appropriately

### Negotiation Preparation

**Objective:** Reach mutually acceptable terms while protecting your value and the buyer's trust.

**BATNA Analysis (Best Alternative to Negotiated Agreement):**

| Element | Ours | Theirs |
|---|---|---|
| **Best alternative** | [What do we do if this deal doesn't close?] | [What do they do if they don't buy from us?] |
| **Walk-away point** | [Minimum acceptable terms] | [Maximum they can stretch to] |
| **Ideal outcome** | [Best case] | [Best case for them] |
| **Leverage** | [Why they need us more than we need them, or vice versa] | [Same, their perspective] |

**Concession Planning:**

| Concession | Value to Them | Cost to Us | When to Offer | What to Get in Return |
|---|---|---|---|---|
| [e.g., 10% discount] | [High] | [Medium] | [Only if deal > $300K and 2+ year term] | [Longer commitment, case study rights, reference] |
| [e.g., Phased payment] | [Medium] | [Low] | [If cash flow is a genuine concern] | [Full contract value, auto-renewal] |
| [e.g., Free pilot] | [High] | [High] | [Only for strategic accounts] | [Defined success criteria that lead to full contract] |

**Negotiation rules:**
1. Never give a concession without getting one in return
2. Never negotiate against yourself (don't lower your price without being asked)
3. If they ask for a discount, ask "What would you need to see to pay full price?"
4. Silence is a tool — after making an offer, stop talking
5. Document every agreement in writing during the meeting, not after

### Close Meeting Preparation

**Objective:** Confirm everything is aligned and execute the paperwork.

**Pre-close checklist:**
- [ ] All stakeholders are aligned (no surprises from legal, procurement, or other influencers)
- [ ] Contract is drafted and reviewed internally
- [ ] All commercial terms are agreed (no open negotiations during the close meeting)
- [ ] Implementation plan is ready to share
- [ ] The buyer knows what to expect at this meeting

**Close meeting danger signs:**
- New stakeholder appears who wasn't in previous meetings → restart discovery with them
- Buyer wants to "review one more time" → unresolved objection. Find it.
- Legal has "a few questions" → could add 2-4 weeks. Start immediately.
- Buyer goes silent after the meeting → follow up within 24 hours with a specific next step

---

## Learnings Integration

After each call prep session:
1. Save the briefing to the deal file or as an attachment
2. After the meeting, prompt for a debrief and save to memory
3. Update `data/memory/learnings/stage-progression.md` if the meeting changes the deal stage
4. Update contact files with new intelligence about each stakeholder
5. If a new objection was encountered, log it in `data/memory/learnings/objection-patterns.md`

---

## Example Output: Discovery Call Briefing

```
# CALL BRIEFING: Meridian Media Group — Discovery
**Date:** March 20, 2026 | **Time:** 2:00 PM ET | **Duration:** 45 min
**Meeting Link:** [Zoom link]

## Attendees
| Name | Title | Role | What They Care About |
|---|---|---|---|
| Marcus Lee | Dir. of Digital | Champion (likely) | Proving digital can scale revenue |
| Jennifer Walsh | VP, Ad Operations | Influencer | Operational efficiency, platform reliability |

## Company Snapshot
- **Industry:** Digital media / publishing
- **Revenue:** $180M (est.) | **Employees:** ~600
- **Ad Revenue Split:** 62% linear / 38% digital (digital growing 22% YoY)
- **Recent News:** Hired new CTO from Vox Media (Jan 2026). Signals tech investment push.
- **Their Competitors:** Condé Nast Digital, BDG, Dotdash Meredith

## Meeting Objective
Understand Meridian's digital advertising infrastructure, identify pain points
around programmatic monetization and data capabilities, and determine if there's
a qualified opportunity worth pursuing.

## 3 Discovery Questions
1. "Marcus, you've been scaling the digital side rapidly — 38% of revenue
   and growing. What's the biggest bottleneck to getting that to 50%?"
2. "Jennifer, when an advertiser asks for audience-based targeting beyond
   basic demographics, how does your team handle that today? Where does
   the process break down?"
3. "If I looked at your average programmatic CPM over the last 12 months,
   what direction is it trending — and what do you think is driving that?"

## 2 Value Propositions
1. "We can help Meridian close the data gap with competitors like Dotdash
   Meredith by building a first-party audience platform that extends your
   targetable audience from ~40% to 85%+ — without any cookie dependency."
2. "Our contextual + behavioral targeting fusion typically drives 25-35%
   CPA improvement for publishers your size, which translates directly
   to higher yield per impression and a stronger pitch to advertisers."

## 1 Close Question
"Based on what you're sharing, it sounds like there might be a strong fit.
Would it make sense to schedule a deeper technical discussion with your
data team and our solutions engineers?"

## Watch For
- **Budget authority:** Does Marcus or Jennifer control budget, or is that the CMO?
- **Timeline signals:** Is there a forcing function (upfront season, contract expiration)?
- **Competitive landscape:** Are they evaluating other solutions? Who?
- **Champion test:** Is Marcus willing to make internal introductions?

## Do NOT
- Demo the product (this is discovery, not demo)
- Talk for more than 30 seconds without asking a question
- Assume you know their problems — let them tell you
```
