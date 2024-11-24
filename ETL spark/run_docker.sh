sudo docker build -t pyspark-container .

sudo docker run -it --name pyspark-etl -v ./../data/data_from_API:/app/data pyspark-container