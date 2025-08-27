with source as
(
    select * from {{ref('watch_history_stg')}}
)


select 
watch_id,
video_id as video_id, 
channel_id as channel_id,
extract(hour from cast(datetime_ as timestamp)) as watch_hour,
cast(date_ as date) as date_ 

from source 
where video_id is not null 
and date_  is not null 