#!/bin/bash
#Agregar herramientas necesarias

sudo apt-get install curl -y
sudo apt-get install wget -y

#Preguntar que perfil queremos ver

        #Creamos un diccionario con nombre y link de instagram
declare -A profiles=(
["A Cup of Life"]='https://www.instagram.com/shifrajumelet/?hl=nl'
["Aan tafel met Tammie"]='https://www.instagram.com/aantafelmettammie.nl/'
["Allerlekkerste recepten"]='https://www.instagram.com/allerlekkerste/'
["Alyssa Snoeijink"]='https://www.instagram.com/alyssasnoeijink/'
["Angie loves keto"]='https://www.instagram.com/angie.loves.keto/'
["Anjas Foodblog"]='https://www.instagram.com/anjasfoodblog/'
["Ann in de keuken"]='https://www.instagram.com/ann_in_de_keuken/'
["Anne Travel Foodie"]='https://www.instagram.com/anne_travel_foodie/'
["Anoukshanice"]='https://www.instagram.com/anoukshanice/'
["Bakkriebels"]='https://www.instagram.com/bakkriebels/'
["Baksels van Danielle"]='https://www.instagram.com/bakselsvandanielle/'
["BBQ Junkie"]='https://www.instagram.com/bbqjunkienl/'
["Be a Fit mom"]='https://www.instagram.com/beafitmom.nl/'
["Beaufood"]='https://www.instagram.com/beaufood/'
["Bonapetit"]='https://www.instagram.com/bonapetit_food/'
["Bourgondisch keukentje"]='https://www.instagram.com/bourgondischkeukentje/'
["Breg Blogt"]='https://www.instagram.com/bregblogt/'
["Brigitte Lifestyle"]='https://www.instagram.com/brigitte_lifestyle/'
["By Andrea Janssen"]='https://www.instagram.com/byandreajanssen/'
["By Sin"]='https://www.instagram.com/foodbysin/'
["Charlotte Janssen"]='https://www.instagram.com/charlottejanssen94/  '
["Charlotte Janssen"]='https://www.instagram.com/charlottejanssen94/'
["Cookies and carrots"]='https://www.instagram.com/cookies_and_carrotsticks/'
["CookingQueens"]='https://www.instagram.com/cookingqueensnl/'
["Coole suggesties"]='https://www.instagram.com/coolesuggesties/'
["Coole suggesties"]='https://www.instagram.com/coolesuggesties/'
["Culi Sandra"]='https://www.instagram.com/culi_sandra/'
["Culinea"]='https://www.instagram.com/culinea.nl/'
["Culinessa"]='https://www.instagram.com/culinessa/'
["CuliPress België"]='https://www.instagram.com/CuliPress/'
["Daisy de Fretes"]='https://www.instagram.com/daisydefretes/'
["De keuken van Bianca"]='https://www.instagram.com/dekeukenvanbianca/'
["De Kokende Zussen"]='https://www.instagram.com/dekokendezussen/'
["De Zoetekauw"]='https://www.instagram.com/de.zoetekauw.nl/'
["Dens Dinner"]='https://www.instagram.com/denisegrootendorst/'
["Doortjes Keuken"]='https://www.instagram.com/doortjeskeuken/'
["Easy Culi"]='https://www.instagram.com/easyculi/'
["Eef Kookt Zo"]='https://www.instagram.com/eefkooktzo/'
["Eten met Danielle"]='https://www.instagram.com/etenmetdanielle/'
["Eten van Lientje (Jacquelien1971)"]='https://www.instagram.com/jacquelien1971/'
["Eviekookt "]='https://www.instagram.com/eviekookt/'
["Familie over de kook"]='https://www.instagram.com/familie.over.de.kook/'
["Fennas Healthy Food Specials"]='https://www.instagram.com/fennasfoodspecials/'
["Fit Food Joy"]='https://www.instagram.com/fit.food.joy/'
["Fit met Djam"]='https://www.instagram.com/fitmetdjam/'
["fitfood.dioon"]='https://www.instagram.com/fitfood.dioon/'
["Flying Foodie"]='https://www.instagram.com/flyingfoodie.nl/'
["Food Frobel Fun"]='https://www.instagram.com/sihamdaily'
["Food happiness en joy"]='https://www.instagram.com/foodhappinessenjoy/'
["Foodblog van Rachida"]='https://www.instagram.com/foodblogvanrachida/'
["Foodquotes"]='https://www.instagram.com/foodquotesnl/'
["Froodyz"]='https://www.instagram.com/freyaz_food/'
["Gereons keuken thuis"]='https://www.instagram.com/gereondeleeuw/'
["Gezellige Recepten"]='https://www.instagram.com/gezelligerecepten/'
["Gezonde Dutchies"]='https://www.instagram.com/gezonde_dutchies/'
["Glenn Eilbracht"]='https://www.instagram.com/glenn_eilbracht/'
["Goed Eten Gezond Leven"]='https://www.instagram.com/goedetengezondleven/'
["Good Mood Mama"]='https://www.instagram.com/goodmoodmama/'
["Healthyfoodie Manon"]='https://www.instagram.com/healthyfoodie_manon/'
["Home made heidy"]='https://www.instagram.com/homemadeheidy/'
["Ik Snoep Gezond"]='https://www.instagram.com/snoepgezond/'
["Inner Sparkle"]='https://www.instagram.com/innersparkle.be/'
["Jaimys Kitchen"]='https://www.instagram.com/Jaimyskitchen.nl/'
["Jenny Alvares"]='https://www.instagram.com/jennyalvares'
["Karin Pauw"]='https://www.instagram.com/karinpauw/?hl=nl'
["Kelly Caresse"]='https://www.instagram.com/kellycaresse/'
["Keuken atelier"]='https://www.instagram.com/keukenatelier/'
["Keukenmeid"]='https://www.instagram.com/keukenmeid/'
["Koken met liefde"]='https://www.instagram.com/koken_metliefde/'
["Kokkerellen met Suus"]='https://www.instagram.com/kokkerellenmetsuus/'
["Kris kookt"]='https://www.instagram.com/kriskookt.be/'
["Lactose vrij eten"]='https://www.instagram.com/lactosevrijeten/'
["Lekker eten met Marlon"]='https://www.instagram.com/lekkeretenmetmarlon/'
["Lindys lekkernijen"]='https://www.instagram.com/lindyslekkernijen/'
["Love to Cook Healthy"]='https://www.instagram.com/lovetocookhealthy/'
["Made from Scratch"]='https://www.instagram.com/madefromscratch.nl/'
["Makkelijk Zat"]='https://www.instagram.com/makkelijkzatnl/'
["Marielle in de Keuken"]='https://www.instagram.com/marielleindekeuken.nl/'
["Marilyn Amaterasu"]='https://www.instagram.com/marilyn_amaterasu/'
["Melissa schrijft"]='https://www.instagram.com/melissaschrijft/'
["Met Kort in de Keuken"]='https://www.instagram.com/metKortindekeuken.nl/'
["Miss Baksels"]='https://www.instagram.com/miss.bakselss/'
["Momklovesfood"]='https://www.instagram.com/momklovesfood/'
["Moon Loves Food"]='https://www.instagram.com/moon_loves_food/'
["My happy kitchen & lifestyle"]='https://www.instagram.com/myhappykitchennl/'
["Myfoodblog"]='https://www.instagram.com/myfoodblog_nl/'
["Nandas Keuken"]='https://www.instagram.com/nandaskeuken/'
["Ongewoon Lekker"]='https://www.instagram.com/ongewoonlekkerfooddrinksblog/'
["Over Eten Gesproken"]='https://www.instagram.com/overetengesproken.nl/'
["Patesserie"]='https://www.instagram.com/tessa_patesserie/'
["Pinkit"]='https://www.instagram.com/pinkitnl/'
["Priya Loves Food"]='https://www.instagram.com/priyalovesfood/'
["Pukster"]='https://www.instagram.com/pukster/'
["Riannes wereld"]='https://www.instagram.com/rianneswereld/'
["Rotterdam Food"]='https://www.instagram.com/rotterdam.food/'
["Rutger Bakt"]='https://www.instagram.com/rutgerbakt/'
["Sabrina Foodlicious"]='https://www.instagram.com/sabrinafoodlicious/?hl=nl'
["Safiatje83"]='https://www.instagram.com/safiatje83/'
["Samantas kitchen"]='https://www.instagram.com/samanthaskitchenn/'
["Samanthas kitchen"]='https://www.instagram.com/samanthaskitchenn/'
["Shana van Hoof"]='https://www.instagram.com/shanavanhoof/?hl=nl'
["Shyama Culinair & Lifestyle"]='https://www.instagram.com/shyamaculinair/'
["Slowfoody"]='https://www.instagram.com/slowfoody/'
["Smaakmakende"]='https://www.instagram.com/smaakmakende/'
["Smiekkookt"]='https://www.instagram.com/smiekkookt/'
["Smullen met Loes"]='https://www.instagram.com/smullenmetloes/?hl=nl'
["So Celebrate"]='https://www.instagram.com/socelebrate/'
["StudioKOOK.nl"]='https://www.instagram.com/studiokook.nl/'
["Studioslinger"]='https://www.instagram.com/studioslinger/'
["Sukis Kitchen"]='https://www.instagram.com/sukiskitchenn/'
["Superdushichef"]='https://www.instagram.com/superdushichef/'
["Sylvia Foodlover"]='https://www.instagram.com/sylvia_foodlover/'
["Taschas kitchen"]='https://www.instagram.com/taschaskitchen/?igshid=YmMyMTA2M2Y%3D'
["Thuisleven"]='https://www.instagram.com/thuisleven/'
["Uit de keuken van Sultan"]='https://www.instagram.com/uitdekeukenvansultan/'
["Veggie receptjes"]='https://www.instagram.com/veggiereceptjes/'
["Verantwoord snoepen"]='https://www.instagram.com/verantwoordsnoepen/'
["Vicky van Dijk"]='https://www.instagram.com/vickyvandijk/'
["Vickylicious"]='https://www.instagram.com/vickylicious_blog/'
["Vlaflip cakery"]='https://www.instagram.com/vlaflipcakery/?hl=nl'
["W3ndelicious"]='https://www.instagram.com/w3ndelicious/'
["Wat eet Elisa"]='https://www.instagram.com/wateetelisa/?utm_source=ig_embed'
["Wijnfluencer"]='https://www.instagram.com/wijn.fluencer/'
["Yaasmiinbeell"]='https://www.instagram.com/yaasmiinbeell/'
["Yvette Koedam"]='https://www.instagram.com/yvettekoedam/'
)
#Crear folder donde se ponga la información
if ! [ -d data ]
        then
                mkdir data
