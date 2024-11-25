docker build -t pyspark-image .

docker run -it --name pyspark-etl -v ./../data/data_from_API:/app/data pyspark-image