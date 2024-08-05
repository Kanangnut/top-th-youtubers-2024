# Top Thailand YouTubers Analysis in 2024<br>
This project analyzing Top Thailand YouTubers in 2024: focusing on subscribers, views, engagement, cost-effectiveness. This project also applicable to TikTok, Instagram and platforms with API integration.📊💭 Read full article [here](https://kanangnut.github.io/top-th-youtubers-2024/). <br> 

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Architecture%20diagram.JPG?raw=true)

# Index
- [Objective](#objective)
- [Data Source](#data-source)
- [Stages](#stages)
- [Design](#design)
  - [Dashboard mockup](#dashboard-mockup)
  - [Tools](#tools)
- [Development](#development)
  - [Data Exploration](#data-exploration)
  - [Data Cleaning](#data-cleaning)
  - [Data transformation](#data-transformation)
  - [Ceate SQL view](#ceate-sql-view)
- [Data Quality Tests](#data-quality-tests)
  - [Data type check](#data-type-check)
  - [Duplicate count check](#duplicate-count-check)
- [Visualization](#visualization)
  - [Dashboard by Power BI and Tableau](#dashboard-by-power-bi-and-tableau)
  - [DAX Measures](#dax-measures)
- [Analysis](#analysis)
  - [Findings](#findings)
  - [Validation](#validation)
  - [Discovery](#discovery)
- [Recommendations](#recommendations)
  - [Potential ROI](#potential-roi)
  - [Action plan](#action-plan)
  
# Objective

• Key Pain Point:<br><br>
The Head of Marketing needs to find the most important TH YouTubers in 2024 to plan and run marketing campaigns for the rest of the year. Without this information, the company might choose less effective influencers. This could make the campaigns less successful and waste marketing resources.<br><br>

• Ideal Solution:<br><br>
Create a simple dashboard that shows the top TH YouTubers of 2024. The dashboard should include:<br>

- Subscriber count: To see how popular the YouTuber is.
- Total views: To know how many people watch the YouTuber.
- Total videos: To check how often the YouTuber makes videos.
- Engagement metrics: To see how many likes, comments, and shares the YouTuber gets.
- Content categories: To match the YouTuber’s content with the brand's target audience.
- Audience demographics: To check if the YouTuber's audience is the same as the company’s target market.
- Growth trends: To find new and popular YouTubers.
- Collaboration history: To see if the YouTuber has worked with other brands before.

### This solution will help the marketing team to:
- Make smart choices when picking YouTubers to work with.<br>
- Use the budget well by choosing the best influencers.<br>
- Track how well the partnerships are doing.<br>
- Find new trends in the TH YouTube scene to stay ahead of competitors.<br><br>

With this dashboard, the marketing team can improve their influencer marketing strategy. This will lead to better brand awareness, more engagement, and better results for marketing campaigns.

## User Story
As the Head of Marketing, I need a dashboard that analyzes YouTube channel data in the TH market. This tool should help me:

- Find top channels based on:
  - Subscriber count
  - Average views per video
  - Engagement rates (For this project just use basic idea How engaged the subscribers are? the engaged the subscribers are you know to each videos on average?So the metrics like the ones we scorecards are not going to be enough to make decisions in the real world.)
  - Content consistency and frequency
- Compare multiple channels side-by-side to see how they perform and who their audience is.
- Track channel growth over time to find rising influencers and new trends.
- Create detailed reports on selected channels, including their content types, audience details, and brand collaboration history.
- Get alerts for channels that meet certain criteria or show significant growth.

By using this dashboard, I want to:

- Make data-based decisions when choosing YouTubers for brand collaborations.
- Use our marketing budget wisely by working with channels that best match our target audience.
- Improve the effectiveness and return on investment (ROI) of our influencer marketing campaigns.
- Stay ahead of market trends by finding new content creators and niche markets.
- This tool will help our marketing team create better, more efficient, and successful YouTube-based marketing strategies in the TH market.


# Data Source

What data is needed to achieve our objective?

'Top 100 Social Media Influencers 2024 Countrywise'<br>
Where is the data coming from? The data is sourced from Kaggle (an Excel extract), [here is the resource](https://www.kaggle.com/datasets/bhavyadhingra00020/top-100-social-media-influencers-2024-countrywise?resource=download)

And we need data on the top TH YouTubers in 2024 that includes:

- channel names
- total subscribers
- total views
- total videos uploaded

So we write the python script to get the data from our data source.


# Stages

- Gathering requirements
- Project planing
- Design
- Coding and Implementation
- Testing
- Analysis


# Design

## Dashboard Components Required

- What should the dashboard design based on the requirements?

To determine the components that should be included in the dashboard, we need to identify the key questions that the dashboard must answer:

  1. Who are the top 10 YouTubers with the most subscribers?
  2. Which 3rd channels have uploaded the most videos?
  3. Which 3rd channels have the most views?
  4. Which 3rd channels have the highest average views per video?
  5. Which 3rd channels have the highest views per subscriber ratio?
  6. Which 3rd channels have the highest subscriber engagement rate per video uploaded?

These questions will guide the initial design of the dashboard. As our analysis progresses, additional questions and components may be identified and included.

## Dashboard mockup

Some of the data visuals that may be appropriate in answering our questions include:

  1. Table
  2. Scorecards
  3. Treemap
  4. Horizontal bar chart

These charts will help us show:

- Who the top TH YouTubers are.
- How many subscribers they have.
- How many views they get.
- How many videos they make.

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/dashboard_mockup_figma.JPG?raw=true)

## Tools

| Tool | Purpose |
| ------------- | ------------- |
| Excel | Exploring the data |
| SQL Server  | Cleaning, testing, and analyzing the data |
| Power BI and Tableau | Visualizing the data via interactive dashboards |
| Figma | Designing the wireframe/mockup of the dashboard |
| GitHub | Hosting the project documentation and version control |

# Development

## Pseudocode

What's the general approach in creating this solution from start to finish?

- Get the data
- Explore the data
- Load the data into SQL Server
- Clean the data with SQL
- Test the data with SQL
- Visualize the data in Power BI
- Generate the findings based on the insights
- Write the documentation + commentary
- Publish the data to GitHub

## Data exploration

This is the stage where we examine the data for errors, inconsistencies, bugs, and unusual or corrupted characters.
Initial Observations:

- There are at least four columns that contain the data needed for this analysis. This suggests we have all the necessary information from the file without needing to contact the client for additional data.
- The first column contains channel IDs, separated by the @ symbol. We need to extract the channel names from this column.
- Some cells and header names are in a different language. We need to confirm if these columns are necessary and address them accordingly.
- There is more data than we need, so some columns will need to be removed.

## Data cleaning

What do we expect the clean data to look like?

We aim to improve our dataset so it is well-organized and ready for analysis. The cleaned data should meet the following criteria:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.

Below is a table outline that constraints on our cleaned dataset:

| Property | Description |
| ------------- | ------------- |
| Number of Rows | 100 |
| Number of Columns | 4 |

Here is a tabular representation of the expected schema for the clean data:

| Column Name | Data Type | Null |
| ------------- | ------------- | ------------- |
| channel_name | VARCHAR | NO |
| total_subscribers | INTEGER | NO |
| total_views | INTEGER | NO |
| total_videos | INTEGER | NO |

What steps are needed to clean and shape the data into the desired format?
  1. Inspecting the raw data to understand its structure, format, and quality. Identify missing values, outliers, and inconsistencies
  2. Remove unnecessary columns by only selecting the ones you need
  3. Extract Youtube channel names from the first column
  4. Rename columns using aliases


## Data transformation

```
/*
# 1. Select the required columns
# 2. Extract the channel name from the 'NAME' column
*/

-- 1. and -- 2.
SELECT
	CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) AS VARCHAR(100)) as channel_name,
	total_subscribers,
	total_views,
	total_videos

FROM
	top_th_youtubers_2024
```


## Ceate SQL view

```
/*
# 1. Create a view to store the transformed data
# 2. Cast the extracted channel name as VARCHAR(100)
# 3. Select the required columns from the top_th_youtubers_2024 SQL table 
*/

-- 1.
CREATE VIEW view_th_youtubers_2024 AS

-- 2.
SELECT
    CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) AS VARCHAR(100)) AS channel_name,
    total_subscribers,
    total_views,
    total_videos

-- 3.
FROM
    top_th_youtubers_2024
```


# Data Quality Tests

- What data quality and validation checks are you going to create?

Here are the data quality tests conducted:

## Row count check

```
/*
# Count the total number of records (or rows) are in the SQL view
*/

SELECT COUNT(*) AS no_of_rows
FROM view_th_youtubers_2024;

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Testing%20Row%20count%20check.JPG?raw=true)

## Column count check

```
/*
# Count the total number of columns (or fields) are in the SQL view
*/


SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_th_youtubers_2024'

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Testing%20Column%20count%20check.JPG?raw=true)

# Data Quality Tests

## Data type check

```
/*
# Check the data types of each column from the view by checking the INFORMATION SCHEMA view
*/

-- 1.
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_th_youtubers_2024';

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Data%20type%20check.JPG?raw=true)


## Duplicate count check

```
/*
# 1. Check for duplicate rows in the view
# 2. Group by the channel name
# 3. Filter for groups with more than one row
*/

-- 1.
SELECT channel_name,
    COUNT(*) AS duplicate_count
FROM view_th_youtubers_2024

-- 2.
GROUP BY channel_name

-- 3.
HAVING COUNT(*) > 1;

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Data%20type%20check.JPG?raw=true)

# Visualization

## Dashboard by Power BI and Tableau

This shows the Top TH Youtubers in 2024 so far.

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/dashboard_powerbi.JPG?raw=true)


## DAX Measures

### 1. Total Subscribers (M)
```
Total Subscribers (M) = 
VAR million = 1000000
VAR sumOfSubscribers = SUM(view_th_youtubers_2024[total_subscribers])
VAR totalSubscribers = DIVIDE(sumOfSubscribers, million)

RETURN totalSubscribers

```

### 2. Total Views (B)
```
Total Views (B) = 
VAR billion = 1000000000
VAR sumOfTotalViews = SUM(view_th_youtubers_2024[total_views])
VAR totalViews = ROUND(sumOfTotalViews / billion, 2)

RETURN totalViews

```

### 3. Total Videos
```
Total Videos = 
VAR totalVideos = SUM(view_th_youtubers_2024[total_videos])

RETURN totalVideos

```

### 4. Average Views Per Video (M)
```
Average Views per Video (M) = 
VAR sumOfTotalViews = SUM(view_th_youtubers_2024[total_views])
VAR sumOfTotalVideos = SUM(view_th_youtubers_2024[total_videos])
VAR  avgViewsPerVideo = DIVIDE(sumOfTotalViews, sumOfTotalVideos, BLANK())
VAR finalAvgViewsPerVideo = DIVIDE(avgViewsPerVideo, 1000000, BLANK())

RETURN finalAvgViewsPerVideo 

```

### 5. Subscriber Engagement Rate
```
Subscriber Engagement Rate = 
VAR sumOfTotalSubscribers = SUM(view_th_youtubers_2024[total_subscribers])
VAR sumOfTotalVideos = SUM(view_th_youtubers_2024[total_videos])
VAR subscriberEngRate = DIVIDE(sumOfTotalSubscribers, sumOfTotalVideos, BLANK())

RETURN subscriberEngRate 

```

### 6. Views per subscriber
```
Views Per Subscriber = 
VAR sumOfTotalViews = SUM(view_th_youtubers_2024[total_views])
VAR sumOfTotalSubscribers = SUM(view_th_youtubers_2024[total_subscribers])
VAR viewsPerSubscriber = DIVIDE(sumOfTotalViews, sumOfTotalSubscribers, BLANK())

RETURN viewsPerSubscriber 

```


# Analysis

## Findings

For this analysis, we will focus on the questions below to gather information for our marketing client:

###   1. Who are the top 10 YouTubers with the most subscribers?

| Channel Name | Total Subscriber (M) |
| ------------- | ------------- |
| WorkpointOfficial | 41.1 |
| ช่อง one31 | 40.5 |
| Ch3Thailand | 35.0 |
| GMM GRAMMY OFFICIAL | 24.1 |
| GRAMMY GOLD OFFICIAL | 19.8 |
| THAIRATH TV Originals | 18.0 |
| GMMTV OFFICIAL | 17.8 |
| Ch7HD | 17.6 |
| Genierock | 16.0 |
| GMM25Thailand | 15.3 |

###   2. Which 3rd channels have uploaded the most videos?

| Channel Name | Total Videos Uploaded |
| ------------- | ------------- |
| Thairath Online | 282,912 |
| ช่อง one31 | 145,747 |
| เรื่องเล่าเช้านี้ | 131,490 |

###  3. Which 3rd channels have the most views?

| Channel Name | Total Views (B) |
| ------------- | ------------- |
| WorkpointOfficial | 38.6 |
| ช่อง one31 | 28.5 |
| Ch3Thailand | 27.2 |

###   4. Which 3rd channels have the highest average views per video?

| Channel Name | Averge Views per Video (M) |
| ------------- | ------------- |
| Mr.Tfue | 89.0 |
| Illslick thelegandary | 40.0 |
| YOUNGOHM | 27.0 |

###   5. Which 3rd channels have the highest views per subscriber ratio?

| Channel Name | Views per Subscriber |
| ------------- | ------------- |
| Beam Copphone | 1632.0 |
| VOICE TV | 1202.0 |
| YimYam TV | 1167.0 |

###   6. Which 3rd channels have the highest subscriber engagement rate per video uploaded?

| Channel Name | Subscriber Engagement Rate (M) |
| ------------- | ------------- |
| Mr.Tfue | 0.41 |
| Wannabe Mee | 0.07 |
| Illslick thelegandary | 0.06 |

### Notes

For this analysis, we will prioritize the metrics that are crucial in generating the expected ROI for our marketing client. Specifically, we will focus on YouTube channels with the most:

- Subscribers
- Total views
- Videos uploaded


# Validation

### 1. Youtubers with the most subscribers
#### Calculation breakdown
Campaign idea = product placement

a. WorkpointOfficial
 - Average views per video = 450,000
 - Product cost = ฿500
 - Potential units sold per video = 450,000 x 0.2% conversion rate = 900 units sold
 - Potential revenue per video = 900 x ฿500 = ฿450,000
 - Campaign cost (one-time fee) = ฿50,000
 - Net profit = ฿450,000 - ฿50,000 = ฿400,000

b. ช่อง one31
 - Average views per video = 200,000
 - Product cost = ฿500
 - Potential units sold per video = 200,000 x 0.2% conversion rate = 400 units sold
 - Potential revenue per video = 400 x ฿500 = ฿200,000
 - Campaign cost (one-time fee) = ฿50,000
 - Net profit = ฿200,000 - ฿50,000 = ฿150,000

c. Ch3Thailand
 - Average views per video = 290,000
 - Product cost = ฿500
 - Potential units sold per video = 290,000 x 0.2% conversion rate = 580 units sold
 - Potential revenue per video = 580 x ฿500 = ฿290,000
 - Campaign cost (one-time fee) = ฿50,000
 - Net profit = ฿290,000 - ฿50,000 = ฿240,000

Best option from category: WorkpointOfficial

#### SQL Query

```
/* 

# 1. Define variables 
# 2. Create a CTE that rounds the average views per video 
# 3. Select the column you need and create calculated columns from existing ones 
# 4. Filter results by Youtube channels
# 5. Sort results by net profits (from highest to lowest)

*/


-- 1. 
DECLARE @conversionRate FLOAT = 0.002;		-- The conversion rate @ 0.2%  -- Mega/VIP >1 million followers, CVR = 0.2%. Cr.Aggero
DECLARE @productCost FLOAT = 500;		-- The product cost @ ฿500
DECLARE @campaignCost FLOAT = 50000.0;		-- The campaign cost @ ฿50,000	


-- 2.  
WITH ChannelData AS (
    SELECT 
        channel_name,
        total_views,
        total_videos,
        ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
    FROM 
        youtube_db.dbo.view_th_youtubers_2024
)

-- 3. 
SELECT 
    channel_name,
    rounded_avg_views_per_video,
    (rounded_avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
    (rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
    ((rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost) AS net_profit
FROM 
    ChannelData


-- 4. 
WHERE 
    channel_name in ('WorkpointOfficial', 'ช่อง one31', 'Ch3Thailand')    


-- 5.  
ORDER BY
	net_profit DESC

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Youtubers%20with%20the%20most%20subscribersSQL.JPG?raw=true)


### 2. Youtubers with the most videos uploaded

#### Calculation breakdown

Campaign idea = sponsored video series

a. Thairath Online <br>
Average views per video = 60,000 <br>
Product cost =  ฿500 <br>
Potential units sold per video = 60,000 x 0.2% conversion rate = 120 units sold <br>
Potential revenue per video = 120 x ฿500 = ฿60,000 <br>
Campaign cost (11-videos @ ฿5,000 each) = ฿55,000 <br>
Net profit = ฿60,000 - ฿55,000 = ฿5,000 <br><br>

b. ช่อง one31 <br>
Average views per video = 200,000 <br>
Product cost =  ฿500 <br>
Potential units sold per video = 200,000 x 0.2% conversion rate = 400 units sold <br>
Potential revenue per video = 400 x ฿500 = ฿200,000 <br>
Campaign cost (11-videos @ ฿5,000 each) = ฿55,000 <br>
Net profit = ฿200,000 - ฿55,000 = ฿145,000 <br><br>

c. เรื่องเล่าเช้านี้ <br>
Average views per video = 60,000 <br>
Product cost =  ฿500 <br>
Potential units sold per video = 60,000 x 0.2% conversion rate = 120 units sold <br>
Potential revenue per video = 120 x ฿500 = ฿60,000 <br>
Campaign cost (11-videos @ ฿5,000 each) = ฿55,000 <br>
Net profit = ฿60,000 - ฿55,000 = ฿5,000 <br>

Best option from category: ช่อง one31


#### SQL Query
```
/*

# 1. Define variables
# 2. Create a CTE that rounds the average views per video
# 3. Select the columns you need and create calculated columns from existing ones
# 4. Filter results by YouTube channels
# 5. Sort results by net profits (from highest to lowest)

*/


--1.

DECLARE @conversionRate FLOAT = 0.002;			-- The conversion rat @0.2%
DECLARE @productCost MONEY = 500.0;				-- The product cost @ ฿500
DECLARE @campaignCostPerVideo FLOAT = 5000.0;   -- The campaign cost per video @ ฿5,000
DECLARE @numberOfVideos INT = 11;               -- The number of videos (11)


--2.

WITH ChannelData AS (
    SELECT
        channel_name,
        total_views,
        total_videos,
        ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
    FROM
        youtube_db.dbo.view_th_youtubers_2024
)


SELECT
    channel_name,
    rounded_avg_views_per_video,
    (rounded_avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
    (rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
    ((rounded_avg_views_per_video * @conversionRate * @productCost) - (@campaignCostPerVideo * @numberOfVideos)) AS net_profit
FROM
    ChannelData

--4.
WHERE
	channel_name IN ('Thairath Online', 'ช่อง one31', 'เรื่องเล่าเช้านี้')


--5.
ORDER BY
	net_profit DESC

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Youtubers%20with%20the%20most%20videos%20uploadedSQL.JPG?raw=true)


### 3. Youtubers with the most views

#### Calculation breakdown

Campaign idea = Influencer marketing

a. WorkpointOfficial <br>
Average views per video = 450,000 <br>
Product cost = ฿500 <br>
Potential units sold per video = 450,000 x 0.2% conversion rate = 900 units sold <br>
Potential revenue per video = 900 x ฿500 = ฿450,000 <br>
Campaign cost (3-month contract) = ฿130,000 <br>
Net profit = ฿450,000 - ฿130,000 = ฿320,000 <br><br>

b. ช่อง one31 <br>
Average views per video = 200,000 <br>
Product cost = ฿500 <br>
Potential units sold per video = 200,000 x 0.2% conversion rate = 400 units sold <br>
Potential revenue per video = 400 x ฿500 = ฿200,000 <br>
Campaign cost (3-month contract) = ฿130,000 <br>
Net profit = ฿200,000 - ฿130,000 = ฿70,000 <br><br>

c. GMM GRAMMY OFFICIAL  <br>
Average views per video = 1,580,000 <br>
Product cost = ฿500 <br>
Potential units sold per video = 1,580,000 x 0.2% conversion rate = 3,160 units sold <br>
Potential revenue per video = 3,160 x ฿500 = ฿1,580,000 <br>
Campaign cost (3-month contract) = ฿130,000 <br>
Net profit = ฿1,580,000 - ฿130,000 = ฿1,450,000 <br><br>

Best option from category: GMM GRAMMY OFFICIAL


#### SQL Query
```
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

```

Output

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/Youtubers%20with%20the%20most%20viewsSQL.JPG?raw=true)


## Discovery

- What did we learn?
  
- We discovered that:

1. WorkpointOfficial, ช่อง one31 and Ch3Thailand are the channnels with the most subscribers in the TH.
2. Thairath Online, ช่อง one31 and เรื่องเล่าเช้านี้ are the channels with the most videos uploaded.
3. WorkpointOfficial, ช่อง one31 and GMM GRAMMY OFFICIAL are the channels with the most views.
4. Entertainment channels are useful for broader reach, as the channels posting consistently on their platforms and generating the most engagement are focus on entertainment and music.


## Recommendations

- What do you recommend based on the insights gathered?

1. WorkpointOfficial is the best YouTube channel to collaborate with if we want to maximize visbility because this channel has the most YouTube subscribers in the TH.
2. Although Thairath Online, ช่อง one31 and เรื่องเล่าเช้านี้ are regular publishers on YouTube, it may be worth considering whether collaborating with them with the current budget caps are worth the effort, as the potential return on investments is significantly lower compared to the other channels.
3. GMM GRAMMY OFFICIAL is the best YouTuber to collaborate with if we're interested in maximizing reach, but collaborating with WorkpointOfficial and ช่อง one31 may be better long-term options considering the fact that they both have large subscriber bases and are averaging significantly high number of views.
4. The top 3 channels to form collaborations with are WorkpointOfficial, ช่อง one31 and GMM GRAMMY OFFICIAL based on this analysis, because they attract the most engagement on their channels consistently.


### Potential ROI

What ROI do we expect if we take this course of action?

1. Setting up a collaboration deal with WorkpointOfficial would make the client a net profit of ฿400,000 per video.
2. An influencer marketing contract with GMM GRAMMY OFFICIAL can see the client generate a net profit of ฿1,450,000.
3. If we go with a influencer marketing campaign with ช่อง one31, this could generate the client approximately ฿70,000 per video. If we advance with an product placement campaign deal instead, this would make the client a one-off net profit of ฿150,000.
4. WorkpointOfficial could profit the client ฿400,000 per video too (which is worth considering).

### Action plan

- What course of action should we take and why?

Based on our analysis, we beieve the best channel to advance a long-term partnership deal with to promote the client's products is the WorkpointOfficial channel.

We'll have conversations with the marketing client to forecast what they also expect from this collaboration. Once we observe we're hitting the expected milestones, we'll advance with potential partnerships with ช่อง one31 and GMM GRAMMY OFFICIAL channels in the future.

- What steps do we take to implement the recommended decisions effectively?

1. Reach out to the teams behind each of these channels, starting with WorkpointOfficial.
2. Negotiate contracts within the budgets allocated to each marketing campaign.
3. Kick off the campaigns and track each of their performances against the KPIs.
4. Review how the campaigns have gone, gather insights and optimize based on feedback from converted customers and each channel's audiences.

# Credits
Throughout the development of this project, I have sought inspiration from a pivotal video source: [Excel to Power BI Portfolio Project | Full End-to-End Data Project](https://www.youtube.com/watch?v=mm_sN-Elplg&t=6956s).

