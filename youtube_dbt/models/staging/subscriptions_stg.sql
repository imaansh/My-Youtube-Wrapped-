SELECT 
"Channel Id" as channel_id, 
"Channel Title" as subscribed_channel


from {{ source('youtube','subscriptions') }}
where channel_id is not null 