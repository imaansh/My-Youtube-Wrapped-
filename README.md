# 🎬 My YouTube Wrapped (with dbt + DuckDB + Tableau)

Ever wondered what your **own YouTube Wrapped** would look like if you built it yourself?  
This project takes my raw 5-year YouTube watch history and transforms it into analytics-ready models using **dbt** and **DuckDB** and creating a dashboard in Tableau to visualise mu watch history.  

The result: a personal analytics dashboard showing my top creators, most-watched videos, and viewing habits throughout the year 📊

---

## 🚀 Features
- 📊 **Data Modeling with dbt**: Build clean, reusable models for analyzing YouTube history.  
- 🗄️ **DuckDB**: Lightweight analytical database for local storage and fast queries.  
- 🔌 **Tableau Dashboard**: Interactive dashboard built via JDBC connection to DuckDB.  
- 🔄 **ETL Pipeline**: Transform raw data into structured analytics-friendly tables.  
- 📅 **Wrapped Insights**:
  - Total videos & channels watched  
  - Top 5 videos and channels  
  - Daily & monthly watch trends  
  - Average videos per day  

--- 

## 🛠️ Tech Stack
- **dbt (Data Build Tool)** → SQL-based transformations, modular data modeling, and lineage tracking.  
- **DuckDB** → Lightweight OLAP database for fast querying.  
- **Tableau (via JDBC)** → Dashboarding & visual storytelling.  
- **GitHub** → Version control and project sharing.  

--- 

## 📂 Project Structure

My-Youtube-Wrapped/
├── dbt_project/                # dbt models, seeds, snapshots
│   ├── models/
│   ├── snapshots/
│   └── seeds/
├── dashboards/                 # Tableau dashboards (JDBC connection to DuckDB)
│   └── youtube_wrapped.twb     # Tableau workbook
├── load.py                     # Python script to load raw YouTube data into DuckDB
├── youtube_history.duckdb      # Local DuckDB database file
└── README.md                   # Project documentation



---

## 🌐 DAG
I created a star schema with one fact table (watch history) and 4 dimensions. DAG is below:

<img width="1784" height="966" alt="image" src="https://github.com/user-attachments/assets/b5346b74-d38a-4535-8161-a979f7654534" />


---

## 📊 Tableau Dashboard

The dashboard is built in Tableau and connected to DuckDB via **JDBC**.  [![View Dashboard](https://img.shields.io/badge/View-Dashboard-blue?style=for-the-badge&logo=tableau)](https://public.tableau.com/app/profile/imaan.shahid5731/viz/YoutubeWrapped/Dashboard1)  
It showcases:
- Wrapped-style highlights  
- Trends across months and days  
- Interactive visuals for **top videos** & **creators**
  

<img width="1255" height="1006" alt="image" src="https://github.com/user-attachments/assets/3617a1af-22eb-4d49-9e66-a5291ef8a253" />

---

## 🔮 Future Improvements
- Add more advanced analytics (watch time, categories, etc.)  
- Deploy dbt models in a cloud data warehouse  
- Enhance interactivity of dashboard with filters  

---

## 🤝 Contributing
Pull requests and suggestions are welcome!  
Feel free to fork this repo and submit a PR to add features, improve queries, or enhance the dashboard design.  
