CREATE VIEW vw_fact_sales AS
SELECT * FROM OPENROWSET(
    BULK 'https://ecommercedeproj1998.dfs.core.windows.net/gold/fact_sales/',
    FORMAT = 'DELTA'
) AS result;

CREATE VIEW vw_dim_customer AS
SELECT * FROM OPENROWSET(
    BULK 'https://ecommercedeproj1998.dfs.core.windows.net/gold/dim_customer_scd2/',
    FORMAT = 'DELTA'
) AS result;

CREATE VIEW vw_dim_product AS
SELECT * FROM OPENROWSET(
    BULK 'https://ecommercedeproj1998.dfs.core.windows.net/gold/dim_product/',
    FORMAT = 'DELTA'
) AS result

CREATE VIEW vw_dim_date AS
SELECT * FROM OPENROWSET(
    BULK 'https://ecommercedeproj1998.dfs.core.windows.net/gold/dim_date/',
    FORMAT = 'DELTA'
) AS result