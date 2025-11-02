# Austin Bike Share Analysis

Comprehensive analysis of Austin bike share data, exploring usage patterns, bike utilization metrics, popular routes with seasonality trends, and anomaly detection for station activity monitoring across the bike share network.

## 📊 Project Overview

This project analyzes Austin's bike share system data to uncover insights into urban mobility patterns, including:

- Peak hour usage and demand patterns
- Median trip duration by subscriber type
- Bike utilization efficiency and maintenance indicators
- Popular routes and seasonal travel patterns
- Daily station activity anomaly detection

## 📁 Project Structure

```project_structure
austin_bikeshare/
├── exports/                          # CSV data files
│   ├── 00_peak_hour_patterns.csv
│   ├── 01_median_trip_duration_per_subscriber_type.csv
│   ├── 02_bike_utilization_for_the_last_month.csv
│   ├── 03_popular_routes_with_seasonality.csv
│   └── 04_anomaly_detection.csv
├── scripts/                          # Analysis scripts
│   ├── 00_peak_hour_patterns.py
│   ├── 01_median_trip_duration_per_subscriber_type.py
│   ├── 02_bike_utilization_for_the_last_month.py
│   ├── 03_popular_routes_with_seasonality.py
│   └── 04_anomaly_detection.py
└── README.md                         # Project documentation
```

## 🗂️ Data Files

### Exports (CSV Files)

| File | Description | Columns |
|------|-------------|---------|
| `00_peak_hour_patterns.csv` | Hourly trip patterns showing demand distribution throughout the day | `hour`, `trip_count`, `peak_category` |
| `01_median_trip_duration_per_subscriber_type.csv` | Trip duration analysis segmented by subscriber membership type | `subscriber_type`, `start_station_id`, `median_duration_minutes`, `trips_at_station` |
| `02_bike_utilization_for_the_last_month.csv` | Individual bike performance metrics for the most recent month | `bike_id`, `active_days`, `avg_rides_per_active_day`, `longest_idle_days` |
| `03_popular_routes_with_seasonality.csv` | Route popularity and monthly usage patterns (2014-2024) | `start_station_name`, `end_station_name`, `month`, `trips_in_month` |
| `04_anomaly_detection.csv` | Daily station activity anomalies based on 28-day moving averages | `start_station_id`, `start_station_name`, `day`, `daily_trips`, `moving_avg_28_before`, `anomaly_flag`, `multiplier` |

### Scripts (Python Files)

All Python scripts generate comprehensive visualizations and statistical summaries for bike share operations analysis.

| Script | Analysis Performed |
|--------|-------------------|
| `00_peak_hour_patterns.py` | Identifies hourly demand patterns and peak usage times |
| `01_median_trip_duration_per_subscriber_type.py` | Analyzes trip duration differences across subscriber categories |
| `02_bike_utilization_for_the_last_month.py` | Evaluates bike fleet efficiency and maintenance needs |
| `03_popular_routes_with_seasonality.py` | Maps route popularity and identifies seasonal trends |
| `04_anomaly_detection.py` | Detects unusual station activity for operational alerts |

## 📈 Visualizations

Each Python script generates publication-ready visualizations including:

1. **Peak Hour Patterns** - Hourly demand curves with commuter vs recreational usage identification
2. **Trip Duration by Subscriber Type** - Distribution analysis, categorization, and membership insights
3. **Bike Utilization** - Efficiency rankings, activity distributions, and idle time analysis
4. **Popular Routes with Seasonality** - Top routes, temporal trends, monthly heatmaps, and round-trip analysis
5. **Anomaly Detection** - Spike/drop identification, severity rankings, and temporal tracking

## 🔍 Key Insights

- **Peak Hours**: Morning (7-9 AM) and evening (4-7 PM) commute periods dominate usage
- **Trip Duration**: Casual users take longer trips (~30+ min) vs members (~10-15 min)
- **Top Routes**: University campus connections (21st/Speedway @ PCL) show highest volumes
- **Seasonal Patterns**: Spring and fall peaks align with academic calendar
- **Bike Efficiency**: Top performers achieve 31 active days with 4.74 rides/day average
- **Anomaly Detection**: Real-time monitoring identifies spikes (1.5x avg) and drops (0.5x avg)

## 🛠️ Technologies Used

- **Analysis & Visualization**: Python
  - pandas - Data manipulation and analysis
  - matplotlib - Data visualization
  - seaborn - Statistical graphics
  - numpy - Numerical computing

## 📋 Requirements

```python
pandas
matplotlib
seaborn
numpy
```

## 🚀 Getting Started

1. **Prepare Data**: Ensure CSV files are in the `exports/` folder
2. **Install Dependencies**: `pip install pandas matplotlib seaborn numpy`
3. **Run Analysis**: Execute Python scripts from the `scripts/` folder
4. **View Results**: Visualizations will display automatically with printed statistics

## 📊 Sample Usage

### Running Analysis Scripts

```python
# Example: Analyze bike utilization
python scripts/02_bike_utilization_for_the_last_month.py

# This will generate:
# - 4-panel visualization dashboard
# - Top 20 most efficient bikes ranking
# - Idle time impact analysis
# - Comprehensive statistics output
```

### Loading and Exploring Data

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load bike utilization data
df = pd.read_csv('exports/02_bike_utilization_for_the_last_month.csv')

# Calculate efficiency score
df['efficiency'] = df['active_days'] * df['avg_rides_per_active_day']

# View top performers
print(df.nlargest(10, 'efficiency'))
```

## 📝 Notes

- **Data Period**: Analysis covers 2014-2024 for route seasonality, June 2024 for anomaly detection
- **Geographic Focus**: Austin, Texas bike share network
- **Station Naming**: Multiple naming conventions exist for the same locations (e.g., "21st/Speedway @ PCL" vs "21st & Speedway @PCL")
- **Anomaly Thresholds**: Spikes defined as >1.5x baseline, drops as <0.5x baseline
- **Efficiency Metrics**: Based on active days × average rides per active day

## 🤝 Contributing

This is an analytical project for bike share operations optimization. Feel free to:

- Extend the analysis with additional metrics
- Create interactive dashboards
- Explore machine learning predictions
- Suggest improvements to anomaly detection algorithms

## 📄 Data Source

**Dataset**: Austin Bike Share System  
**Coverage**: 2014-2024  
**Metrics**: Trip data, station activity, bike performance  
**Update Frequency**: Daily for anomaly detection, monthly for utilization reports

## 📧 Contact

For questions or feedback about this analysis, please refer to the project repository.

**Last Updated**: November 2024  
**Analysis Period**: 2014-2024  
**Network Size**: 60+ active stations, 50+ bikes monitored
