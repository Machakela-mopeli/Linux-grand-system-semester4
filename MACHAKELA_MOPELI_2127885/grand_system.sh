#!/bin/bash
clear
## register menu
register(){
 
echo "WELCOME TO HOME AFFAIRS MENU"
echo ""
echo "1. TO REGISTER A CITIZEN"
echo "2. TO SEARCH FOR A CITIZEN "
read answer

case $answer in
1) bash birth_citizen_registration.sh
;;

2)echo "who are you eager to search?: "
read object
cat birth_info.sh | grep -i "$object"
;;

*)
echo "you have inserted a wrong option"
echo ""

read -p "to try to decide what to do again press 1 and 2 to exit" option
case $option in 
1) register
;;
2)
bash grand_system.sh
;;
*)
echo "you have inserted none of the pre-mentioned options, program has been terminated"
break
;;
esac
;;
esac
}

################################################################################################
#death details function
 death(){
echo "WELCOME TO HOME AFFAIRS MENU"
echo ""
read -p "TO REGISTER A DECEASED CITIZEN PRESS 1 AND 2 TO SEARCH FOR A DECEASED: " option

case $option in
1)
read -p "ENTER AN ID NUMBER OF A DECEASED TO REGISTER THEM TO DEATH SYSTEM: " id
echo ""
read -p "ENTER THE CAUSE OF DEATH e,g natural,gun accident,car accident, and lightening: " cause
echo ""
read -p "ENTER THE PLACE OF DEATH: " placeod
echo ""
read -p "ENTER THE DATE OF DEATH AS YYYY-MM-DD: " dod
echo  ""
grep "$id" birth_info.sh | cut -d ' ' -f 1-6 >> death_info.sh
sed -i "/$id/d" birth_info.sh
sed -i "/$id/d"  grant_recievers.txt
echo "$cause,$dod,$placeod" >> death_info.sh

;;
2)
read -p "TO SEARCH WITH ID PRESS 1 & 2 TO SEARCH WITH DATE OF DEATH AND CAUSE OF DEATH: " search

echo ""
case $search in
1) read -p  "ENTER ID OF DECEASED: " object
echo ""
grep -i -A 1 "$object" <  death_info.sh 
;;
2) read -p " ENTER EITHER A DATE OF DEATH OR THE CAUSE OF DEATH TO SEARCH: " death
echo ""
grep -i -B 1 "$death" < death_info.sh
;;
*)echo "an invalid option has been inserted, a program has been terminated"
 ;;
esac
;;
*)
echo "you have inserted a wrong option"
echo ""
read -p "to try to decide what to do again press 1 and 2 to exit" option
case $option in 
1)
death
;;
2)
bash grand_system.sh
;;
*)
echo "you have inserted none of the pre-mentioned optiops, program has been terminated"
;;
esac
;;
esac
}

############################################################################################
#This marks the begining of the dashboard

echo "|***************************************WELCOME TO GRAND SYSTEM PORTAL********************************************|"
echo "|                                                                                                                 |"
echo "|CHOOSE A MENU YOU ARE EAGER TO INTERACT WITH                                                                     |"
echo "|                                                                                                                 |"
echo "|_________________________________________________________________________________________________________________|" 
echo "| PRESS 1 FOR CITIZEN REGISTRATION MENU                                                                           |"
echo "| PRESS 2 FOR DEATH SYSTEM MENU                                                                                   |"
echo "| PRESS 3 FOR GRANDS MENU                                                                                         |"
echo "| PRESS 4 TO QUIT GRAND SYSTEM PORTAL                                                                             |"
echo "|                                                                                                                 |"
echo "| ENTER OPTION                                                                                                    |" 
read option
echo "|_________________________________________________________________________________________________________________|"
case $option in
1) register
;;
2) death
;;
3)
clear
echo "|*********************************************WELCOME TO GRANDS MENU*********************************************|"
echo "|                                                                                                                |" 
echo "| TO DISPLAY THE PEOPLE WHO QUALIFIES FOR GRANDS PRESS 1                                                         |"
echo "| FOR GRAND DISTRIBUTION PRESS 2                                                                                 |"
echo "| DISPLAY UNPAID CITIZENS 3                                                                                      |"
echo "| DISPLAY PAID CITIZENS 4                                                                                        |"
echo "|________________________________________________________________________________________________________________|"
read -p " ENTER OPTION" opt
case $opt in 
1)cat grant_recievers.txt 
;;
2) bash give_grand.sh
;;
3)echo "GRAND IS M1500.00 p/m"
cat grant_missed.txt;;

4)
cat grant_recieved.txt;;
*)
echo "INVALID OPTION HAS BEEN INSERTED, A PROGRAM HAS BEEN TERMINATED";;
esac
;;
4) exit
;;
*)
echo "you have inserted and invalid option"
;;
esac

read -p "press 1 to re open the menu and 2 to exit:" ans

case $ans in 
1) bash grand_system.sh
;;
2) exit
;;
*) echo "program has been terminated"
;;
esac
