#!/bin/bash
#automation python
filename="profiles.csv"
if [ ! -e "$filename" ]; then
	python3 read.py
	chmod +x $filename
else
	rm -f "$filename"
	python3 read.py
	chmod +x $filename
fi

#folders
if ! [ -d data ]
	then
		mkdir data
fi
if ! [ -d data/rawdata ]
	then
		mkdir data/rawdata
fi
if ! [ -d data/sortdata ]
	then
		mkdir data/sortdata
fi

#date
subtract_days() {
	local date_to_sub="$1"
	local days="$2"
	date -d "$date_to_sub - $days days" +%Y-%m-%d
}

handle_month() {
	echo "more than a month"
}

same_day() {
	date +%Y-%m-%d
}

#Coincidencias
buscar_coincidencias() {
    local archivo="$1"
    local etiquetas="$2"
    local coincidencias=$(grep -n -E -w "$etiquetas" "$archivo")
    
    if [[ -n $coincidencias ]]; then
        echo "$etiquetas #'s: $coincidencias" >> "coincidence-$archivo.txt"
    fi
}

#variables
declare -A profiles

while IFS=',' read -r title url
do
	profiles["$title"]="$url"
done < "$filename"

read -p "[*] Select the initial letter: " inicial
inicial=$(echo "$inicial" | tr '[:lower:]' '[:upper:]')
echo "Results that starts with $inicial"
for key in "${!profiles[@]}"
do
    if [[ $key == ${inicial}* ]]; then
		search=${profiles[$key]}
                #Extraer la información de los posts de donde vienen los perfiles

		echo "###################################"
        	echo "Analyzing Information From: $search"
        	echo "###################################"

        	search_limpia=$(echo "$search" | sed -e 's#https://www.instagram.com/##')
        	echo "profile: $key"
        	echo "link: $search_limpia"
        	profile=$(echo "$key" | tr ' ' '_')
		wget --wait=40 --limit-rate=40k -U Mozilla -bq https://www.picnob.com/profile/$search_limpia/ -O data/rawdata/Ig-$profile.txt > /dev/null
        	sleep 15
        	while read -r linea; do
		#Segunda parte
		#Agrupar la informaci�n en un solo documento
			echo "$linea"
        	done < data/rawdata/Ig-$profile.txt | grep  -o '<img alt[^>]*>' | tail -n +4 | head -n -1 | sed 's/class="lazyload[^>]*>//g' | sed 's/<img alt=//g' > data/sortdata/text-$profile.csv
		while read -r dates; do
			echo "$dates"
		done < data/rawdata/Ig-$profile.txt | grep '<span class="txt">' | head -n -1 | tail -n +2 | sed 's/<span class="txt">//g' | sed 's/<\/span>//g' > data/sortdata/dates-$profile.csv
		while read -r link; do
			echo "$link"
		done < data/rawdata/Ig-$profile.txt | grep 'data-src' | sed 's/.*data-src/data-src/' | sed 's/">//g' | sed 's/data-src="//g' > data/sortdata/links-$profile.csv
		while read -r followers; do
			echo "$followers"
		done < data/rawdata/Ig-$profile.txt | grep -m 2 'num" title=' | tail -n 1 | sed 's/<div class="num" title="//g' | sed 's/">//g' | sed "s/\,/\'/g" > data/sortdata/follow-$profile.csv
		text_data="data/sortdata/text-$profile.csv"
		text_list=()
		dates_data="data/sortdata/dates-$profile.csv"
		dates_list=()
		links_data="data/sortdata/links-$profile.csv"
		links_list=()
		follow_data="data/sortdata/follow-$profile.csv"
		follow_list=()
		while IFS= read -r text; do
			text_list+=("$text")
		done < "$text_data" 
		while IFS=',' read -r date days_to_subtract; do
			if echo "$date" | grep -q "days"; then
				result_date=$(subtract_days "$date" "${days_to_subtract/days/}")
			elif echo "$date" | grep -q "day"; then
				result_date=$(subtract_days "$date" "${days_to_subtract/days/}")
			elif echo "$date" | grep -q "month"; then
				result_date=$(handle_month "$date")
			elif echo "$date" | grep -q "minutes"; then
				result_date=$(same_day "$date")
			else
				echo "Error: Contact Leo"
				continue
			fi
			dates_list+=("$result_date")
		done < "$dates_data"
		while IFS= read -r link; do
			IFS=',' read -ra fields3 <<< "$link"
			links_list+=("${fields3[@]}")
		done < "$links_data"
		while IFS= read -r followers; do
			follow_list+=("$followers")
		done < "$follow_data"
		#echo "$follow_list"
		num_text_list=${#text_list[@]}
		num_dates_list=${#dates_list[@]}
		num_links_list=${#links_list[@]}
		echo "Text","Dates","Links","Reach" >> "match-$profile.csv"
		#Debug de la cantidad de datos
		#echo "$num_text_list, $num_dates_list, $num_links_list"
		if [ $num_text_list -eq $num_dates_list ]; then
			if [ $num_text_list -eq $num_links_list ]; then
				for ((i = 0; i < num_text_list; i++)); do
					match_name="match_$((i+1))"
					line="${text_list[i]}","${dates_list[i]}","${links_list[i]}","$follow_list"
					echo "$line" >> "match-$profile.csv"
				done	
			else
				echo "there are not the same number of elements and links"
			fi
		else
			echo "there are not the same number of elements and dates"
		fi
		echo "match-$profile.csv" >> "list.csv"

	fi
done

python3 information_excel.py

#Quitar .csv
rm -f "$filename"
rm list.csv
