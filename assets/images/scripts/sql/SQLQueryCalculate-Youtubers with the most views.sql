/*

# 1. Define variables
# 2. Create a CTE that rounds the average views per video
# 3. Select the columns you need and create calculated columns from existing ones
# 4. Filter results by YouTube channels
# 5. Sort results by net profits (from highest to lowest)

*/


--1.

DECLARE @conversionRate FLOAT = 0.002;			-- The conversion rat @0.2%
DECLARE @productCost MONEY = 500.0;				-- The product cost @ 500฿
DECLARE @campaignCost MONEY = 130000.0;			-- The campaign cost @ 130,000฿


--2.

WITH ChannelData AS (
    SELECT
        channel_name,
        total_views,
        total_videos,
        ROUND(CAST(total_views AS FLOAT) / total_videos, -4) AS avg_views_per_video
    FROM
        youtube_db.dbo.view_th_youtubers_2024
)


SELECT
    channel_name,
    avg_views_per_video,
    (avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
    (avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
    (avg_views_per_video * @conversionRate * @productCost) - @campaignCost AS net_profit
FROM
    ChannelData

--4.
WHERE
	channel_name IN ('WorkpointOfficial', 'ช่อง one31', 'GMM GRAMMY OFFICIAL')


--5.
ORDER BY
	net_profit DESC