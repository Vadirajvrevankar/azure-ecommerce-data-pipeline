# Databricks notebook source
df = spark.read.csv(
    "abfss://bronze@ecommercedeproj1998.dfs.core.windows.net/online_retail_raw.csv",
    header=True,
    inferSchema=True
)
df.printSchema()
df.show(5)

# COMMAND ----------

from pyspark.sql.functions import col, count, when

df.select([count(when(col(c).isNull(), c)).alias(c) for c in df.columns]).show()
df.filter(col("Quantity") < 0).show(5)
print("Total rows:", df.count())

# COMMAND ----------

from pyspark.sql.functions import when, lit

df_clean = df.filter(col("CustomerID").isNotNull())
df_clean = df_clean.withColumn(
    "TransactionType", 
    when(col("Quantity") < 0, lit("Return")).otherwise(lit("Sale"))
)
df_clean = df_clean.dropDuplicates()
df_clean = df_clean.filter(col("Description").isNotNull())

print("Cleaned rows:", df_clean.count())
df_clean.show(5)

# COMMAND ----------

df_clean.write.format("delta").mode("overwrite").save(
    "abfss://silver@ecommercedeproj1998.dfs.core.windows.net/online_retail_cleaned"
)
print("Written to Silver successfully!")