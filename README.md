# Flinn BI Technical Challenge

This repository contains the data files for the Flinn BI Technical Challenge.

## Instructions

Please read the full challenge instructions here:

**[BI Technical Challenge — Instructions](https://www.notion.so/flinncomply/BI-Technical-Challenge-3036cc4a522d8010bd49f7ce8039ef34?source=copy_link)**

## Data Files

The `data/` folder contains four CSV files:

| File | Source |
|---|---|
| `backend_events.csv` | Product backend |
| `hubspot_deals.csv` | HubSpot CRM |
| `hubspot_companies.csv` | HubSpot CRM |
| `hubspot_contacts.csv` | HubSpot CRM |

## Questions?

Email [heiko@flinncomply.com](mailto:heiko@flinncomply.com).

# Solution

To solve the challenge, I used only SQL queries, in combination with DuckDB to run the queries and analyze the data, so the SQL is aligned to DuckDB SQL sytax. In _sql/_ folder are two .sql files I used to create schema in the database, and then tables in that schema which I created based on provided .csv files.
Additionally, I submitted PowerBI file where I created simple dashboard.

Since I didn't have prior experience working at SaaS, I used AI to find out what are the different ways of measuring user retention so I can understand it and ask right question. Also, AI helped me with one DuckDB SQL function I didn't know exist ( `Date_part('isoyear', event_timestamp) = 2026` to easily get entire Week-1 for the last question). In general, I use AI a lot with python for example, but for SQL, I'm very used to it and to me is even easier to write it myself using my own way of writing queries, and not checking what AI generated and whether it is what I wanted it to be.

## Question 1: How many customers do we have today?

SQL query with the final solution is located in _sql/challenge_solutions/question_1.sql_.

I had an assumption that I can just take the companies that are labeled as "customer" in _hubspot_contacts.csv_, but after checking in with Heiko, I realized that there are some customers that churned, so for the final solution, I took all the companies from _hubspot_deals.csv_ that were won, but were never lost, so that way I got number of customers Flinn has today.

I didn't really saw some data quality issues here, but perhaps it would make more sense to me if _lifecycle_stage_ column was in the _hubspot_companies.csv_, and not in _hubspot_contacts.csv_.

<img width="201" height="74" alt="image" src="https://github.com/user-attachments/assets/c879dafc-8007-433c-8d11-e840e68d1b53" />

## Question 2: What is our Average Contract Value (ACV)?

SQL query with the final solution is located in _sql/challenge_solutions/question_2.sql_.

At first, my assumption was that you're interested in ACV of "won" customers, but as Heiko explained, you're interested in any "closed" contract and after that the question was very much straight forward, and I didn't have any other challenges, or comments. I took all "closed" contracts from _hubspot_deals.csv_ and calculated average of the contract value.

<img width="127" height="64" alt="image" src="https://github.com/user-attachments/assets/dfdab381-ebe5-489e-8a9c-b1bbe4153d2d" />

## Question 3: What is the retention of our users?

SQL query with the final solution is located in _sql/challenge_solutions/question_3.sql_.

First of all, I asked Heiko what is definition of retention for you at Flinn, and since retention measures user activity I wanted to make sure I understand what event types in _backend_events.csv_ are saying that user is active. After instructions were clear - taking snapshot of customer users on 01.01.2026., and calculating what percentage of them were active each week until today, excluding _TokenGenerated_, _UserCreated_, _UserUpdated_, _OrganizationCreated_, _OrganizationUpdated_ event types - I haven't encountered any technical issues to answer the question.

Looking at the results, it's visible that Week-1 has a bit lower retention, but I wouldn't say that is surprising since Week-1 consisted of only 4 days in 2026, with 3 of them being non-working days (New Year and the weekend). I added one more condition to the query, so we can see what happens when we take entire Week-1, which is from 29.12.2025. until 04.01.2026. Results are below. It was interesting to me to see that if we take entire Week-1, retention is actually completely aligned with other weeks in 2026., even though this holiday season was very convenient to connect public holidays and weekends into a longer vacation.

#### Retention taking only events from 2026.:
<img width="535" height="207" alt="image" src="https://github.com/user-attachments/assets/97cc829b-55c7-405c-b048-ac00fb016ad5" />

#### Retention taking entire Week-1 (events from 29.12.2025. onwards):
<img width="541" height="206" alt="image" src="https://github.com/user-attachments/assets/1ecd2014-d6f3-49e7-82b8-6fda17211170" />

## PowerBI Dashboard

It is consisting of 2 pages- Customers Overview and Events. 

Customers Overview contains _hubspot_ data, giving insigts into number of current customers, Average Contract Value, ratio of customers per lifecycle stage, and then details about customers themselves and deals related to them. There's filtering option if we're interested in specific lifecycle stage.

Events consists of _backend_events_ data. There I put trend lines to see the how the number of users and user activity develop over time. Based on the visuals, we can see that both numbers grew continuously until around September and October last year, and since then they are stagnating with not much fluctuation.

Below, I added bar chart to see the number of users per organization - this could give us insight into who are the biggest customers in terms of users. Next to that we can see what type of events are most commonly used- there we see that two most used operations are _SearchExecuted_ and _SearchResultAppraised_ - which could tell us what is the biggest value of the app itself, and which features are not that used.

Finally, there is a heatmap visual to show activity per organization and by week. This could give us an insight into who are the key customers that keep using the app, we could see if there are risks of churn in case some organization's activity is getting lower, and we could identify upsell opportunities. Upsell can't be identified just with data provided, but if some organization has high usage, and not using all the app features (we'd need that data to combine it together), you could offer upsell to that customer.

#### Customers overview
<img width="1165" height="659" alt="image" src="https://github.com/user-attachments/assets/98c1c703-42a9-4e77-815c-6579f5dc82b1" />

#### Events
<img width="877" height="725" alt="image" src="https://github.com/user-attachments/assets/3711fcdd-9a66-4386-bfbc-793b8ebc09ce" />

