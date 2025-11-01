# TheLook Ecommerce Analysis

Comprehensive analysis of TheLook eCommerce data from BigQuery public datasets, exploring revenue trends, customer behavior, product performance, and business growth patterns across multiple years (2019-2025).

## 📊 Project Overview

This project analyzes the `bigquery-public-data.thelook_ecommerce` dataset to uncover insights into the eCommerce platform's business metrics, including:

- Monthly revenue trends and growth patterns
- Top-selling products and customer lifetime value
- Average order value trends and stability
- Product category performance and efficiency
- Year-over-year sales growth and business expansion

## 📁 Project Structure

```project structure

thelook_ecommerce_analysis/
├── exports/                          # CSV exports from BigQuery
│   ├── 00_monthly_revenue_trend.csv
│   ├── 01_top_15_selling_product.csv
│   ├── 02_top_10_customers.csv
│   ├── 03_average_order_value.csv
│   ├── 04_product_category_performance.csv
│   └── 05_yoy_sales.csv
├── scripts/                          # SQL query files
│   ├── 00_monthly_revenue_trend.sql
│   ├── 01_top_15_selling_product.sql
│   ├── 02_top_10_customers.sql
│   ├── 03_average_order_value.sql
│   ├── 04_product_category_performance.sql
│   └── 05_yoy_sales.sql
├── thelook_ecommerce_analysis.ipynb # Jupyter notebook with visualizations
└── README.md                         # Project documentation
```

## 🗂️ Data Files

### Exports (CSV Files)

| File | Description | Columns |
|------|-------------|---------|
| `00_monthly_revenue_trend.csv` | Monthly revenue from 2019-2025 | `month`, `total_revenue` |
| `01_top_15_selling_product.csv` | Top 15 products by sales revenue | `product_name`, `total_sales` |
| `02_top_10_customers.csv` | Top 10 customers by lifetime value | `user_id`, `first_name`, `last_name`, `lifetime_value` |
| `03_average_order_value.csv` | Monthly average order value trends | `month`, `avg_order_value` |
| `04_product_category_performance.csv` | Category-level performance metrics | `category`, `revenue`, `total_orders` |
| `05_yoy_sales.csv` | Year-over-year sales growth analysis | `year`, `total_revenue`, `prev_year_revenue`, `yoy_growth` |

### Scripts (SQL Queries)

All SQL queries are designed to run on Google BigQuery using the public dataset `bigquery-public-data.thelook_ecommerce`.

| Script | Analysis Performed |
|--------|-------------------|
| `00_monthly_revenue_trend.sql` | Aggregates monthly revenue totals over time |
| `01_top_15_selling_product.sql` | Identifies top 15 products by total sales |
| `02_top_10_customers.sql` | Ranks customers by lifetime value |
| `03_average_order_value.sql` | Calculates average order value by month |
| `04_product_category_performance.sql` | Analyzes revenue and orders by category |
| `05_yoy_sales.sql` | Computes year-over-year sales growth rates |

## 📈 Visualizations

The Jupyter notebook (`thelook_ecommerce_analysis.ipynb`) contains comprehensive data visualizations including:

1. **Monthly Revenue Trend Analysis** - Time-series analysis with moving average and growth patterns
2. **Top 15 Selling Products** - Product rankings and market share distribution
3. **Top 10 Customers by Lifetime Value** - Customer rankings and tier segmentation
4. **Average Order Value Trends** - Monthly AOV patterns with yearly distributions
5. **Product Category Performance** - Revenue vs order volume with efficiency metrics
6. **Year-over-Year Sales Growth** - Annual revenue progression with growth rate analysis

## 🔍 Key Insights

- **Revenue Growth**: Explosive growth from $117K (2019) to $4.22M (2025), representing 35.9x increase
- **CAGR**: 96.7% compound annual growth rate over 6 years
- **Top Product**: The North Face Denali Down Womens Jacket leads with $15.4K in sales
- **Top Customer**: Shane Anthony with $2,385 lifetime value
- **Leading Category**: Outerwear & Coats dominates with $1.32M revenue
- **Average Order Value**: Stable at ~$86-87, showing consistent customer behavior
- **Peak Growth**: 224.6% YoY growth in 2020, with continued strong performance

## 🛠️ Technologies Used

- **Data Source**: Google BigQuery (public dataset)
- **Query Language**: SQL
- **Analysis & Visualization**: Python
  - pandas - Data manipulation
  - matplotlib - Data visualization
  - seaborn - Statistical graphics
  - numpy - Numerical computing

## 📋 Requirements

```reqs
pandas
matplotlib
seaborn
numpy
```

## 🚀 Getting Started

1. **Access BigQuery**: Ensure you have access to Google BigQuery and the TheLook eCommerce public dataset
2. **Run SQL Queries**: Execute the SQL scripts in the `scripts/` folder to generate data exports
3. **Export Data**: Save query results as CSV files in the `exports/` folder
4. **Run Analysis**: Open and execute `thelook_ecommerce_analysis.ipynb` in Jupyter Notebook or Google Colab

## 📊 Sample Usage

### Running SQL Queries in BigQuery

```sql
-- Example: Monthly revenue trend
SELECT
  FORMAT_DATE('%Y-%m', created_at) AS month,
  ROUND(SUM(sale_price), 2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'
GROUP BY month
ORDER BY month;
```

### Loading and Visualizing Data in Python

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('exports/00_monthly_revenue_trend.csv')
df['month'] = pd.to_datetime(df['month'])

# Create visualization
plt.figure(figsize=(14, 6))
plt.plot(df['month'], df['total_revenue'] / 1000, marker='o', linewidth=2)
plt.title('TheLook Monthly Revenue Trend')
plt.xlabel('Month')
plt.ylabel('Revenue (Thousands $)')
plt.grid(True, alpha=0.3)
plt.xticks(rotation=45)
plt.show()
```

## 📝 Notes

- Data covers the period from 2019 to October 2025
- All sales figures are in USD
- Analysis includes only completed orders (status = 'Complete')
- Customer data anonymized with user IDs
- Product names and categories as recorded in the original dataset

## 🤝 Contributing

This is an analytical project based on public data. Feel free to:

- Extend the analysis with additional queries
- Create new visualizations
- Explore customer segmentation
- Analyze seasonal patterns
- Suggest improvements to existing analyses

## 📄 Data Source

**Dataset**: TheLook eCommerce  
**Provider**: BigQuery Public Datasets  
**Path**: `bigquery-public-data.thelook_ecommerce`  
**License**: Publicly available dataset

## 📧 Contact

For questions or feedback about this analysis, please refer to the project repository.

**Last Updated**: November 2025  
**Analysis Period**: 2019-2025  
**Data Source**: Google BigQuery Public Datasets
