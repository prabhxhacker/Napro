
#!bin/bash/

figlet "prabhxhacker" | lolcat -f |  boxes -d unicornthink 

sleep 2


echo "**************INSTALLING PAKEGES*****************" 
sleep 3
echo "installing nmap" 
sudo apt install nmap  &> /dev/null 
sleep 2
echo "installing boxes"
sudo apt install boxes &> /dev/null
sleep 2
echo "**************SCANING IP*****************"  
sleep 2 

ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3 | uniq > lol.txt
main=$(cat lol.txt)

echo "scanning only for working ips under 1 to 245 times "

file="log.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi


for ips in {1..245}
do 
       ping -c 1 $main.$ips | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> log.txt &  

 
done 

loop=$(cat log.txt)


clear 

echo "************** now scaning top ports *************** "
sudo nmap -sS --top-ports 20  -iL log.txt 
 
sleep 2 

boxes log.txt 

sleep 1
echo '******************* Select Ip ******************'

echo ' - - - - - - -'
echo "type full ip "
echo '- - - - - - -'


sleep 5 


echo ' - - - - - - -'
read -p "| Select IP  : " target 
echo '- - - - - - - '

sleep 2 

echo '********************* Select port from top port ***********************'
sleep 1 
echo '   - - - - - - -'
read -p '| select port :' port 
echo '    - - - - - - '

boxes main.txt 
sleep 2

read -p "select number :" answer 

# if flag start 


#1

if [ $answer = 1 ]
then 
  sudo nmap -sT $port $target 

fi 

#2

if [ $answer = 2 ]
then 
  sudo nmap -Pn --script vuln $port $target 

fi 
#3

if [ $answer = 3 ]
then 
  sudo nmap -S  $port $target 

fi 

#4 

if [ $answer = 4 ]
then 
  sudo nmap -PA $port $target 

fi 

#5 

if [ $answer = 5 ]
then 
  sudo nmap -PS $port $target 

fi 

#6

if [ $answer = 6 ]
then 
  sudo nmap -PU $port $target 

fi 

#7 

if [ $answer = 7 ]
then 
  sudo nmap -PE $port $target 

fi 

#8 

if [ $answer = 8 ]
then 
  sudo nmap -PO $port $target 

fi 

#9

if [ $answer = 9 ]
then 
  sudo nmap -PP $port $target 

fi 

#10

if [ $answer = 10 ]
then 
  sudo nmap -PM $port $target 

fi 

#11

if [ $answer = 11 ]
then 
  sudo nmap -sY $port $target 

fi 

#12

if [ $answer = 12 ]
then 
  sudo nmap --script http-headers $port $target 

fi 


#13

if [ $answer = 13 ]
then 
  sudo nmap -A  $port $target 

fi 

#14 

if [ $answer = 14 ]
then 
  sudo nmap -sX  $port $target 

fi 

#15

if [ $answer = 15 ]
then 
  sudo nmap -sO  $port $target 

fi 

#16 

if [ $answer = 16 ]
then 
  sudo nmap -O  $port $target 

fi 

#17

if [ $answer = 17 ]
then 
  sudo nmap -sF  $port $target 

fi 
read -p "||>>>>>>>>>>>>>>||Do you want to see our instagram pages||<<<<<<<<<<<<<|| (y/n)"  yn  

case $yn in 
        y ) open page.html;;
        n ) echo "Thanks to u for using this tool!!!!" | boxes -d ian_jones; 
                   exit;;          
        * ) echo "Thanks to u for using this tool!!!!" | boxes -d ian_jones;
                   exit 1 ;; 
esac

echo "Thanks to u for using this tool!!!!" | boxes -d ian_jones

exit


