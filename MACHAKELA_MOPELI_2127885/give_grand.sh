#!/bin/bash

coun=$(wc -l < grant_recievers.txt)

for((i=1;i <= $coun; i++))
do

read -p "IS THERE ANYONE TO COLLECTING? yes or no?: " opt

case $opt in
"yes")
echo ""
read -p "ENTER THEIR ID" id
record=$(cat grant_recievers.txt | head -n $i >> grant_recieved.txt)
echo "$record  $id" >> grant_recieved.txt
;;
"no") 
cat grant_recievers.txt | head -n $i >> grant_missed.txt
;;
*)
echo "you have inserted a wrong option"
;;
esac

done

