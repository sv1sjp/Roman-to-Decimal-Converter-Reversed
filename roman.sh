#!/bin/bash
#Συνάρτηση οπού μετατρέπει έναν δεκαδικό αριθμό σε Ρωμαϊκο
normal(){
clear
echo " Your number is:  "
echo
    while [ $inter -ne 0 ]
    do
            if [ $inter -ge 1000 ]
                then   echo -n "M"
                     inter=$((inter-1000))
            elif [ $inter -ge 900 ]
                then   echo -n "CM"
                      inter=$((inter-900))
            elif [ $inter -ge 500 ]
                then   echo -n "D"
                      inter=$((inter-500))
                            
             elif [ $inter -ge 400 ]
                then   echo -n "CD"
                      inter=$((inter-400))           
             
            elif [ $inter -ge 100 ]
                then   echo -n "C"
                        inter=$((inter-100))
            elif [ $inter -ge 90 ]
                then   echo -n "XC"
                        inter=$((inter-90))           
            elif [ $inter -ge 50 ]
                then   echo -n "L"
                        inter=$((inter-50))      
             elif [ $inter -ge 40 ]
                then   echo -n "XL"
                        inter=$((inter-40))              
               elif [ $inter -ge 10 ]
                then   echo -n "X"
                        inter=$((inter-10))        
              elif [ $inter -ge 9 ]
                then   echo -n "IX"
                        inter=$((inter-9))
                       elif [ $inter -ge 5 ]
                then   echo -n "V"
                        inter=$((inter-5))
               elif [ $inter -ge 4 ]
                then   echo -n "IV"
                        inter=$((inter-4))
                elif [ $inter -ge 1 ]
                    then 
                            if [ $inter -eq 3 ]
                                then echo -n "III"
                                    break
                            elif [ $inter -eq 2 ]
                                then echo -n "II"
                                    break
                            elif [ $inter -eq 1 ]
                                then echo -n "I "
                                    break
                             fi
            fi            
    done
    echo  
    echo
    
   
}
#Συνάρτηση οπού μετατρέπει έναν Ρωμαϊκό αριθμό σε δεκαδικό
romantodec(){
clear
echo " Your number is:  "
echo
echo "$inter" > "temp.txt"
#Mετατροπές από μεγαλύτερο χαρακτήρα σε μικρότερο με στόχο να γίνουν όλα Ι
sed -i "s/CM/DCD/g" temp.txt
sed -i "s/M/DD/g" temp.txt
sed -i "s/CD/CCCC/g" temp.txt
sed -i "s/D/CCCCC/g" temp.txt
sed -i "s/XC/LXL/g" temp.txt
sed -i "s/C/LL/g" temp.txt
sed -i "s/XL/XXXX/g" temp.txt
sed -i "s/L/XXXXX/g" temp.txt
sed -i "s/IX/VIV/g" temp.txt
sed -i "s/X/VV/g" temp.txt
sed -i "s/IV/IIII/g" temp.txt
sed -i "s/V/IIIII/g" temp.txt
inter=$(<temp.txt)
echo "$inter"
#Καταμέτρηση των Ι ώστε να βρεθεί ο αριθμός που έδωσε ο χρήστης ,σε δεκαδικό
grep I -o temp.txt | wc -l
echo "$inter"
}

#Μain Part του script με στόχο να γίνει έλεγχος αν τα δεδομένα του χρήστη είναι αριθμός δεκαδικός ή Ρωμαϊκος!
echo "Decimal Number to Roman & Reversed , Created By DimitrisV SV1SJP "
read -p "Give me a decimal number from 1 ro 3999 or a Roman Number:" inter
if [ $inter -ge 0 ] || [ $inter -le 0 ]
    then 
        if [ $inter -le 0 ] || [ $inter -ge 4000 ]
        then echo "Invalid number"
        elif [ $inter -gt 0 ]
        then normal
        fi
else romantodec
fi
read -p "Press Enter to  exit" z
