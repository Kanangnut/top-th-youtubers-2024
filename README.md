# Data Portfolio: Top TH YouTubers 2024<br>
Excel to Power BI and Tubleau 📊💭

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/assets/130201193/21e819d6-409f-4371-9174-ec09cca11a40)

# Table of Contents
- [Objective](#objective)
- [Data Source](#data-source)
- [Stages](#stages)
- [Design](#design)


# Objective
<br>
• Key Pain Point:<br>
The Head of Marketing needs to find the most important TH YouTubers in 2024 to plan and run marketing campaigns for the rest of the year. Without this information, the company might choose less effective influencers. This could make the campaigns less successful and waste marketing resources.<br><br>

• Ideal Solution:<br>
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
  - Engagement rates (likes, comments, shares)
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

- Who the top UK YouTubers are.
- How many subscribers they have.
- How many views they get.
- How many videos they make.

![alt text](https://github.com/Kanangnut/top-th-youtubers-2024/blob/main/assets/images/dashboard_mockup_figma.JPG)

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

## Data transform

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

