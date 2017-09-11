#!/bin/bash

cd $HOME/citibash/

# download all Citi bike trip history data zips from a rehosted location
wget -r --no-parent https://witestlab.poly.edu/bikes/
cd witestlab.poly.edu/bikes/

# extract all the zip files to obtain trip data from Jan 2016 to Sep 2016
unzip "*.zip"

# Extract and store all start and end locations in a new text file
for filename in *.csv; do
	awk -F "\"*,\"*" '{print $5}' $filename >> $HOME/citibash/stat_list.txt
        awk -F "\"*,\"*" '{print $9}' $filename >> $HOME/citibash/stat_list.txt
done

# count the number of times each station occurs and sort by most popular station
cd $HOME/citibash/
cat stat_list.txt | sort | uniq -c | sort -nr >> result.txt
# display result
head result.txt
