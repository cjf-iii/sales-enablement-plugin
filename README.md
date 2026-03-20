# Sales Enablement Plugin for Claude Code

**A production-grade AI sales operations system built as a Claude Code plugin.**

Built by **CJ Fleming** — media sales leader with 15+ years of experience in digital advertising, audience monetization, and revenue operations. Columbia University AI certification. This plugin is the intersection of deep sales operations expertise and AI-native systems thinking.

---

## What This Is

A complete sales enablement system that runs inside Claude Code, providing enterprise-grade deal analysis, objection handling, competitive intelligence, proposal generation, and pipeline analytics — all backed by persistent memory and self-learning capabilities.

This is not a chatbot with sales tips. It is a structured operating system for managing a complex B2B sales pipeline, built on proven frameworks (MEDDIC, AIRC, SCRAP, SPIN, Challenger) and designed to get smarter with every interaction.

---

## Architecture

```
sales-enablement/
|
|-- .claude-plugin/
|   '-- plugin.json                  # Plugin manifest and component registry
|
|-- skills/                          # Five domain-specific skill definitions
|   |-- deal-analysis/SKILL.md       # MEDDIC scoring, stage validation, risk assessment
|   |-- objection-handling/SKILL.md  # AIRC framework, objection taxonomy, response library
|   |-- competitor-intel/SKILL.md    # Battle cards, SWOT, trap questions, win/loss patterns
|   |-- proposal-craft/SKILL.md      # SCRAP framework, value quantification, quality gate
|   '-- call-prep/SKILL.md          # Research checklists, agenda design, stakeholder mapping
|
|-- agents/                          # Three specialized AI agents
|   |-- deal-strategist.md           # Strategic advisor for complex deals (Opus)
|   |-- proposal-reviewer.md         # Quality reviewer for proposals (Sonnet)
|   '-- pipeline-analyst.md         # Data-driven pipeline analytics (Sonnet)
|
|-- commands/                        # Five slash commands
|   |-- analyze-deal.md              # /analyze-deal [company]
|   |-- prep-call.md                 # /prep-call [company] [contact] [type]
|   |-- battle-card.md               # /battle-card [competitor]
|   |-- proposal.md                  # /proposal [company] [value] [type]
|   '-- pipeline.md                 # /pipeline [review|forecast|risk|velocity]
|
|-- hooks/
|   '-- hooks.json                  # Session startup + prompt context injection
|
|-- scripts/
|   |-- load-sales-context.sh        # Pipeline summary at session start
|   '-- inject-context.sh           # Auto-detect company/contact mentions
|
|-- data/
|   |-- frameworks/                  # Sales methodology references
|   |   |-- meddic.md               # MEDDIC with scoring rubrics
|   |   |-- bant.md                  # BANT with modern adaptations
|   |   |-- challenger.md            # Challenger Sale methodology
|   |   |-- spin.md                  # SPIN Selling question framework
|   |   '-- meddicc.md              # Extended MEDDIC (Competition + Champion Coaching)
|   |
|   |-- templates/                   # Reusable document templates
|   |   |-- proposal-template.md     # SCRAP-structured proposal skeleton
|   |   |-- battle-card-template.md  # Competitive battle card format
|   |   |-- deal-memo-template.md    # Internal deal assessment format
|   |   |-- call-briefing-template.md # Pre-meeting briefing format
|   |   '-- win-loss-template.md    # Post-decision analysis format
|   |
|   |-- playbooks/objections/        # Objection response libraries
|   |   |-- price.md                 # 5 response patterns for price objections
|   |   |-- timeline.md              # 4 response patterns for timeline objections
|   |   |-- competition.md           # 4 response patterns for competitive objections
|   |   |-- authority.md             # 3 response patterns for authority objections
|   |   |-- need.md                  # 3 response patterns for need objections
|   |   '-- risk.md                 # 3 response patterns for risk objections
|   |
|   '-- memory/                     # Persistent deal intelligence
|       |-- companies/               # Company profiles and battle cards
|       |-- contacts/                # Individual stakeholder records
|       |-- deals/                   # Active deal files with MEDDIC scores
|       |-- wins/                    # Won deal analyses
|       |-- losses/                  # Lost deal analyses
|       '-- learnings/              # Self-learning pattern logs
|           |-- objection-patterns.md
|           |-- win-rate-factors.md
|           |-- stage-progression.md
|           '-- proposal-effectiveness.md
|
'-- README.md
```

---

## Component Inventory

| Category | Count | Components |
|---|---|---|
| **Skills** | 5 | Deal Analysis, Objection Handling, Competitor Intel, Proposal Craft, Call Prep |
| **Agents** | 3 | Deal Strategist (Opus), Proposal Reviewer (Sonnet), Pipeline Analyst (Sonnet) |
| **Commands** | 5 | /analyze-deal, /prep-call, /battle-card, /proposal, /pipeline |
| **Frameworks** | 5 | MEDDIC, BANT, Challenger, SPIN, MEDDICC |
| **Templates** | 5 | Proposal, Battle Card, Deal Memo, Call Briefing, Win/Loss |
| **Playbooks** | 6 | Price, Timeline, Competition, Authority, Need, Risk |
| **Hooks** | 2 | Session startup pipeline summary, prompt context injection |
| **Scripts** | 2 | Pipeline loader, context injector |
| **Learnings** | 4 | Objection patterns, win rate factors, stage progression, proposal effectiveness |
| **Sample Data** | 10 | 3 companies, 3 contacts, 2 deals, 1 win, 1 loss |

---

## How It Works

### Automatic Context Loading

When you start a session, the `load-sales-context.sh` hook scans all active deals and provides an immediate pipeline summary:

