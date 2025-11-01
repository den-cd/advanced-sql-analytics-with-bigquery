# COVID-19 Global Data Analysis

Comprehensive analysis of COVID-19 pandemic data from BigQuery public datasets, exploring daily case trends, mortality rates, geographic patterns, and decline trajectories across multiple countries from 2020-2022.

## 📊 Project Overview

This project analyzes the `bigquery-public-data.covid19_open_data` dataset to uncover insights into the global pandemic response, including:

- Daily new case trends with 7-day moving averages
- Monthly case growth patterns across countries
- High-fatality countries and mortality rate analysis
- Post-peak decline patterns and recovery trajectories
- Geographic distribution and wave identification

## 📁 Project Structure

```project structure
covid19_open_data_analysis/
├── exports/                          # CSV exports from BigQuery
│   ├── 00_daily_growth_rate_7Day_MA.csv
│   ├── 01_monthly_case_growth_per_country.csv
│   ├── 02_high_fatality_countries.csv
│   └── 03_countries_with_fastest_decline.csv
├── scripts/                          # SQL query files
│   ├── 00_daily_growth_rate_7Day_MA.sql
│   ├── 01_monthly_case_growth_per_country.sql
│   ├── 02_high_fatality_countries.sql
│   └── 03_countries_with_fastest_decline.sql
├── covid19_open_data_analysis.ipynb # Jupyter notebook with visualizations
└── README.md                         # Project documentation
```

## 🗂️ Data Files

### Exports (CSV Files)

| File | Description | Columns |
|------|-------------|---------|
| `00_daily_growth_rate_7Day_MA.csv` | Daily new cases with 7-day moving average (2020-2022) | `date`, `avg_new_cases_7d` |
| `01_monthly_case_growth_per_country.csv` | Monthly cases and growth rates for 5 countries | `country_name`, `month`, `monthly_cases`, `prev_month_cases`, `growth_rate` |
| `02_high_fatality_countries.csv` | Top 10 countries with highest fatality rates | `country_name`, `total_cases`, `total_deaths`, `fatality_rate` |
| `03_countries_with_fastest_decline.csv` | Daily cases and percentage of peak for decline analysis | `country_name`, `date`, `daily_cases`, `pct_of_peak` |

### Scripts (SQL Queries)

All SQL queries are designed to run on Google BigQuery using the public dataset `bigquery-public-data.covid19_open_data`.

| Script | Analysis Performed |
|--------|-------------------|
| `00_daily_growth_rate_7Day_MA.sql` | Calculates 7-day moving average of daily new cases globally |
| `01_monthly_case_growth_per_country.sql` | Aggregates monthly cases and computes month-over-month growth rates |
| `02_high_fatality_countries.sql` | Identifies countries with highest case fatality rates |
| `03_countries_with_fastest_decline.sql` | Tracks daily cases and percentage of peak for decline pattern analysis |

## 📈 Visualizations

The Jupyter notebook (`covid19_open_data_analysis.ipynb`) contains comprehensive data visualizations including:

1. **Daily Growth Rate Analysis** - 7-day moving average timeline with wave identification and peak annotations
2. **Monthly Case Growth by Country** - Comparative time-series and growth rate heatmap for Brazil, India, Philippines, Russia, and United States
3. **High Fatality Countries** - Fatality rate rankings, cases vs deaths scatter plots, and distribution analysis
4. **Decline Pattern Analysis** - Post-peak decline trajectories showing recovery patterns and normalized percentage views

## 🔍 Key Insights

- **Global Peak**: 778,354 daily cases (7-day avg) on January 16, 2022 during Omicron wave
- **Highest Fatality Rate**: Peru with 5.68% case fatality rate (605,474 deaths from 10.7M cases)
- **Largest Single-Day Peak**: United States with 60.2M cases in January 2022
- **Wave Patterns**: Clear identification of First Wave (Spring 2020), Delta (Summer 2021), and Omicron (Winter 2021-2022)
- **Growth Extremes**: Philippines experienced 6,221% month-over-month growth (Jan 2022)
- **Decline Rates**: Varied recovery patterns with some countries showing rapid decline post-peak while others exhibited prolonged elevated case levels

## 🛠️ Technologies Used

- **Data Source**: Google BigQuery (public dataset)
- **Query Language**: SQL
- **Analysis & Visualization**: Python
  - pandas - Data manipulation
  - matplotlib - Data visualization
  - seaborn - Statistical graphics
  - numpy - Numerical computing

## 📋 Requirements

```imports
pandas
matplotlib
seaborn
numpy
```

## 🚀 Getting Started

1. **Access BigQuery**: Ensure you have access to Google BigQuery and the COVID-19 Open Data dataset
2. **Run SQL Queries**: Execute the SQL scripts in the `scripts/` folder to generate data exports
3. **Export Data**: Save query results as CSV files in the `exports/` folder
4. **Run Analysis**: Open and execute `covid19_open_data_analysis.ipynb` in Jupyter Notebook or Google Colab

## 📊 Sample Usage

### Running SQL Queries in BigQuery

```sql
-- Example: Calculate 7-day moving average of daily cases
SELECT
  date,
  AVG(new_confirmed) OVER (
    ORDER BY date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS avg_new_cases_7d
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
WHERE aggregation_level = 0
ORDER BY date;
```

### Loading and Visualizing Data in Python

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('exports/00_daily_growth_rate_7Day_MA.csv')
df['date'] = pd.to_datetime(df['date'])

# Create visualization
plt.figure(figsize=(14, 6))
plt.plot(df['date'], df['avg_new_cases_7d'], linewidth=1.5, color='#d62728')
plt.fill_between(df['date'], df['avg_new_cases_7d'], alpha=0.3, color='#d62728')
plt.title('COVID-19 Daily New Cases (7-Day Moving Average)')
plt.xlabel('Date')
plt.ylabel('Average New Cases')
plt.grid(True, alpha=0.3)
plt.show()
```

## 📝 Notes

- Data covers the period from January 2020 to September 2022
- 7-day moving averages used to smooth daily reporting variations
- Fatality rates may vary due to testing availability and reporting practices
- Country-level data focuses on five major nations for comparative analysis
- Peak percentages normalized to each country's maximum daily cases

## 🤝 Contributing

This is an analytical project based on public data. Feel free to:

- Extend the analysis with additional countries or metrics
- Create new visualizations exploring different aspects
- Analyze vaccination rates and their correlation with case trends
- Compare policy interventions across countries
- Suggest improvements to existing analyses

## 📄 Data Source

**Dataset**: COVID-19 Open Data  
**Provider**: BigQuery Public Datasets  
**Path**: `bigquery-public-data.covid19_open_data.covid19_open_data`  
**License**: Publicly available dataset  
**Documentation**: [COVID-19 Open Data](https://health.google.com/covid-19/open-data/)

## 📧 Contact

For questions or feedback about this analysis, please refer to the project repository.

**Last Updated**: November 2025  
**Analysis Period**: 2020-2022  
**Data Source**: Google BigQuery Public Datasets - COVID-19 Open Data
