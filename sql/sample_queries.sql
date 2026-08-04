SELECT TOP 10 * FROM vw_fact_sales;
SELECT TOP 10 * FROM vw_dim_customer;
SELECT TOP 10 * FROM vw_dim_product;
SELECT TOP 10 * FROM vw_dim_date;

SELECT p.Description, SUM(f.TotalAmount) AS Revenue
FROM vw_fact_sales f
JOIN vw_dim_product p
    ON f.StockCode = p.StockCode
WHERE f.TransactionType = 'Sale'
GROUP BY p.Description
ORDER BY Revenue DESC;
