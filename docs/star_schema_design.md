# Star Schema Design - Gold Layer

## Fact Table: fact_sales
Grain: One row per transaction line item

| Column | Description |
|--------|-------------|
| InvoiceNo | Transaction identifier |
| StockCode | Foreign key to dim_product |
| CustomerID | Foreign key to dim_customer |
| InvoiceDate | Foreign key to dim_date |
| Quantity | Units sold/returned |
| UnitPrice | Price per unit |
| TotalAmount | Quantity * UnitPrice |
| TransactionType | Sale or Return |

## Dimension Table: dim_customer
| Column | Description |
|--------|-------------|
| CustomerID | Primary key |
| Country | Customer's country |

## Dimension Table: dim_product
| Column | Description |
|--------|-------------|
| StockCode | Primary key |
| Description | Product name/description |

## Dimension Table: dim_date
| Column | Description |
|--------|-------------|
| InvoiceDate | Primary key (date) |
| Year | Extracted year |
| Month | Extracted month |
| Day | Extracted day |
| Quarter | Extracted quarter |
| DayOfWeek | Extracted day of week |

## Why Star Schema?
- Simplifies analytical queries (fewer joins vs normalized/snowflake design)
- Fact table holds measures (Quantity, UnitPrice, TotalAmount)
- Dimension tables hold descriptive attributes for filtering/grouping
- Optimized for BI tools like Power BI to query efficiently