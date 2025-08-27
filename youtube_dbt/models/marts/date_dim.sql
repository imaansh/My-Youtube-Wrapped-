with source as (
select cast(date_ as date) as date_ from {{ ref('watch_history_stg') }}

)


Select 
distinct 
date_ as date_,
extract(year from date_) as year_,
extract(month from date_) as month_,
extract(dayofweek from date_) as day_of_week,
case when day_of_week in (1,7) then true else false end as is_weekend

from source
where date_ is not null 
 

