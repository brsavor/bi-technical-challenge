# Flinn BI Technical Challenge

> **Welcome to the Flinn BI Technical Challenge!**
>
> At Flinn, we're redefining how medical device manufacturers build safer, higher-quality products — 10x more efficiently. As our BI & Analytics Engineer, you'll shape how the entire company understands its data. This challenge gives you a real taste of that work.

## Your Challenge For Today

You've just joined Flinn as the first dedicated BI hire. The leadership team needs answers to critical business questions — and all they've given you is a set of raw data exports from two systems: our **product backend** and our **HubSpot CRM**.

**Your job**: explore the data, connect the dots across sources, and deliver clear, trustworthy insights.

There are no trick questions — but the data isn't perfectly clean either. Just like real life.

---

## Getting Started

### Step 1: Fork the Repository

Fork this repo to your own GitHub account. You'll submit your work as a link to your forked repo.

### Step 2: Explore the Data

The repo contains four CSV files in the `data/` folder spanning two source systems. Part of the challenge is understanding how these datasets relate to each other.

| File | Description |
|---|---|
| `data/backend_events.csv` | Product usage events from the Flinn application backend. Each row represents a single event with a timestamp, user ID, organization ID, and event type. |
| `data/hubspot_deals.csv` | Deal (opportunity) records exported from HubSpot CRM — includes deal stages, monetary values, and associated company records. |
| `data/hubspot_companies.csv` | Company/organization records from HubSpot CRM. |
| `data/hubspot_contacts.csv` | Contact (person) records from HubSpot CRM, including organization associations. |

### Step 3: Understand the Events

The `backend_events.csv` contains the following event types:

| Event Name | Description |
|---|---|
| `TokenGenerated` | Triggered each time a user's authentication token is created or refreshed (e.g., on login or session renewal). |
| `SearchCreated` / `SearchUpdated` | A user creates or modifies a saved search query in the Flinn app. |
| `SearchExecuted` | A search query is run against the regulatory database. |
| `SearchExported` | A user exports search results (e.g., to CSV or PDF). |
| `SearchResultAppraised` | A user reviews or evaluates an individual search result. |
| `SearchResultFullTextAppraised` | A user opens and reviews the full-text content of a regulatory document from the search results. |
| `LabelCreated` / `LabelUpdated` / `LabelDeleted` | A user manages labels (tags/categories) for organizing their regulatory documents. |
| `UserCreated` / `UserUpdated` | User accounts are created or modified within the Flinn app. |
| `OrganizationCreated` / `OrganizationUpdated` | Organization records are created or modified within the Flinn app. |

---

## Your Tasks

Using the provided data, answer the following business questions. For each, show your work — we want to understand your approach and reasoning, not just a final number.

### Question 1: How many customers do we have today?

### Question 2: What is our Average Contract Value (ACV)?

### Question 3: What is the retention of our users?

### Bonus (optional): Surface one additional insight

If something interesting catches your eye while exploring the data — a trend, an anomaly, a data quality issue, a risk — we'd love to hear about it.

---

## What to Submit

Please include the following in your forked repo:

**1. Your analysis code** — SQL queries, a Python notebook, dbt models, or whatever tool you prefer. We want to see how you got to your answers, not just the output. Clean, documented code is appreciated.

**2. A short write-up** — For each question, briefly explain: your answer, the assumptions you made, and any data quality issues you encountered. A README or a short document works perfectly. Think of it as "what would I present to the team in a 10-minute standup?"

**3. An assumptions log** — If something wasn't clear and you had to make a judgment call, write it down. We value this more than you might think.

---

## Practical Details

**Duration:** We estimate this takes approximately **2–3 hours**. Please don't over-engineer it — we value clear thinking over polish.

**Deadline:** There is no hard deadline. Fit it into your schedule over the next few days, but please give us a quick heads-up on your expected timeline so we can plan accordingly.

**Tools:** Use whatever you're most productive with — SQL, Python, dbt, Excel, a BI tool, or a combination. If you want to build a quick dashboard, go for it — but it's absolutely not required.

**AI Usage:** Use AI as much as you'd like — we use AI extensively at Flinn and it's part of how we work. Just add a brief note on where AI assisted you. We're curious about your workflow, not trying to catch anyone out.

---

## Questions? Please ask them!

If something in the data, the questions, or the setup is unclear — **do not guess**. Send an email to [heiko@flinncomply.com](mailto:heiko@flinncomply.com) and you'll get a response within 6 hours (usually much faster, 12h max).

Asking good questions is a strength, not a weakness. We'd rather you clarify upfront than build on wrong assumptions.

---

## What We Care About

We're not grading this like an exam. Here's what we pay attention to:

- **Analytical rigor** — Are your numbers trustworthy? Did you validate your work?
- **Data quality awareness** — Real-world data has quirks. Did you notice any?
- **Clear communication** — Could a non-technical stakeholder understand your findings?
- **Pragmatism** — Did you make smart trade-offs given the time constraint?
- **Structured thinking** — Is your work organized in a way that others could build on it?

---

Good luck — and most importantly, have fun with it! We're genuinely looking forward to seeing how you think.

**The Flinn Team**
