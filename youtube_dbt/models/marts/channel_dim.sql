with source as 
(select * from {{ ref('watch_history_stg') }})


select
coalesce(channel_id,'UNKNOWN') as channel_id,
coalesce(channel_name,'UNKNOWN') as channel_name

from source 
where channel_id is not null 