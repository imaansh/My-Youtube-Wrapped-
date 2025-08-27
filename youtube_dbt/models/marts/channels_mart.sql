with channel_source as (
SELECT 
year_,
wh.channel_id, 
channel_name,
count(wh.channel_id) as no_of_times_watched_channel

from watch_history_fct as wh 
left join channel_dim as cd 
on wh.channel_id = cd.channel_id
left join date_dim as dt 
on wh.date_ = dt.date_
where wh.date_ is not null 
group by 1,2,3
),

top_channels as(
SELECT 
year_,
channel_id, 
channel_name,
no_of_times_watched_channel,
row_number() over (partition by year_ order by no_of_times_watched_channel desc) as rank

from channel_source
)


SELECT 
year_, 
channel_name,
channel_id,
no_of_times_watched_channel,
rank

from top_channels
where rank <= 5
group by 1,2,3,4,5





