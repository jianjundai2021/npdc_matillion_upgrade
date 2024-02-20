-- This script is to clone the snowflake DEV_DWH database to DEV_DWH_CLONE in order to support testing of the migrated Matillion environment.
-- The script clones the database and grant usage privilege of DEV_DWH_CLONE to role DEV_ROLE_ELT, which is the role Matillion uses to access to database.
-- It also verifies by using the DEV_ROLE_ELT, it can munipulate the cloned database tables.
-- -------------------------------------------
-- Revision History
-- 29-Jan-2024            Jianjun Dai          Initial creation
-- -------------------------------------------

show roles;
use role DEV_ROLE_ELT;

use role accountadmin; -- as dev_role_etl is having insufficient privilege to clone database
show roles;
CREATE DATABASE dev_dwh_clone CLONE dev_dwh;
-- 56 minutes


use role accountadmin;
use database dev_dwh_clone;
grant usage on database dev_dwh_clone to dev_role_elt;

use role dev_role_elt;
show databases;
use database DEV_DWH_CLONE;
show schemas;
use schema presentation;
show tables;

/*
Verify dev_role_elt is able to DML on presentation schema tables

select count(*) from beakon_actions;
select * from beakon_actions where id = 'xyz';
insert into beakon_actions (id) values ('xyz');
select count(*) from beakon_actions;
delete from beakon_actions where id = 'xyz';

End of verification
*/
