#! /bin/bash

# This script is intended to download files about COVID data, exposed via an API for the Colombian Goberment.
# It sends a request to the specified API endpoint (the API is limited to a maximum o 1000 rows per request),
# retrieves the file data, and saves it to a sink (this case, local file system).

offset=0
while : ; do
    filename=data/extracted_from_API/COVID_DATA-$((offset/1000)).csv # name of the file to be created
    
    # create the file for the next 1000 records
    touch $filename

    # download the next 1000 records
    wget -O $filename \
    "https://www.datos.gov.co/resource/gt2j-8ykr.csv?\$limit=1000&\$offset=$offset"

    offset=$((offset + 1000))

    # if the file has less than 1000 records, then we have reached the end of the dataset
    if [ $(wc -l < $filename) -lt 1000 ]; then
        echo "Finished downloading all records"
        break
    fi
done