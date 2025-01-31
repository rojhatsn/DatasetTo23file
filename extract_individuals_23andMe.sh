#!/bin/bash

PLINK_DATASET="dataset"
SAMPLES_FILE="filtered_samples.txt"

mkdir -p extracted_samples_23andMe

while read FID IID; do
    echo "Processing $FID $IID..."
    echo "$FID $IID" > temp_keep.txt

    plink --bfile $PLINK_DATASET --keep temp_keep.txt --recode 23 --out extracted_samples_23andMe/${IID}_23andMe

    rm temp_keep.txt
done < "$SAMPLES_FILE"

echo "All selected samples have been extracted!"
