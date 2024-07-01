/*

# Data cleaning steps
1. Remove unnecessary columns by only selecting the ones we need
2. Extract the Youtube channel name from the first columns
3. Rename the columns name

*/

SELECT * FROM Top_TH_youtubers_2024

SELECT
	NAME,
	total_subscribers,
	total_views,
	total_videos
FROM
	top_th_youtubers_2024

SELECT *
FROM
	top_th_youtubers_2024


--CHARTINDEX
SELECT CHARINDEX('@', NAME), NAME FROM Top_TH_youtubers_2024


--SUBSTRING
SELECT SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) FROM top_th_youtubers_2024
SELECT CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) AS VARCHAR(100)) as channel_name FROM top_th_youtubers_2024


CREATE VIEW view_th_youtubers_2024 AS

SELECT
	CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) AS VARCHAR(100)) as channel_name,
	total_subscribers,
	total_views,
	total_videos

FROM
	top_th_youtubers_2024