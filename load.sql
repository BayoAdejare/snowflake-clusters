-- Creates staging area for loading data into Snowflake
begin;

-- creates compressed csv file format
create or replace file format csv_gz_format 
    type = 'csv'
    compression = 'gzip'
    field_delimiter = ','
    skip_header = 1;

-- creates alternate compressed csv file format
create or replace file format csv_gz_format_0
    type = 'csv'
    compression = 'gzip'
    field_delimiter = ','
    skip_header = 1;

commit;

begin;

-- create a staging area
create or replace stage stg_transactions
file_format = csv_gz_format
COMMENT = 'Staging for credit card data.';

commit;

/* 
-- SnowSQL client commands: 
-- 1. staging      - PUT 
-- 2. bulk loading - COPY INTO 

PUT file://archive/credit_card_transactions-ibm_v2.csv @stg_transactions/;

copy into transactions_v1
    from @stg_transactions/sd254/credit_card_transactions-ibm_v2.csv.gz
    file_format = (format_name = 'csv_gz_format')
    on_error = 'continue'
    force = true;

*/