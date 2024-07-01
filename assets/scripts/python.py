
import os
import pandas as pd
import time
from dotenv import load_dotenv
from googleapiclient.discovery import build

# Load API key from environment
load_dotenv()
API_KEY = os.getenv("YOUTUBE_API_KEY")
API_VERSION = 'v3'

# Initialize YouTube API client
youtube = build('youtube', API_VERSION, developerKey=API_KEY)


def get_channel_stats(youtube, channel_id):
    try:
        request = youtube.channels().list(
            part='snippet,statistics',
            id=channel_id
        )
        response = request.execute()

        # Check if 'items' exists in response
        if 'items' in response and response['items']:
            data = {
                'channel_name': response['items'][0]['snippet']['title'],
                'total_subscribers': response['items'][0]['statistics']['subscriberCount'],
                'total_views': response['items'][0]['statistics']['viewCount'],
                'total_videos': response['items'][0]['statistics']['videoCount'],
            }
            return data
        else:
            print(f"No data found for channel ID: {channel_id}")
            return None
    except Exception as e:
        print(f"Error retrieving data for channel ID: {
              channel_id}. Error: {e}")
        return None


# Read CSV into dataframe
df = pd.read_csv(
    r"D:\Work\Excel to Power BI Youtube Analysis\dataset\youtube_data_thailand.csv")

# Extract channel IDs and remove potential duplicates
channel_ids = df['NAME'].str.split('@').str[-1].unique()

# Print the extracted channel IDs for debugging
print("Extracted Channel IDs:", channel_ids)

# Initialize a list to keep track of channel stats
channel_stats = []

# Loop over the channel IDs and get stats for each
for channel_id in channel_ids:
    stats = get_channel_stats(youtube, channel_id)
    if stats is not None:
        channel_stats.append(stats)
    # Add a delay to avoid hitting rate limits
    time.sleep(0.1)  # Adjust the delay as needed

# Convert the list of stats to a DataFrame
stats_df = pd.DataFrame(channel_stats)

# Reset indexes of both dataframes
df.reset_index(drop=True, inplace=True)
stats_df.reset_index(drop=True, inplace=True)

# Concatenate the dataframes horizontally
combined_df = pd.concat([df, stats_df], axis=1)

# Save the merged dataframe back into a CSV file
combined_df.to_csv(
    r'D:\Work\Excel to Power BI Youtube Analysis\dataset\youtube_data_thailand.csv', index=False)

# Display the first 10 rows of the combined dataframe
print(combined_df.head(10))