fi

if ! [ -d data/results ]
        then
                mkdir data/results
fi

B
clear

#Hacer una lista con los perfiles que tenemos. Comprobar que pasa uno por uno con un print como prueba

read -p "[*] Select the initial letter: " inicial

inicial=$(echo "$inicial" | tr '[:lower:]' '[:upper:]')

echo "Results that starts with $inicial"

for key in "${!profiles[@]}"; do
        if [[ $key == ${inicial}* ]]; then
                search=${profiles[$key]}
                #Extraer la información de los posts de donde vienen los perfiles

                echo "###################################"
                echo "Analyzing Information From: $search"
                echo "###################################"

                search_limpia=$(echo "$search" | sed -e 's#https://www.instagram.com/##')
                echo "key: $key"
                echo "value: $search_limpia"
                filename=$(echo "$key" | tr ' ' '_')
                wget --wait=40 --limit-rate=40k -U Mozilla -bq https://www.picnob.com/profile/$search_limpia/ -O data/results/Ig-$filename.txt > /dev/null
                sleep 6
                #while read -r linea; do

                #*declare -i text_count
                #*declare -i time_counter

                while read -r linea; do
#Segunda parte
#Verificar si el texto coincide con alguna de las de los #'s de alguna empresa
                        #echo "$linea"
                        ##text=$(echo "$linea" |  grep "sum*" | grep -v "^<a class=" | sed 's/<div class="sum">//g' | sed 's/<a href[^>]*>//g' | sed 's/<\/a>//g' | sed 's/<img[^>]*>//g' | sed 's/<div[^>]*>//g' | sed 's/<\/div[^>]*>//g' | sed 's/<button[^>]*>//g' | sed 's/<span[^>]*>//g' | sed 's/<\/span[^>]*>//g' | sed 's/<\/button[^>]*>//g' | head -n -2 | tail -n +3 )
                        ##date=$(echo "$linea" | grep "txt" | sed 's/<span[^>]*>//g' | sed 's/<\/span>//g' | head -n -3 | tail -n +7 )
                        echo "$linea"
                        if [[ $linea == *"@alphenaer" || $linea == *"#alphenaer" || $linea == *"alphenaerminibrie" || $linea == *"geitenbrie" ]]; then
