/*

1. Define the variables
2. Creat a CTEthat rounds the average views per video
3. Select the columns that are required fro the analysis
4. Filter the results by the YouTube channels with the highest subscriber bases
5. Order by net_profit (from highest to lowest0


*/


--1.

DECLARE @conversionRate FLOAT = 0.002; -- The conversion rat @0.2%
DECLARE @productCost MONEY = 500.0; -- The product cost @ 500฿
DECLARE @campaignCost MONEY = 50000.0; -- The campaign cost @ 50,000฿


--2.

WITH ChannelData AS (
	SELECT
		channel_name,
		total_views,
		total_videos,
		ROUND((CAST(total_views as FLOAT) / total_videos), -4) as rounded_avg_views_per_video
	FROM 
		youtube_db.dbo.view_th_youtubers_2024

)


--3.
Avg Views per Vid (SQL)
SELECT *
FROM ChannelData
WHERE channel_name IN ('WorkpointOfficial', 'ช่อง one31', 'Ch3Thailand')


SELECT
	channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) AS poitential_units_sold_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost AS net_profit

FROM
	ChannelData


--4.
WHERE
	channel_name IN ('WorkpointOfficial', 'ช่อง one31', 'Ch3Thailand')


--5.
ORDER BY
	net_profit DESC