-- table for cards data no cluster
create or replace table cards_v1 (
    user varchar,
    card_index varchar,
    card_brand varchar,
    card_type varchar,
    card_number varchar,
    expires varchar,
    cvv varchar,
    has_chip varchar,
    cards_issued varchar,
    credit_limit varchar,
    acct_open_date varchar,
    pin_last_changed varchar,
    on_dark_web varchar
);


-- check cards table
select * from cards_v1;

-- view table metadata
show tables like 'cards_%';