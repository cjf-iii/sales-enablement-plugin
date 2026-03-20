---
name: prep-call
description: |
  Generate a comprehensive call briefing for an upcoming sales meeting.
  Adapts content based on meeting type: discovery, demo, negotiation,
  close, check-in, or QBR.
usage: /prep-call [company] [contact-name] [meeting-type]
arguments:
  - name: company
    description: The company name for the meeting
    required: true
  - name: contact-name
    description: The primary contact you're meeting with
    required: false
  - name: meeting-type
    description: "One of: discovery, demo, negotiation, close, check-in, qbr"
    required: false
    default: discovery
---

# /prep-call [company] [contact-name] [meeting-type]

## What This Command Does

Generates a focused, 1-page call briefing for an upcoming sales meeting. The briefing adapts its content based on the meeting type — a discovery call gets research and questions, a negotiation call gets BATNA analysis and concession planning, a close call gets paperwork and final objection prep.

## Execution Steps

### 1. Parse Arguments

- **company:** Required. Match against files in `data/memory/companies/`
- **contact-name:** Optional. Match against files in `data/memory/contacts/`. If not provided, use all known contacts for the company.
- **meeting-type:** Optional. Defaults to "discovery". Valid values: discovery, demo, negotiation, close, check-in, qbr

### 2. Load Context

```
Read data/memory/companies/[company].md
Glob data/memory/contacts/*  — filter for contacts at this company
Read data/memory/deals/[company].md  (if exists)
Read data/memory/wins/ and data/memory/losses/  — check for history with this company
Read data/memory/learnings/objection-patterns.md  — known objections from this company
Read data/memory/learnings/stage-progression.md  — relevant stage patterns
```

If company file doesn't exist:
- Use WebSearch to gather basic company intelligence
- Create a new company file in `data/memory/companies/`
- Inform the user that initial research was performed and they should verify key details

If contact file doesn't exist:
- Create a placeholder contact file in `data/memory/contacts/`
- Ask the user for title, role in decision, and any known background

### 3. Conduct Research (if needed)

For new companies or contacts without recent research:
- Run the Pre-Meeting Research Checklist from the call-prep skill
- Focus on: recent news, strategic priorities, competitive landscape
- For contacts: role, background, communication style indicators

### 4. Build the Briefing

Generate a briefing using the appropriate template from the call-prep skill.

**All meeting types include:**
- Company snapshot (key facts at a glance)
- Attendee table (name, title, role, priorities)
- Meeting objective (one sentence)
- 3 discovery questions (tailored to meeting type)
- 2 value propositions (tailored to buyer and stage)
- 1 close question (appropriate to meeting type)
- Watch-for signals (what to listen for)
- Do-not list (common mistakes to avoid)

**Meeting-type-specific additions:**

| Type | Additional Content |
|---|---|
| Discovery | Question layering framework, qualification criteria, disqualification signals |
| Demo | Demo script outline, feature-to-pain mapping, objection prep for each section |
| Negotiation | BATNA analysis, concession plan, walk-away conditions, anchor strategy |
| Close | Pre-close checklist, paperwork status, implementation plan preview |
| Check-in | Account health metrics, expansion opportunities, renewal timeline |
| QBR | Performance summary, optimization recommendations, growth proposal |

### 5. Update Memory

- Update company file with any new research
- Create or update contact files
- Add prep date to deal file
- After the meeting, prompt the user to record a debrief using the post-call template

## Example Usage

```
/prep-call meridian-media
/prep-call meridian-media "Marcus Lee" discovery
/prep-call snap "Jennifer Walsh" negotiation
/prep-call "Johnson & Johnson" demo
/prep-call meridian-media check-in
```

## Output Format

The briefing is structured as a single-page reference document (see the example in `skills/call-prep/SKILL.md`). It should be dense enough to be useful but scannable enough to review in 5 minutes before walking into the meeting.
