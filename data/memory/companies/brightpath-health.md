---
name: "BrightPath Health"
industry: "Healthcare / Digital Health"
revenue_estimate: "$95M"
employees: 340
headquarters: "Boston, MA"
website: "brightpathhealth.com"
last_updated: "2026-03-10"
---

# BrightPath Health

## Company Overview

BrightPath Health is a digital health platform connecting patients with specialists through telemedicine, health content, and provider directories. They monetize through a mix of provider subscriptions, pharmaceutical advertising, and health plan partnerships. Monthly active users: 8.2M. Strong in chronic condition management (diabetes, cardiology, mental health).

## Strategic Priorities (2026)

1. **Scale pharmaceutical advertising revenue** — Currently 18% of revenue, targeting 30% by 2027
2. **HCP (Healthcare Professional) audience targeting** — Pharma advertisers demand ability to reach verified physicians and specialists
3. **HIPAA-compliant data infrastructure** — Must maintain regulatory compliance while building ad targeting capability
4. **Programmatic expansion** — Currently 100% direct-sold; exploring programmatic for fill rate and scale

## Key Pain Points (Validated)

1. **Manual campaign management** — All ad campaigns are manually trafficked. Team of 4 manages 120+ active campaigns. Operational ceiling approaching.
2. **Limited targeting sophistication** — Can target by condition interest and geography, but can't offer behavioral or look-alike targeting that pharma advertisers increasingly demand.
3. **Measurement gap** — Can't demonstrate script lift, HCP engagement, or other pharma-specific outcomes. Losing RFPs to competitors who can.

## Technology Stack

- Ad Server: Custom (legacy, built in-house 2019)
- DMP: None (first-party data in Snowflake but not activated for advertising)
- CMS: WordPress VIP
- CRM: Salesforce
- Compliance: OneTrust (privacy), custom HIPAA layer

## Decision-Making Notes

- Healthcare companies are slower decision-makers due to compliance requirements
- Legal review adds 4-6 weeks minimum for any vendor involving patient data
- CTO has veto power on any technology decision
- Strong preference for SOC 2 Type II certified vendors

## Internal Champions & Blockers

- **Rachel Torres (VP, Advertising Revenue)** — Champion. Directly accountable for growing ad revenue.
- **Dr. Michael Okafor (Chief Medical Officer)** — Potential blocker. Concerned about patient data usage in advertising.
- **James Liu (CTO)** — Gatekeeper. Will evaluate technical architecture and compliance.
- **Sarah Kim (CFO)** — Economic buyer for investments above $200K.
