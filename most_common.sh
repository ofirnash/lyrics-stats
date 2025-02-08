#!/bin/bash

earlist_year=$(cat dataset.txt | sort -h | cut -d "," -f 1 | head -1)
latest_year=$(cat dataset.txt | sort -h | cut -d "," -f 1 | tail -1)

for year in $(seq $earlist_year $latest_year); do
	cat dataset.txt | grep $year | cut -d "," -f 2 | tr ' ' '\n'| grep  '\w' | sort -h | uniq -c | sort -h | awk '{print $2}' | tail -1  >> most_common_words.txt 
done

