-- table for user data no cluster
create or replace table users_v1 (
    person varchar(30),
    current_age int,
    retirement_age int,
    birth_year varchar,
    birth_month varchar,
    gender varchar,
    address varchar,
    apartment varchar,
    city varchar(60),
    state varchar,
    zipcode varchar(10),
    latitude varchar,
    longitude varchar,
    per_capita_income_zipcode varchar,
    yearly_income_person varchar,
    total_debt varchar,
    fico_score varchar,
    num_credit_cards varchar
);

-- check created table
select * from users_v1;

-- view table metadata
show tables like 'users_%';