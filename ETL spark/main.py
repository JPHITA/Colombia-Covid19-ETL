from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Spark Version") \
    .getOrCreate()

print("PySpark Version:", spark.version)

spark.stop()