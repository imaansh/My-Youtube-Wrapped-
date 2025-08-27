with video_source as (
SELECT 
year_,
wh.video_id, 
video_title,
count(wh.video_id) as no_of_times_watched

from watch_history_fct as wh 
left join video_dim as vd 
on wh.video_id = vd.video_id
left join date_dim as dt 
on wh.date_ = dt.date_
where wh.date_ is not null 
group by 1,2,3
),

top_videos as (
SELECT     
year_,
video_id, 
video_title,
no_of_times_watched,
row_number() over (partition by year_ order by no_of_times_watched desc) as rank

from video_source
) 

SELECT 
year_, 
video_title,
video_id,
no_of_times_watched,
rank 

from top_videos
where rank <=5 
group by 1,2,3,4,5