```
Active Pipeline: 2 deals worth $755K total. 0 at risk.
```

When you mention a company or contact name in any prompt, the `inject-context.sh` hook detects the match and surfaces the relevant memory file, so Claude has deal intelligence without you needing to say "look up the file."

### Slash Commands

**`/analyze-deal meridian-media`** — Runs MEDDIC scoring, validates the deal stage against gate criteria, calculates a weighted risk score, and outputs a Deal Health Card with prioritized next actions.

**`/prep-call meridian-media "Marcus Lee" discovery`** — Generates a focused call briefing with company research, stakeholder mapping, tailored discovery questions, value propositions, and a close question appropriate to the meeting type.

**`/battle-card tradedesk`** — Produces a competitive battle card with positioning, trap questions, landmine detection, pricing intel, and reference suggestions.

**`/proposal meridian-media 350000 new-business`** — Generates a SCRAP-structured proposal, runs value quantification (ROI, payback, cost of inaction), selects relevant case studies, then dispatches the proposal-reviewer agent for a 10-point quality gate review.

**`/pipeline review`** — Reads all active deals, calculates weighted pipeline value, identifies at-risk deals, and generates prioritized recommendations. Also supports `forecast`, `risk`, and `velocity` actions.

### Self-Learning System

Every interaction accumulates intelligence in the `data/memory/learnings/` directory:

- **Objection patterns** — Which response patterns work best against which objection types
- **Win rate factors** — Which MEDDIC dimensions are most predictive of outcomes
- **Stage progression** — How quickly deals move between stages and where they stall
- **Proposal effectiveness** — Which proof types, pricing structures, and value frames convert best

This data feeds back into future analyses, making the system's recommendations increasingly calibrated to your specific pipeline and buyer patterns.

---

## Installation

### As a Claude Code Plugin

1. Clone or copy this repository to your desired location
2. In your Claude Code project, add the plugin path to your configuration:

```bash
# Add to your .claude/settings.json or project settings
{
  "plugins": [
    "/path/to/sales-enablement"
  ]
}
```

3. Restart Claude Code. The plugin will register all skills, agents, commands, and hooks automatically.

### Verify Installation

Start a new Claude Code session. You should see the pipeline summary from the session startup hook. Then test a command:

```
/analyze-deal meridian-media
```

You should receive a complete Deal Health Card with MEDDIC scoring for the sample Meridian Media deal.

---

## Design Principles

### 1. Memory-First Architecture

Every interaction reads from and writes to persistent memory files. The system doesn't just answer questions — it accumulates intelligence that makes every future interaction more informed. Deal files, contact records, and learnings persist across sessions.

### 2. Framework-Driven, Not Opinion-Driven

Every recommendation is grounded in a proven sales methodology (MEDDIC, AIRC, SCRAP, SPIN, Challenger). The frameworks are embedded directly in the skill definitions — not referenced as external links, but included as actionable content with scoring rubrics, decision trees, and example outputs.

### 3. Honest by Default

The system is designed to challenge optimism, not validate it. Deal stages are validated against gate criteria. Risk scores are calculated with weighted models. "This deal is at risk" is a feature, not a bug. Sales leaders need truth, not cheerleading.

### 4. Agent Specialization

Three agents with distinct personas and model selections:
- **Deal Strategist** (Opus) — Deep strategic thinking for complex, high-stakes situations
- **Proposal Reviewer** (Sonnet) — Fast, thorough quality review against the 10-point gate
- **Pipeline Analyst** (Sonnet) — Data-driven pattern recognition across the full pipeline

Each agent has behavioral guidelines that produce noticeably different output than base Claude — they have specific expertise, communication styles, and analytical approaches.

### 5. Context-Aware Hooks

The hook system provides automatic context without user effort. Session startup summarizes the pipeline. Prompt injection detects company and contact mentions. The user doesn't need to remember file paths or ask Claude to "look something up" — relevant context surfaces automatically.

---

## The AI + Sales Intersection

This plugin demonstrates a specific thesis: **the highest-leverage application of AI in sales is not automation — it is augmented judgment.**

AI doesn't close deals. People close deals. But people close more deals when they have:
- Rigorous qualification frameworks applied consistently (not when they remember to)
- Competitive intelligence surfaced at the moment of need (not buried in a SharePoint)
- Objection responses refined by pattern matching across all past interactions (not relying on individual memory)
- Proposals reviewed against quality standards before they ship (not after they lose)
- Pipeline analytics that expose reality instead of confirming hope

This plugin puts all of that into the tool where salespeople increasingly live: their AI assistant.

---

## About the Builder

**CJ Fleming** is a media sales leader with 15+ years of experience in digital advertising, audience monetization, and revenue operations. He has led sales teams at major media companies, managed eight-figure pipelines, and built the operational infrastructure that enables high-performing sales organizations.

His Columbia University AI certification bridges the gap between deep sales domain expertise and modern AI systems architecture. This plugin is a working demonstration of that intersection — not theory, but a production system that reflects how enterprise sales actually operates.

---

## Tech Stack

- **Runtime:** Claude Code plugin system
- **Languages:** Markdown (skills, agents, commands, frameworks), Bash (hooks, scripts)
- **Architecture:** Skill-based dispatch with persistent file-system memory
- **Models:** Opus (strategic reasoning), Sonnet (analytical tasks)
- **Frameworks:** MEDDIC, MEDDICC, BANT, SPIN, Challenger, SCRAP, AIRC

---

## License

This project is a portfolio demonstration by CJ Fleming. All frameworks, methodologies, and content are original compositions based on publicly available sales methodologies, adapted for AI-native implementation.
