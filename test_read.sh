#!/bin/bash

filename="data.csv"
declare -A profiles

while IFS=',' read -r title url
do
	title="${title//\"/}"
	url="${url//\"/}"
	profiles["$title"]="$url"
done < "$filename"

for key in "${!profiles[@]}"
do
	echo "['$key']='${profiles[$key]}'"
done
