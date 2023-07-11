-- Creates ETL specific snowflake entities
-- warehouse, database, schema, user, and role
set etl_role = 'ETL_ROLE';
set etl_username = 'ETL_USER';
set etl_warehouse = 'ETL_WAREHOUSE';
set etl_database = 'CardsDB';
set etl_schema = 'ETL_SCHEMA';

-- set user password 
set etl_password = 'SET_PASSWORD';

begin;

use role securityadmin;

-- create etl role
create role if not exists identifier($etl_role);
grant role identifier($etl_role) to role sysadmin;

-- create etl user
create user if not exists identifier($etl_username)
password = $etl_password
default_role = $etl_role
default_warehouse = $etl_warehouse;

grant role identifier($etl_role) to user identifier($etl_username);

-- change role to sysadmin for warehouse / database steps
use role sysadmin;

-- create etl warehouse
create warehouse if not exists identifier($etl_warehouse)
warehouse_size = medium
warehouse_type = standard
max_cluster_count = 4
min_cluster_count = 1
auto_suspend = 180
auto_resume = true
initially_suspended = true;

-- create etl database
create database if not exists identifier($etl_database);

-- grant etl warehouse access
grant USAGE
on warehouse identifier($etl_warehouse)
to role identifier($etl_role);

-- grant etl database access
grant ownership
on database identifier($etl_database)
to role identifier($etl_role);

commit;

begin;

use database identifier($etl_database);

-- create schema for etl data 
CREATE SCHEMA IF NOT EXISTS identifier($etl_schema);

commit;

begin;

-- grant etl schema access
grant ownership
on schema identifier($etl_schema)
to role identifier($etl_role);

commit;
