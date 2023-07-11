-- table with no cluster key 
create or replace table transactions_v1 (
    t_user varchar(5),
    t_card varchar(1),
    t_year int,
    t_month int,
    t_day int,
    t_time time,
    t_amount varchar(20),
    t_use_chip varchar(20),
    t_merchant_name int,
    t_merchant_city varchar(30),
    t_merchant_state varchar(40),
    t_zip_code varchar(10),
    t_mcc int,
    t_errors varchar(25),
    t_is_fraud varchar(3)
);

-- check transactions table
select * from transactions_v1;

-- table with "low-cardinality" cluster key 
create or replace table transactions_v2 (
    t_user varchar(5),
    t_card varchar(1),
    t_year int,
    t_month int,
    t_day int,
    t_time time,
    t_amount varchar(20),
    t_use_chip varchar(20),
    t_merchant_name int,
    t_merchant_city varchar(30),
    t_merchant_state varchar(40),
    t_zip_code varchar(10),
    t_mcc int,
    t_errors varchar(25),
    t_is_fraud varchar(3)
)
cluster by (t_is_fraud);


-- check transactions table
select * from transactions_v2;

-- table with "high-cardinality" cluster key 
create or replace table transactions_v3 (
    t_user varchar(5),
    t_card varchar(1),
    t_year int,
    t_month int,
    t_day int,
    t_time time,
    t_amount varchar(20),
    t_use_chip varchar(20),
    t_merchant_name int,
    t_merchant_city varchar(30),
    t_merchant_state varchar(40),
    t_zip_code varchar(10),
    t_mcc int,
    t_errors varchar(25),
    t_is_fraud varchar(3)
)
cluster by (t_merchant_name);

-- check transactions table
select * from transactions_v3;

-- table with multi-column cluster key 
create or replace table transactions_v4 (
    t_user varchar(5),
    t_card varchar(1),
    t_year int,
    t_month int,
    t_day int,
    t_time time,
    t_amount varchar(20),
    t_use_chip varchar(20),
    t_merchant_name int,
    t_merchant_city varchar(30),
    t_merchant_state varchar(40),
    t_zip_code varchar(10),
    t_mcc int,
    t_errors varchar(25),
    t_is_fraud varchar(3)
)
cluster by (t_month, t_year, t_day);

-- check transactions table
select * from transactions_v4;

-- table with expression cluster key 
create or replace table transactions_v5 (
    t_user varchar(5),
    t_card varchar(1),
    t_year int,
    t_month int,
    t_day int,
    t_time time,
    t_amount varchar(20),
    t_use_chip varchar(20),
    t_merchant_name int,
    t_merchant_city varchar(30),
    t_merchant_state varchar(40),
    t_zip_code varchar(10),
    t_mcc int,
    t_errors varchar(25),
    t_is_fraud varchar(3)
);

-- re-cluster: add cluster key after data load
alter table transactions_v5 cluster by (date_from_parts(t_month, t_year, t_day));

-- check transactions table
select * from transactions_v5;
-- alter table transactions_v5 drop clustering key

-- view table metadata
show tables like 'trans%';