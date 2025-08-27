import pandas as pd
import json 
import duckdb
from pathlib import Path


watch_history_file = Path("D:\\Projects\\Youtube_Project\\data/watch-history.json")
subscriptions_file = Path("D:\\Projects\\Youtube_Project\\data/subscriptions.csv")
db_file = Path('D:/Projects/Youtube_Project/youtube_history.duckdb')


def load_watch_history(watch_history_file: Path) -> pd.DataFrame:
    
    with open("D:\\Projects\\Youtube_Project\\data/watch-history.json", "r", encoding="utf-8") as f:
        watch_data = json.load(f)

    watch_df = pd.json_normalize(watch_data)

    return watch_df


def load_channel_subscriptions(subscriptions: Path) -> pd.DataFrame:
    subs_df = pd.read_csv(subscriptions_file)
    subs_df = subs_df[["Channel Id","Channel Title"]]
    return subs_df


def cleaning_data(df: pd.DataFrame) -> pd.DataFrame: 


    df['channel_name'] = df['subtitles'].apply(
        lambda x: x[0]['name'] if isinstance(x, list) and len(x) > 0 else None
    )

    df['watched_at'] = pd.to_datetime(df['time'], errors='coerce')

    df['date'] =  df['watched_at'].dt.strftime('%Y-%m-%d')

    df['video_id'] = df['titleUrl'].str.split("v=").str[1]

    df['channel_url'] = df['subtitles'].apply(
        lambda x: x[0].get('url') if isinstance(x, list) and len(x) > 0 else None
    )

    df['channel_id'] = df['channel_url'].str.split("channel/").str[1]

    df = df[['title','channel_name','watched_at','date','video_id','channel_id']]
    return df


def save_to_duckdb(db_file: Path, df_dict) :

    con = duckdb.connect(db_file)

    for table_name, df in df_dict.items():
        con.register("temp_df", df)
        con.execute(f"CREATE OR REPLACE TABLE {table_name} as SELECT * FROM temp_df")
        con.unregister("temp_df")
    return con


def main():
    # Load
    watch_df = load_watch_history(watch_history_file)
    subs_df = load_channel_subscriptions(subscriptions_file)

    # Transform
    watch_df = cleaning_data(watch_df)

    df_dict = {
        "watch_history": watch_df,
        "subscriptions": subs_df
    }
    # Save to DuckDB
    con = save_to_duckdb(db_file,df_dict)

    # Preview
    preview = con.execute("SELECT * FROM subscriptions LIMIT 5").fetchdf()
    print(preview)

if __name__ == "__main__":
    main()