echo "$linea" >> alphenaer.csv
                        elif [[ $linea == *"@servero.nl" || $linea == *"#servero" || $linea == *"natuurlijkdelekkerste" || $linea == *"tussendoortje" ]]; then
                                echo "$linea" >> servero.csv
                        elif [[ $linea == *"@oldamsterdam.nl" || $linea == *"#oldamsterdam" || $linea == *"kaas" || $linea == *"borrel" ]]; then
                                echo "$linea" >> old_amsterdam.csv
                        elif [[ $linea == *"@lillet" || $linea == *"#cocktails" || $linea == *"apero" || $linea == *"lillet" ]]; then
                                echo "$linea" >> lillet.csv
                        elif [[ $linea == *"@Good4Unutrition" || $linea == *"#breakfastboost" || $linea == *"milledseed" || $linea == *"immuneboost" || $linea == *"superseed" || $linea == *"saladtopper" || $linea == *"feelthebenefit" ]]; then
                                echo "$linea" >> good4U.csv
                        elif [[ $linea == *"@kuehne" || $linea == *"#mosterd" || $linea == *"dutchfoodie" || $linea == *"kookinspiratie" ]]; then
                                echo "$linea" >> kuhne.csv
                        elif [[ $linea == *"@princes.nl" || $linea == *"#plantaardigetonijin" || $linea == *"verruimjeblik" || $linea == *"plantaardiglekker" ]]; then
                                echo "$linea" >> princes.csv
                        elif [[ $linea == *"@yildriz" || $linea == *"#yildriz" || $linea == *"allioli" || $linea == *"wereldsauzen" || $linea == *"tzatziki" ]]; then
                                echo "$linea" >> yildriz.csv
                        elif [[ $linea == *"@Depindakaaswinkel" || $linea == *"#pindakaas" || $linea == *"pindabaas" || $linea == *"depindakaaswinkel" ]]; then
                                echo "$linea" >> pindakaaswinkel.csv
                        elif [[ $linea == *"@verstegennl" || $linea == *"#verstegenfriends" || $linea == *"hetalternatiefvoorzout" || $linea == *"goudishetnieuwezout" ]]; then
                                echo "$linea" >> verstegen.csv
                        elif [[ $linea == *"@Ceders" || $linea == *"#zeroalcohol" || $linea == *"cedersdrinks" || $linea == *"LiveFreeSpirit" ]]; then
                                echo "$linea" >> ceder.csv
                        fi
                        ##echo "$text"
                        ##echo "$date"


                        #*if [[ $linea =~ 'class="sum"' ]]; then
                        #*      text_count+=1

                        #*      if ((text_count < 3)); then
                        #*              continue
                        #*      elif ((text_count > 2)); then
                        #*              text=$(echo "$linea" | grep -oP '(?<=<div class="sum">).*' )
                        #*              if ((text_count == 3)); then
                        #*                      text_content="$text"
                        #*              else
                        #*                      text_content="$text_content\n$text"
                        #*              fi
                        #*      fi
                        #*elif [[ $linea =~ 'class="txt"' ]]; then
                        #*      time_counter+=1

                        #*      if ((time_counter < 7)); then
                        #*              continue
                        #*      elif ((time_counter > 6)); then
                        #*              time=$(echo "$linea" | grep -oP '(?<=<span class="txt">).*')
                        #*      fi
                        #*
                done < data/results/Ig-$filename.txt | grep "sum*" | grep -v "^<a class=" | sed 's/<div class="sum">//g' | sed 's/<a href[^>]*>//g' | sed 's/<\/a>//g' | sed 's/<img[^>]*>//g' | sed 's/<div[^>]*>//g' | sed 's/<\/div[^>]*>//g' | sed 's/<button[^>]*>//g' | sed 's/<span[^>]*>//g' | sed 's/<\/span[^>]*>//g' | sed 's/<\/button[^>]*>//g' | head -n -2 | tail -n +3 > output.csv
                #*echo -e "$text_content"
                #*echo "$time"
        fi
done
