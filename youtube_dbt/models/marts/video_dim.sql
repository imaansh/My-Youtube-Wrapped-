with source as 
(select * from {{ ref('watch_history_stg') }})


select
video_id as video_id,
ltrim(substring(video_title, instr(video_title, 'Watched') + length('Watched'))) as video_title

from source 
where video_id is not null 