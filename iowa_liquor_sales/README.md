# Iowa Liquor Sales Analysis

Comprehensive analysis of Iowa liquor sales data from BigQuery public datasets, exploring sales trends, year-over-year growth patterns, top-performing counties and stores, and market dynamics across multiple years (2012-2025).

## 📊 Project Overview

This project analyzes the `bigquery-public-data.iowa_liquor_sales.sales` dataset to uncover insights into the Iowa liquor retail market, including:

- Annual sales trends and growth patterns
- Top-performing stores and geographic distribution
- County-level sales analysis and seasonal variations
- Year-over-year growth comparisons
- Best-selling liquor brands and market concentration

## 📁 Project Structure

```project_structure

iowa_liquor_sales/
├── exports/                          # CSV exports from BigQuery
│   ├── 00_growth_percentage_change_per_year.csv
│   ├── 01_top_15_stores.csv
│   ├── 02_top_5_counties_per_month.csv
│   ├── 03_counties_with_highest_yoy.csv
│   └── 04_top_brands.csv
├── scripts/                          # SQL query files
│   ├── 00_growth_percentage_change_per_year.sql
│   ├── 01_top_15_stores.sql
│   ├── 02_top_5_counties_per_month.sql
│   ├── 03_counties_with_highest_yoy.sql
│   └── 04_top_brands.sql
├── iowa_liquor_sales_analysis.ipynb # Jupyter notebook with visualizations
└── README.md                         # Project documentation
```

## 🗂️ Data Files

### Exports (CSV Files)

| File | Description | Columns |
|------|-------------|---------|
| `00_growth_percentage_change_per_year.csv` | Annual sales totals and year-over-year growth rates | `year`, `total_sales`, `growth_percent` |
| `01_top_15_stores.csv` | Top 15 stores by total sales revenue | `store_name`, `total_sales_in_dollars` |
| `02_top_5_counties_per_month.csv` | Monthly sales data for top 5 counties (2012-2025) | `county`, `year`, `month`, `monthly_sales` |
| `03_counties_with_highest_yoy.csv` | Counties with highest year-over-year growth | `county`, `year`, `total_sales`, `yoy_growth` |
| `04_top_brands.csv` | Top 10 liquor brands by total sales | `brand`, `total_sales` |

### Scripts (SQL Queries)

All SQL queries are designed to run on Google BigQuery using the public dataset `bigquery-public-data.iowa_liquor_sales.sales`.

| Script | Analysis Performed |
|--------|-------------------|
| `00_growth_percentage_change_per_year.sql` | Calculates total annual sales and year-over-year growth percentages |
| `01_top_15_stores.sql` | Identifies top 15 stores by total sales revenue |
| `02_top_5_counties_per_month.sql` | Aggregates monthly sales for the top 5 counties over time |
| `03_counties_with_highest_yoy.sql` | Computes year-over-year growth for top-performing counties |
| `04_top_brands.sql` | Ranks liquor brands by total sales volume |

## 📈 Visualizations

The Jupyter notebook (`iowa_liquor_sales_analysis.ipynb`) contains comprehensive data visualizations including:

1. **Annual Sales Trends and YoY Growth** - Time series analysis of total sales with growth rate visualization
2. **Top 15 Stores Performance** - Comparative analysis of highest-grossing retail locations
3. **Monthly Sales Trends for Top 5 Counties** - Seasonal patterns and geographic distribution
4. **Year-over-Year Growth by County** - Growth trajectories for leading counties
5. **Top Brands Analysis** - Market share and sales concentration metrics

## 🔍 Key Insights

- **Market Growth**: Steady growth from 2012-2024 with peak sales of $447M in 2024
- **Top County**: Polk County consistently dominates with highest sales volume
- **Seasonal Patterns**: October and December show peak sales months
- **Store Distribution**: Hy-Vee locations, Costco, and Sam's Club represent major retail channels
- **Brand Leaders**: Tito's Handmade Vodka leads with $212M in total sales
- **2025 Data**: Shows -31% decline (likely partial year data as of analysis date)

## 🛠️ Technologies Used

- **Data Source**: Google BigQuery (public dataset)
- **Query Language**: SQL
- **Analysis & Visualization**: Python
  - pandas - Data manipulation
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

1. **Access BigQuery**: Ensure you have access to Google BigQuery and the Iowa liquor sales public dataset
2. **Run SQL Queries**: Execute the SQL scripts in the `scripts/` folder to generate data exports
3. **Export Data**: Save query results as CSV files in the `exports/` folder
4. **Run Analysis**: Open and execute `iowa_liquor_sales_analysis.ipynb` in Jupyter Notebook or Google Colab

## 📊 Sample Usage

### Running SQL Queries in BigQuery

```sql
-- Example: Get annual growth rates
WITH yearly_totals AS (
  SELECT 
    EXTRACT(YEAR FROM date) AS year,
    SUM(sale_dollars) AS total_sales
  FROM `bigquery-public-data.iowa_liquor_sales.sales`
  GROUP BY year
  ORDER BY year
)
SELECT 
  year,
  total_sales,
  ROUND(((total_sales - LAG(total_sales) OVER (ORDER BY year)) 
    / LAG(total_sales) OVER (ORDER BY year)) * 100, 2) AS growth_percent
FROM yearly_totals;
```

### Loading and Visualizing Data in Python

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('exports/00_growth_percentage_change_per_year.csv')

# Create visualization
plt.figure(figsize=(12, 6))
plt.plot(df['year'], df['total_sales'] / 1e6, marker='o')
plt.title('Iowa Liquor Sales Over Time')
plt.xlabel('Year')
plt.ylabel('Sales (Millions $)')
plt.grid(True, alpha=0.3)
plt.show()
```

## 📝 Notes

- Data covers the period from 2012 to October 2025
- All sales figures are in USD
- 2025 data is incomplete (partial year)
- Geographic analysis focuses on Iowa counties only
- Store names and brands are as recorded in the original dataset

## 🤝 Contributing

This is an analytical project based on public data. Feel free to:

- Extend the analysis with additional queries
- Create new visualizations
- Explore different aspects of the dataset
- Suggest improvements to existing analyses

## 📄 Data Source

**Dataset**: Iowa Liquor Sales  
**Provider**: BigQuery Public Datasets  
**Path**: `bigquery-public-data.iowa_liquor_sales.sales`  
**License**: Publicly available dataset

## 📧 Contact

For questions or feedback about this analysis, please refer to the project repository.

**Last Updated**: October 2025  
**Analysis Period**: 2012-2025  
**Data Source**: Google BigQuery Public Datasets
