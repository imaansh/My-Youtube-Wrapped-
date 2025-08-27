SELECT 
row_number() over () as watch_id,
video_id as video_id, 
coalesce(channel_id,'UNKNOWN') as channel_id,
title as video_title, 
channel_name as channel_name,
watched_at as datetime_, 
date as date_

FROM {{ source('youtube', 'watch_history') }}
WHERE video_id is not null
