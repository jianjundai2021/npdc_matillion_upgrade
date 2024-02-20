use role dev_role_elt;

show grants to role dev_role_elt;

select * from table(result_scan(last_query_id()));

use database dev_dwh_clone;
SELECT * FROM INFORMATION_SCHEMA.ROLE_PRIVILEGES 
WHERE ROLE_NAME = 'DEV_ROLE_ELT';

CREATE OR REPLACE TABLE "DEV_DWH_CLONE"."LANDING"."LIBRARY_EXT_PEOPLECOUNTER" (
	"DATA_VALUE" VARIANT
)
;

select * from information_schema.tables where table_name = 'LIBRARY_EXT_PEOPLECOUNTER';

use database dev_dwh;
select *  from information_schema.tables where table_owner = 'ACCOUNTADMIN';




select count(*) from "DEV_DWH_CLONE"."LANDING"."LIBRARY_EXT_PEOPLECOUNTER";


use role accountadmin;
use database dev_dwh_clone;
create table landing.tst01 (col1 number);
use role dev_role_elt;
create or replace table landing.tst01 (col1 number, col2 number);



   Select DISTINCT
      DATEADD(DAY,2,MAX(to_timestamp(to_char(datekey),'YYYYMMDD'))) AS LOADDATE
   FROM dev_dwh_clone.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY;

select datekey, count(*)
from dev_dwh_clone.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY
group by 1
order by 1 desc 
;

use role accountadmin;
update dev_dwh.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY set datekey = 20240115 where datekey = 20230720;

select * from datastore.STG_MATILLION_JOB_HISTORY_SUMMARY;

drop table tst01;


use role dev_role_elt;
DEV_DWH.DATASTORE."CALCULATE_SENTIMENT(VARCHAR)";


select GET_DDL('FUNCTION', 'DEV_DWH.DATASTORE.CALCULATE_SENTIMENT(VARCHAR)');
;

drop function DEV_DWH_CLONE.DATASTORE."CALCULATE_SENTIMENT"(VARCHAR());

use role dev_role_elt;
CREATE OR REPLACE FUNCTION DEV_DWH_CLONE.DATASTORE."CALCULATE_SENTIMENT"("STR" VARCHAR(16777216))
RETURNS ARRAY 
LANGUAGE PYTHON RUNTIME_VERSION = '3.8' HANDLER = 'func'
IMPORTS = ('@DEV_DWH.LANDING.SENTIMENT_ANALYSIS_STAGE/vaderSentiment.py',
'@DEV_DWH.LANDING.SENTIMENT_ANALYSIS_STAGE/vader_lexicon.txt',
'@DEV_DWH.LANDING.SENTIMENT_ANALYSIS_STAGE/emoji_utf8_lexicon.txt')
AS
' 
import sys 
from vaderSentiment import SentimentIntensityAnalyzer 
# get Snowflake location of imported files
IMPORT_DIRECTORY_NAME = "snowflake_import_directory"
import_dir = sys._xoptions[IMPORT_DIRECTORY_NAME]
# add import location to sys path 
sys.path.append(import_dir) 
analyzer = SentimentIntensityAnalyzer() 
def func(text):    
  vs = analyzer.polarity_scores(text)
  compound_score = vs[''compound'']    
  positive_score = vs[''pos'']    
  neutral_score = vs[''neu'']    
  negative_score = vs[''neg'']        
  return [str(negative_score),str(neutral_score),str(positive_score),str(compound_score)]     
'
;

desc function dev_dwh.datastore.calculate_sentiment(varchar());

desc stage DEV_DWH.DATASTORE.SENTIMENT_ANALYSIS_STAGE;
list @DEV_DWH.DATASTORE.SENTIMENT_ANALYSIS_STAGE;






use role accountadmin;
use database dev_dwh_clone;
alter database dev_dwh_clone rename to dev_dwh_clone_tobedelete;



use role dev_role_elt;
select "infringement_date"
FROM dev_dwh.STAGING.PARKING_FACT_PARKING_INFRINGEMENTS;

desc table dev_dwh.STAGING.PARKING_FACT_PARKING_INFRINGEMENTS;
desc table dev_dwh_clone_tobedelete.STAGING.PARKING_FACT_PARKING_INFRINGEMENTS;


   Select DISTINCT
           -- MAX(to_timestamp(to_char("infringement_date"),'DD/MM/YYYY')) AS LOADDATE
           to_char(MAX("infringement_date"),'DD/MM/YYYY') AS LOADDATE
   FROM dev_dwh.STAGING.PARKING_FACT_PARKING_INFRINGEMENTS


;

use database dev_dwh;

select count(*) from dev_dwh.presentation.nimblex_payment_claims ;

select count(*) from dev_dwh.presentation.nimblex_payment_claims AT(OFFSET => -60*3);


select * from information_schema.tables
where table_schema = 'PRESENTATION'
and table_name like 'NIMBLEX_PAY%'
;
;

use schema presentation;
create table nimblex_payment_claims_202402021133 as select * from dev_dwh.presentation.nimblex_payment_claims;
select count(*) from dev_dwh.presentation.nimblex_payment_claims_202402021133 at (OFFSET => -60*1) ;
delete from dev_dwh.presentation.nimblex_payment_claims_202402021133;

drop  table dev_dwh.presentation.nimblex_payment_claims_202402021133;


SHOW PARAMETERS like '%DATA_RETENTION_TIME_IN_DAYS%' in table dev_dwh.presentation.nimblex_payment_claims_202402021133;

select * from dev_dwh.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY order by datekey desc;

select * from dev_dwh_clone_tobedelete.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY order by datekey desc;

select * from dev_dwh.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY order by datekey desc;

update dev_dwh.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY set datekey = 20240115 where datekey = 20230720;

delete from dev_dwh.DATASTORE.FACEBOOK_FACT_STATS_COUNTRY where datekey >20240115;


use role accountadmin;



select table_catalog, count(*)
from dev_dwh.information_schema.tables
group by 1 
order by 1;

with dev_dwh_tbls as (
select table_catalog, table_schema, table_name
from dev_dwh.information_schema.tables
where table_schema = 'DATASTORE'
)
, tst_dwh_tbls as (
select table_catalog, table_schema, table_name
from tst_dwh.information_schema.tables
where table_schema = 'DATASTORE'
)
, prd_dwh_tbls as (
select table_catalog, table_schema, table_name
from prd_dwh.information_schema.tables
where table_schema = 'DATASTORE'
)
, output as (
select table_schema, table_name 
from prd_dwh_tbls 
minus 
select table_schema, table_name 
from tst_dwh_tbls 
)
select * 
from output 
order by 1, 2 