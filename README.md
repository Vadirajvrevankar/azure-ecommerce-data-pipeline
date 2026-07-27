\# Azure E-commerce Data Pipeline



\## Overview

End-to-end batch ETL pipeline built on Azure, processing e-commerce 

sales data through a Medallion architecture (Bronze -> Silver -> Gold), 

serving cleaned data to Power BI dashboards.



\## Problem Statement

Raw e-commerce transaction data is messy - missing customer IDs, 

returns represented as negative quantities, duplicate invoices. 

This pipeline ingests, cleans, and transforms this data into 

analytics-ready tables for business reporting.



\## Architecture

Source CSV -> Azure Data Factory -> ADLS Gen2 (Bronze) 

\-> Databricks/PySpark (Silver - cleaned) 

\-> Delta Lake (Gold - aggregated) 

\-> Azure Synapse -> Power BI



\## Tech Stack

\- Azure Data Factory

\- Azure Data Lake Storage Gen2

\- Azure Databricks (PySpark, Delta Lake)

\- Azure Synapse Analytics

\- Power BI

\- Azure Key Vault (secrets management)



\## Dataset

UCI Online Retail Dataset (\~500K rows) - UK-based online retailer 

transactions, Dec 2010 - Dec 2011.



\## Status: In Progress

