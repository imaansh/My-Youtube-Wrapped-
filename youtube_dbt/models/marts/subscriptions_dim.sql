with source as 

(select * from {{ ref('subscriptions_stg') }})


select 
channel_id as channel_id, 
subscribed_channel as subscribed_channel 

from source
where channel_id is not null 