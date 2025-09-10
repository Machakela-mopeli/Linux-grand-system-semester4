#!/bin/bash
clear
echo "|***********************************************************************************************|"
echo "|_____________________________ WELCOME TO HOME AFFAIRS PORTAL___________________________________|"
echo "|                                                                                               |"
echo "|_______________________________________________________________________________________________|"
read -p "how many people are you eager to add to the system?: " option
for((n=0;n < $option;n++))
do
echo ""

read -p  "ENTER PERSON ID: " id
echo ""


read -p "ENTER PERSONS FIRST NAME:" fname 

echo ""
read -p  "ENTER PERSONS LAST NAME: " lname  

echo ""

read -p  "ENTER PERSONS RESIDENTIAL PLACE: " res

echo ""

read -p  "ENTER DATE OF BIRTH IN YYYY-MM-DD FORMAT: " dob
echo ""
read -p  "ENTER PERSON'S DISTRICT: " dis
echo ""
echo "$id $fname $lname $res $dob $dis" >> birth_info.sh

#get today's date
today=$(date +%Y)

#convert user input to years
second_d=$(date -d "$dob" +%Y)

#difference of years
diff_of_dates=$(($today - $second_d))

if(($diff_of_dates >= 70))
then
echo "$id $fname $lname $res $dob" >> grant_recievers.txt
else
echo "citizen is not going to get grant"
fi
done
