#!/bin/bash

csv_file="data2.csv"

if [ ! -f "$csv_file" ]; then
	echo "El achivo csv no existe"
	exit 1
fi

c_metadata=$(stat -c "%s:%Y" "$csv_file")
echo "$c_metadata"
