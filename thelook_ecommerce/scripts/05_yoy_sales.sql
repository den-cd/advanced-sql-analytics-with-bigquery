WITH yearly_revenue AS (
  SELECT
    EXTRACT(YEAR FROM created_at) AS year,
    SUM(sale_price) AS total_revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY year
)
SELECT
  year,
  total_revenue,
  LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue,
  ROUND(((total_revenue - LAG(total_revenue) OVER (ORDER BY year)) / LAG(total_revenue) OVER (ORDER BY year)) * 100, 2) AS yoy_growth
FROM yearly_revenue
ORDER BY year DESC;
