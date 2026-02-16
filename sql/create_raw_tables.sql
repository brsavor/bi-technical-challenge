CREATE TABLE IF NOT EXISTS raw.backend_events AS
SELECT *
FROM read_csv(
    'data/backend_events.csv',
    columns = {
        'event_id': 'VARCHAR',
        'event_name': 'VARCHAR',
        'event_timestamp': 'TIMESTAMP',
        'user_id': 'VARCHAR',
        'organization_id': 'VARCHAR',
        'event_properties': 'VARCHAR'
    },
    header = true
);

CREATE TABLE IF NOT EXISTS raw.hubspot_companies AS
SELECT *
FROM read_csv(
    'data/hubspot_companies.csv',
    columns = {
        'company_id': 'BIGINT',
        'company_name': 'VARCHAR',
        'domain': 'VARCHAR',
        'industry': 'VARCHAR',
        'country': 'VARCHAR',
        'number_of_employees': 'VARCHAR',
        'create_date': 'TIMESTAMP'
    },
    header = true
);

CREATE TABLE IF NOT EXISTS raw.hubspot_contacts AS
SELECT *
FROM read_csv(
    'data/hubspot_contacts.csv',
    columns = {
        'contact_id': 'BIGINT',
        'first_name': 'VARCHAR',
        'last_name': 'VARCHAR',
        'email': 'VARCHAR',
        'job_title': 'VARCHAR',
        'hubspot_company_id': 'BIGINT',
        'lifecycle_stage': 'VARCHAR',
        'create_date': 'TIMESTAMP'
    },
    header = true
);

CREATE TABLE IF NOT EXISTS raw.hubspot_deals AS
SELECT *
FROM read_csv(
    'data/hubspot_deals.csv',
    columns = {
        'deal_id': 'BIGINT',
        'deal_name': 'VARCHAR',
        'pipeline': 'VARCHAR',
        'is_closed': 'BOOLEAN',
        'is_closed_won': 'BOOLEAN',
        'amount': 'DECIMAL(18,2)',
        'close_date': 'TIMESTAMP',
        'create_date': 'TIMESTAMP',
        'hubspot_company_id': 'BIGINT',
        'deal_type': 'VARCHAR',
        'currency': 'VARCHAR',
        'date_entered_pre_pitch': 'TIMESTAMP',
        'date_entered_pitching': 'TIMESTAMP',
        'date_entered_product_testing': 'TIMESTAMP',
        'date_entered_price_offering': 'TIMESTAMP',
        'date_entered_contract_negotiation': 'TIMESTAMP',
        'date_entered_closed_won': 'TIMESTAMP',
        'date_entered_closed_lost': 'TIMESTAMP'
    },
    header = true
);



