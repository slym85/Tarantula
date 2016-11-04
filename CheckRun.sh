#!/bin/bash
 ### Cleaning up 
 ### This is version 2.3.1 SLOW CPU optimized + MultiMobo
 ### Version updated 18.07.2016
 ### Added Commission account fetcher and variable 
 ### Added motherboard PCIe layout fetch from make/model
 ### Version updated 12.08.2016
  PASST2=0
  
  
  
  
  
  ### This is a good failsafe if I started this in a fucked up way ... 
for pid in `cat /home/bash/PIDFILE  | awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done


for pid in `cat /home/bash/PIDFILEPrototype  | awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done
  
  
echo " $$ | CHECKPROTOTYPE " >> /home/bash/PIDFILE
 unset PROMPT_COMMAND
NOHDCHECK=0
sleep 5
WALLET=$(cat /home/bash/ZECWALLET | sed '/^$/d;s/[[:blank:]]//g' )
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.A.sh
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.B.sh
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.C.sh
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.D.sh
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.E.sh
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.F.sh

cd /home/bash
rm /home/bash/typescriptA
rm /home/bash/typescriptC
rm /home/bash/typescriptB
rm /home/bash/typescriptD
rm /home/bash/typescriptE
rm /home/bash/typescriptF
rm TERM_4FLAG
rm TERM_5FLAG
rm TERM_FINALFLAG
rm TERM_1FLAG
rm TERM_2FLAG
rm TERM_3FLAG



if [ -f ComsionstatusT1 ] ; then 
rm ComsionstatusT1
fi

if [ -f ComsionstatusT2 ] ; then 
rm ComsionstatusT2
fi




if [ -f COMTIME1 ] ; then 
rm COMTIME1 ###  is removed at boot also if anything )
fi


if [ -f COMTIME2 ] ; then 
rm COMTIME2 ###  is removed at boot also if anything  
fi


rm /home/bash/TERM_FINAL.sh
rm /home/bash/TERM_1.sh
rm /home/bash/TERM_2.sh
rm /home/bash/TERM_3.sh
rm /home/bash/TERM_4.sh
rm /home/bash/TERM_5.sh
rm /home/bash/TERM_FINALCOM.sh
rm /home/bash/TERM_1COM.sh
rm /home/bash/TERM_2COM.sh
rm /home/bash/TERM_3COM.sh
rm /home/bash/TERM_4COM.sh
rm /home/bash/TERM_5COM.sh
 ### Cleaning done

 
 
 COMMTIME=550  ### Debuggingn - not realy needed 
 
#################  START MINER FLAGS  #########################
#Enter flags here , this mod will check them and act acordinglly

# WORK IN PROGRESS 




########## SLOT 2 GPU 1 WORKER A #############

CLOCKA=$(cat /home/bash/Commit | grep CLOCK_A| sed 's/CLOCK_A.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKA=$(cat /home/bash/Commit | grep MEM_A | sed 's/MEM_A.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


########## SLOT 1 GPU 0 WORKER F ############# 

CLOCKF=$(cat /home/bash/Commit | grep CLOCK_F| sed 's/CLOCK_F.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKF=$(cat /home/bash/Commit | grep MEM_F | sed 's/MEM_F.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


########## SLOT 3 GPU 2 WORKER B ############# 

CLOCKB=$(cat /home/bash/Commit | grep CLOCK_B| sed 's/CLOCK_B.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKB=$(cat /home/bash/Commit | grep MEM_B | sed 's/MEM_B.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


########## SLOT 4 GPU3 WORKER C ############# 

CLOCKC=$(cat /home/bash/Commit | grep CLOCK_C| sed 's/CLOCK_C.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKC=$(cat /home/bash/Commit | grep MEM_C | sed 's/MEM_C.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


########## SLOT 5 GPU 4 WORKER D ############# 

CLOCKD=$(cat /home/bash/Commit | grep CLOCK_D| sed 's/CLOCK_D.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKD=$(cat /home/bash/Commit | grep MEM_D | sed 's/MEM_D.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


########## SLOT 6 GPU 5 WORKER E ############# 

CLOCKE=$(cat /home/bash/Commit | grep CLOCK_E| sed 's/CLOCK_E.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKE=$(cat /home/bash/Commit | grep MEM_E | sed 's/MEM_E.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')


PORT=$(cat /home/bash/CommitPort | grep PORT | sed 's/PORT.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
ZECWALLET=$(cat Commit | grep ZECWALLET | sed 's/ZECWALLET.//' | sed '/^$/d;s/[[:blank:]]//g')
DPORT=$(cat /home/bash/CommitPort | grep DORTCOM | sed 's/DORTCOM.//'| grep -v "#"| grep -o -E '[0-9..]+'| sed '/^$/d;s/[[:blank:]]//g')
IP=$(cat /home/bash/CommitPort | grep TARANTULAIP | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}"  | grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
DIP=$(cat /home/bash/CommitPort | grep TARANTULADONIP | grep -v "#" | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" | sed '/^$/d;s/[[:blank:]]//g')
#DIP=194.0.129.85 ### Debug standard IP for Commisioning
 ### Need to fetch the donnation account name 
DONACC=$( cat CommitPort  | grep DONATIONACCOUNT |  sed 's/DONATIONACCOUNT=//'   | grep -v "#" | sed '/^$/d;s/[[:blank:]]//g') ### I am allowed to actually commision/donate ? 


 ### DEBUG
 #PORT=8334

RIGNAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
configured=1
if [ $configured = 0 ] ; then
/bin/echo -e "\e[1;31m  YOU HAVE NOT CONFIGURED THE SCRIPT , ABORTING   \e[0m" ### RED ! 
sleep 999 
exit 1
fi 

#
 ### This script is intended to give good amount of info and FIZICAL location of the GPU's

 
 ########################################################################################################################################
 
 ### UPDATE : I need to "read" the motherboard make so I will decide how to asign PCIe Ports...
 
 H97ANNIVERSARY=$( cat /sys/devices/virtual/dmi/id/board_{vendor,name,version} | grep H97 | grep Anniversary | wc -l)
 H81ProBTC=$( cat /sys/devices/virtual/dmi/id/board_{vendor,name,version} | grep H81 | grep Pro | grep BTC | wc -l)
 H81MG=$(cat /sys/devices/virtual/dmi/id/board_{vendor,name,version} | grep H81M | wc -l )
 
 if [ $H81ProBTC = 1 ] ; then 
 
PCI0=$(lspci -v | grep VGA -A 1 | grep 02 -A 1  | grep AMD | wc -l ) #A this is the first on the left GPU aka GPU1
PCI1=$(lspci -v | grep VGA -A 1 | grep 01 -A 1  | grep AMD | wc -l ) #F This is the MAIN GPU aka GPU0 .. the one that is on the PCIe 16x slot 
PCI2=$(lspci -v | grep VGA -A 1 | grep 03 -A 1  | grep AMD | wc -l ) #B This is the 2nd GPU aka GPU2 
PCI3=$(lspci -v | grep VGA -A 1 | grep 04 -A 1  | grep AMD | wc -l ) #C this is 3rd
PCI4=$(lspci -v | grep VGA -A 1 | grep 05 -A 1  | grep AMD | wc -l ) #D this is 4th
PCI5=$(lspci -v | grep VGA -A 1 | grep 06 -A 1  | grep AMD | wc -l ) #E this is this is the GPU on the far right aka GPU5 

fi


 if [ $H81MG = 1 ] ; then 
 
PCI0=$(lspci -v | grep VGA -A 1 | grep 02 -A 1  | grep AMD | wc -l ) #A this is the first on the left GPU aka GPU1
PCI1=$(lspci -v | grep VGA -A 1 | grep 01 -A 1  | grep AMD | wc -l ) #F This is the MAIN GPU aka GPU0 .. the one that is on the PCIe 16x slot 
PCI2=$(lspci -v | grep VGA -A 1 | grep 03 -A 1  | grep AMD | wc -l ) #B This is the 2nd GPU aka GPU2 
PCI3=$(lspci -v | grep VGA -A 1 | grep 04 -A 1  | grep AMD | wc -l ) #C this is 3rd
PCI4=$(lspci -v | grep VGA -A 1 | grep 05 -A 1  | grep AMD | wc -l ) #D this is 4th
PCI5=$(lspci -v | grep VGA -A 1 | grep 06 -A 1  | grep AMD | wc -l ) #E this is this is the GPU on the far right aka GPU5 

fi 



 if [ $H97ANNIVERSARY = 1 ] ; then 
 
PCI0=$(lspci -v | grep VGA -A 1 | grep 01 -A 1  | grep AMD | wc -l ) #A this is the first on the left GPU aka GPU1
PCI1=$(lspci -v | grep VGA -A 1 | grep 03 -A 1  | grep AMD | wc -l ) #F This is the MAIN GPU aka GPU0 .. the one that is on the PCIe 16x slot 
PCI2=$(lspci -v | grep VGA -A 1 | grep 04 -A 1  | grep AMD | wc -l ) #B This is the 2nd GPU aka GPU2 
PCI3=$(lspci -v | grep VGA -A 1 | grep 05 -A 1  | grep AMD | wc -l ) #C this is 3rd
PCI4=$(lspci -v | grep VGA -A 1 | grep 06 -A 1  | grep AMD | wc -l ) #D this is 4th
PCI5=$(lspci -v | grep VGA -A 1 | grep 07 -A 1  | grep AMD | wc -l ) #E this is this is the GPU on the far right aka GPU5 

 else ### This is an escape ... need to work on all Motherboards 

PCI0=$(lspci -v | grep VGA -A 1 | grep 02 -A 1  | grep AMD | wc -l ) #A this is the first on the left GPU aka GPU1
PCI1=$(lspci -v | grep VGA -A 1 | grep 01 -A 1  | grep AMD | wc -l ) #F This is the MAIN GPU aka GPU0 .. the one that is on the PCIe 16x slot 
PCI2=$(lspci -v | grep VGA -A 1 | grep 03 -A 1  | grep AMD | wc -l ) #B This is the 2nd GPU aka GPU2 
PCI3=$(lspci -v | grep VGA -A 1 | grep 04 -A 1  | grep AMD | wc -l ) #C this is 3rd
PCI4=$(lspci -v | grep VGA -A 1 | grep 05 -A 1  | grep AMD | wc -l ) #D this is 4th
PCI5=$(lspci -v | grep VGA -A 1 | grep 06 -A 1  | grep AMD | wc -l ) #E this is this is the GPU on the far right aka GPU5 

fi





# Ok , what we want : We want to protect our selfs from missbehaving PCIe slots VS ethminer's ( cgminer )  way to see the GPU's
# i.e. = if I remove GPU2 from slot 2 ethminer will think it is actualy the next GPU - GPU3 that has to start AS and WITH GPU2's settings 
# a Freakin nightmear... so let's fix it 

###################################################################################################################################

COINMINEETH=0
COINMINEETH=$(cat /home/bash/CommitPort | grep COINMINEETH |  grep -o -E '[0-9..]+')


DWARFPOOLETH=0
DWARFPOOLETH=$(cat /home/bash/CommitPort | grep DWARFPOOLETH |  grep -o -E '[0-9..]+')


DWARFPOOLEXP=0
DWARFPOOLEXP=$(cat /home/bash/CommitPort | grep DWARFPOOLEXP |  grep -o -E '[0-9..]+')


SHIFTPOOL=0
SHIFTPOOL=$(cat /home/bash/CommitPort | grep SHIFTPOOL |  grep -o -E '[0-9..]+')



COINMINDONETH=0
COINMINDONETH=$(cat /home/bash/CommitPort | grep COINMINDONETH |  grep -o -E '[0-9..]+')


DWARFDONPOOLETH=0
DWARFDONPOOLETH=$(cat /home/bash/CommitPort | grep DWARFDONPOOLETH |  grep -o -E '[0-9..]+')


DWARFDONPOOLEXP=0
DWARFDONPOOLEXP=$(cat /home/bash/CommitPort | grep DWARFDONPOOLEXP |  grep -o -E '[0-9..]+')


SHIFTDONPOOL=0
SHIFTDONPOOL=$(cat /home/bash/CommitPort | grep SHIFTDONPOOL |  grep -o -E '[0-9..]+')






echo " Checking hardware status and position and creating mining scripts " 

#sleep 1

RUNSLOOP=6
 ### Prototype autoswitcher loop 
 ### Start vars 
 OPCL=0
 A=0
 B=0
 C=0
 D=0
 E=0
 F=0
 Z=$(echo ' " ')
 ### END 
 
 
 until [  $RUNSLOOP = 0 ]; do




if [ $RUNSLOOP = 1 ] ; then 
PCIM=$PCI1 ; RNAME=$(echo " $RIGNAME F " | awk '{print $1 $2}') ; WORKERPRINT=$(echo F) ; SLOT=$(echo SLOT 1) ; TYPESCRIPT=typescriptF ; COMPUTE=$(echo '') ; DONCOMPUTE=$(echo '')
OPCL=-1 ## Special case .. WE NEED TO HAVE OGD @ 0 so we "hack " this a bit here since we do not need it anyways after this 
fi


if [ $RUNSLOOP = 2 ] ; then 
PCIM=$PCI5 ; RNAME=$(echo " $RIGNAME E " | awk '{print $1 $2}') ; WORKERPRINT=$(echo E) ; SLOT=$(echo SLOT 5) ; TYPESCRIPT=typescriptE ; COMPUTE=$(echo '--no-precompute') ; DONCOMPUTE=$(echo '--no-precompute')
fi


if [ $RUNSLOOP = 3 ] ; then 
PCIM=$PCI4 ; SRNAME=$(echo " $RIGNAME D " | awk '{print $1 $2}') ; WORKERPRINT=$(echo D) ; SLOT=$(echo SLOT 4) ; TYPESCRIPT=typescriptD ; COMPUTE=$(echo '--no-precompute') ; DONCOMPUTE=$(echo '--no-precompute')
fi


if [ $RUNSLOOP = 4 ] ; then
PCIM=$PCI3 ; RNAME=$(echo " $RIGNAME C " | awk '{print $1 $2}') ; WORKERPRINT=$(echo C) ; SLOT=$(echo SLOT 3) ; TYPESCRIPT=typescriptC ; COMPUTE=$(echo '--no-precompute') ; DONCOMPUTE=$(echo '--no-precompute')
fi


if [ $RUNSLOOP = 5 ] ; then 
PCIM=$PCI2 ; RNAME=$(echo " $RIGNAME B " | awk '{print $1 $2}') ; WORKERPRINT=$(echo B) ; SLOT=$(echo SLOT 2 ) ; TYPESCRIPT=typescriptB ; COMPUTE=$(echo '--no-precompute') ; DONCOMPUTE=$(echo '--no-precompute')
fi


if [ $RUNSLOOP = 6 ] ; then 
PCIM=$PCI0 ; RNAME=$(echo " $RIGNAME A " | awk '{print $1 $2}') ; WORKERPRINT=$(echo A) ; SLOT=$(echo SLOT 0) ; TYPESCRIPT=typescriptA ; COMPUTE=$(echo '--no-precompute') ; DONCOMPUTE=$(echo '')
fi

 ### Building the Strings 
 ### here we will make the selection for IP , Proxy , coin , name and commisioning
 

if [ $PCIM -gt 0 ] ; then 
let OPCL+=1 ### Substracting the OpenCL device number for freakin' ATI drivers AND using it to alocate every single GPU afterwards 
/bin/echo -e "\e[1;32m     $SLOT  installed - Worker $WORKERPRINT will be OpenClDevice $OPCL \e[0m"  ## GREEN
OGD=$(echo $OPCL)
#RNAME=$(echo " $RIGNAME A " | awk '{print $1 $2}')





if [ $COINMINEETH = 0 ] ; then sleep 0.001
else
echo " www2.Coinmine.pl will be used as pool for ETH mining"
COINMINEPORT=$(cat CommitPort | grep COINMINEPORT |  grep -o -E '[0-9..]+')
RIGNAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
RNAME=$(echo " $RIGNAME $WORKERPRINT " | awk '{print $1 $2}')
START=$(echo script /home/bash/$TYPESCRIPT -c $Z ethminer --farm-recheck 300 -G  -F http://$IP:$COINMINEPORT/$RNAME:xxxx --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
USER=1
 /bin/echo -e "\e[1;36mETH\e[0m" > mining
fi


if [ $DWARFPOOLETH =  0 ] ; then sleep 0.001
else
echo " www.dwarfpool.com will be used as pool for ETH mining"
DWARFETHPORT=$(cat CommitPort | grep DWARFETHPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME1=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
START=$(echo script /home/bash/$TYPESCRIPT -c $Z ethminer --farm-recheck 300 -G  -F http://$IP:$DWARFETHPORT/$RNAME1 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
USER=1
 /bin/echo -e "\e[1;36mETH\e[0m" > mining
fi


if [ $DWARFPOOLEXP =  0 ] ; then sleep 0.001
else
echo " www.dwarfpool.com will be used as pool to EXP mining"
DWARFEXPPORT=$(cat CommitPort | grep DWARFEXPPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME2=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
START=$(echo script /home/bash/$TYPESCRIPT -c $Z ethminer --farm-recheck 300 -G  -F http://$IP:$DWARFEXPPORT/$RNAME2 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
USER=2
/bin/echo -e "\e[6;33mEXP\e[0m"  > mining
fi


if [ $SHIFTPOOL =  0 ] ; then sleep 0.001
else
echo " www.shf.miners.net aka SHIFTpool will be used as pool to mine SHIFT"
SHIFTPORT=$(cat CommitPort | grep SHIFTPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME3=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
START=$(echo script /home/bash/$TYPESCRIPT -c $Z ethminer --farm-recheck 300 -G  -F http://$IP:$SHIFTPORT/$RNAME3 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
USER=3
/bin/echo -e "\e[5;31mSHT\e[0m" > mining
fi

###################################################### FOR COMMISIONING #############################################################

if [ $COINMINDONETH =  0 ] ; then sleep 0.001
else
echo "COMMISSIONING :  www2.Coinmine.pl will be used as pool for ETH mining"
COINMINEDONPORT=$(cat CommitPort | grep COINMINEDONPORT |  grep -o -E '[0-9..]+')
NAME2=$( echo  "$RNAME" | sed 's/[.]//g' )
STARTCOM=$(echo script /home/bash/$TYPESCRIPT -c $Z  timeout '$TIME' ethminer --farm-recheck 300 -G  -F http://$DIP:$COINMINEDONPORT/$DONACC.$NAME2:xxxx  --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
DONUSER=1
 /bin/echo -e "\e[1;36mETH\e[0m" > miningcom
fi


if [ $DWARFDONPOOLETH =  0 ] ; then sleep 0.001
else
echo "COMMISSIONING :   www.dwarfpool.com will be used as pool for ETH mining"
DWARFDONETHPORT=$(cat CommitPort | grep DWARFDONETHPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME1=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
 ### RNAME1=$(echo $NAME. | sed 's/[.]//' | sed 's/[.]//') ### This is the old commision Naming - disabled so I see commsioning in the Proxy for full coms 
STARTCOM=$(echo script /home/bash/$TYPESCRIPT -c $Z  timeout '$TIME' ethminer --farm-recheck 300 -G  -F http://$DIP:$DWARFDONETHPORT/$RNAME1 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
DONUSER=1
 /bin/echo -e "\e[1;36mETH\e[0m" > miningcom 
fi


if [ $DWARFDONPOOLEXP =  0 ] ; then sleep 0.001
else
 echo "COMMISSIONING : www.dwarfpool.com will be used as pool to EXP mining"
 DWARFDONEXPPORT=$(cat CommitPort | grep DWARFDONEXPPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME2=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
 ### RNAME2=$(echo $NAME. | sed 's/[.]//' | sed 's/[.]//') ### This is the old commision Naming - disabled so I see commsioning in the Proxy for full coms 
STARTCOM=$(echo script /home/bash/$TYPESCRIPT -c $Z  timeout '$TIME' ethminer --farm-recheck 300 -G  -F http://$DIP:$DWARFDONEXPPORT/$RNAME2 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
DONUSER=2
/bin/echo -e "\e[6;33mEXP\e[0m"  > miningcom
fi


if [ $SHIFTDONPOOL =  0 ] ; then sleep 0.001
else
 echo "COMMISSIONING : www.shf.miners.net aka SHIFTpool will be used as pool to mine SHIFT"
 SHIFTDONPORT=$(cat CommitPort | grep SHIFTDONPORT |  grep -o -E '[0-9..]+')
NAME=$(cat /home/bash/Commit | grep RIGNAME | sed 's/RIGNAME.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g'| sed 's/[.]//') ### RIGNAMErignumber
RNAME3=$(echo $NAME.$WORKERPRINT | sed 's/[.]//' | sed 's/[.]//')
 ### RNAME3=$(echo $NAME. | sed 's/[.]//' | sed 's/[.]//') ### This is the old commision Naming - disabled so I see commsioning in the Proxy for full coms 
STARTCOM=$(echo script /home/bash/$TYPESCRIPT -c $Z timeout '$TIME' ethminer --farm-recheck 300 -G  -F http://$DIP:$SHIFTDONPORT/$RNAME3 --cl-local-work 256 --cl-global-work 4096 --opencl-device $OGD $COMPUTE $Z )
DONUSER=3
/bin/echo -e "\e[5;31mSHT\e[0m" > miningcom
fi





A=1
NR=$OGD
else 

/bin/echo -e "\e[1;33m     Worker $WORKERPRINT DISABLED , no GPU on $SLOT \e[0m" ## YELLOW


fi



 ### Grabing some Variables for each GPU 
 
 #########################################################################################################################################
 
##############  FOR Ethminer set up and start ##################
#STOP=0

X=$(echo " $Z X "| awk '{print $1 $2}' )
STRING=$( echo ' X=$(DISPLAY=:0' )
###### RULES 


##### Variables are set , Lets work 
if [ $RUNSLOOP = 1 ] ; then 
if [ $PCI1 -gt 0 ] ; then  WORKER=$(echo TERM_FINAL.sh) ; ZECWORKERT1=$(echo Zorg00T1.sh) ; ZECWORKERT2=$(echo Zorg00T2.sh) ; CLOCK=$CLOCKF ; MEMCLOCK=$MEMCLOCKF ; COMM=$COMMF  ; SLEEP=175  ; WORKERCOM=$(echo TERM_FINALCOM.sh) ; INFO=$(echo "Worker F") ; COMFLAGFILE=TERM_FINALFLAG ; 
fi;fi
if [ $RUNSLOOP = 2 ] ; then 
if [ $PCI5 -gt 0 ] ; then  WORKER=$(echo TERM_5.sh) ; ZECWORKERT1=$(echo Zorg05T1.sh) ; ZECWORKERT2=$(echo Zorg05T2.sh) ; CLOCK=$CLOCKE ; MEMCLOCK=$MEMCLOCKE ; COMM=$COMME  ; SLEEP=140  ; WORKERCOM=$(echo TERM_5COM.sh) ; INFO=$(echo "Worker E") ; COMFLAGFILE=TERM_5FLAG
fi;fi
if [ $RUNSLOOP = 3 ] ; then 
if [ $PCI4 -gt 0 ] ; then  WORKER=$(echo TERM_4.sh) ; ZECWORKERT1=$(echo Zorg04T1.sh) ; ZECWORKERT2=$(echo Zorg04T2.sh) ;CLOCK=$CLOCKD ; MEMCLOCK=$MEMCLOCKD ; COMM=$COMMD  ; SLEEP=110  ; WORKERCOM=$(echo TERM_4COM.sh) ; INFO=$(echo "Worker D") ; COMFLAGFILE=TERM_4FLAG
fi;fi
if [ $RUNSLOOP = 4 ] ; then
if [ $PCI3 -gt 0 ] ; then  WORKER=$(echo TERM_3.sh) ; ZECWORKERT1=$(echo Zorg03T1.sh) ; ZECWORKERT2=$(echo Zorg03T2.sh) ;CLOCK=$CLOCKC ; MEMCLOCK=$MEMCLOCKC ; COMM=$COMMC  ; SLEEP=80  ; WORKERCOM=$(echo TERM_3COM.sh) ; INFO=$(echo "Worker C") ; COMFLAGFILE=TERM_3FLAG
fi;fi
if [ $RUNSLOOP = 5 ] ; then 
if [ $PCI2 -gt 0 ] ; then  WORKER=$(echo TERM_2.sh) ; ZECWORKERT1=$(echo Zorg02T1.sh) ; ZECWORKERT2=$(echo Zorg02T2.sh) ;CLOCK=$CLOCKB ; MEMCLOCK=$MEMCLOCKB ; COMM=$COMMB  ; SLEEP=50  ; WORKERCOM=$(echo TERM_2COM.sh) ; INFO=$(echo "Worker B") ; COMFLAGFILE=TERM_2FLAG
fi;fi
if [ $RUNSLOOP = 6 ] ; then 
if [ $PCI0 -gt 0 ] ; then  WORKER=$(echo TERM_1.sh) ; ZECWORKERT1=$(echo Zorg01T1.sh) ; ZECWORKERT2=$(echo Zorg01T2.sh) ;CLOCK=$CLOCKA ; MEMCLOCK=$MEMCLOCKA ; COMM=$COMMA  ; SLEEP=5  ; WORKERCOM=$(echo TERM_1COM.sh) ; INFO=$(echo "Worker A") ; COMFLAGFILE=TERM_1FLAG
fi;fi


 
 ### Creating the script run by each Ethminer for the client 


#sleep 2
echo " #!/bin/bash " >/home/bash/$WORKER
echo " NAME=$INFO"
#echo ' echo $$ >> PIDFILE ' >>/home/bash/$WORKER



 ### Here we set the PID's for every T1 and T2 donations 
MISTERYLETTER=$(echo $INFO | sed 's/Worker //')

char="$MISTERYLETTER"

if   [ "$char" == "A" ] ; then echo "sed -i '/NORM.A/c\'  PIDFILE"			>>/home/bash/$WORKER 
echo ' echo "$$ NORM.A | This is Ethminer pid" >> PIDFILE ' 				>>/home/bash/$WORKER ### Create ETHT1 file and add Worker A pid

elif [ "$char" == "B" ] ; then echo "sed -i '/NORM.B/c\'  PIDFILE"			>>/home/bash/$WORKER 
echo ' echo "$$ NORM.B | This is Ethminer pid" >> PIDFILE '				 >>/home/bash/$WORKER ### Add worker B pid

elif [ "$char" == "C" ] ; then echo "sed -i '/NORM.C/c\'  PIDFILE"			>>/home/bash/$WORKER 
echo ' echo "$$ NORM.C | This is Ethminer pid" >> PIDFILE' 				>>/home/bash/$WORKER ### Add worker C pid

elif [ "$char" == "D" ] ; then echo "sed -i '/NORM.D/c\'  PIDFILE"			>>/home/bash/$WORKER 
echo ' echo "$$ NORM.D | This is Ethminer pid" >> PIDFILE'				 >>/home/bash/$WORKER ### Create ETHT2 file and add worker D pid

elif [ "$char" == "E" ] ; then echo "sed -i '/NORM.E/c\'  PIDFILE"				>>/home/bash/$WORKER 
echo ' echo "$$ NORM.E | This is Ethminer pid" >> PIDFILE'				 >>/home/bash/$WORKER ### Add worker E pid

elif [ "$char" == "F" ] ; then echo "sed -i '/NORM.F/c\'  PIDFILE"			>>/home/bash/$WORKER 
echo ' echo "$$ NORM.F | This is Ethminer pid" >> PIDFILE' 				>>/home/bash/$WORKER ### Add worker F pid

fi


if [ $USER = 1 ] ; then 
echo " mkdir -p /home/rigslave/ETH
HOME=/home/rigslave/ETH"  								>>/home/bash/$WORKER
fi

if [ $USER = 2 ] ; then 
echo "mkdir -p /home/rigslave/EXP
HOME=/home/rigslave/EXP" 								>>/home/bash/$WORKER
fi

if [ $USER = 3 ] ; then 
echo "mkdir -p /home/rigslave/SHIFT
HOME=/home/rigslave/SHIFT" 								>>/home/bash/$WORKER
fi


if [ $RUNSLOOP = 1 ] ; then ### This is done so that the main GPU - F - can alocate some video to actual display... or not but still configurable 
echo " unset PROMPT_COMMAND " 								>>/home/bash/$WORKER
echo " export GPU_FORCE_64BIT_PTR=0 " 							>>/home/bash/$WORKER
echo " export GPU_SINGLE_ALLOC_PERCENT=100 " 						>>/home/bash/$WORKER
echo " export GPU_MAX_ALLOC_PERCENT=99 " 						>>/home/bash/$WORKER
echo " export GPU_MAX_HEAP_SIZE=100 "  						>>/home/bash/$WORKER   ### Changed from 95 to 100 . lets see what  happens 
echo " export GPU_USE_SYNC_OBJECTS=1 " 							>>/home/bash/$WORKER
else
echo " export GPU_FORCE_64BIT_PTR=0 " 							>>/home/bash/$WORKER
echo " export GPU_SINGLE_ALLOC_PERCENT=100 " 						>>/home/bash/$WORKER
echo " export GPU_MAX_ALLOC_PERCENT=100 " 						>>/home/bash/$WORKER
echo " export GPU_MAX_HEAP_SIZE=100 "  							>>/home/bash/$WORKER
echo " export GPU_USE_SYNC_OBJECTS=1 " 							>>/home/bash/$WORKER

fi

echo " aticonfig --od-enable "								>>/home/bash/$WORKER
echo " echo Configured clocks set for $INFO : " 					>>/home/bash/$WORKER
echo " amdconfig --odsc=$CLOCK,$MEMCLOCK --adapter=$NR " 				>>/home/bash/$WORKER
echo " if [ -f $COMFLAGFILE ] ; then " 							>>/home/bash/$WORKER
echo " rm $COMFLAGFILE && sleep 4"							>>/home/bash/$WORKER
echo " else " 										>>/home/bash/$WORKER
echo " echo Ok .. sleeping for $SLEEP sec " 						>>/home/bash/$WORKER
echo "  sleep $SLEEP " 									>>/home/bash/$WORKER
echo ' fi '										>>/home/bash/$WORKER
echo " $STRING.$NR "\
'/usr/bin/aticonfig --pplib-cmd " set fanspeed 0 100 " | grep Successful | wc -l ) ' 	>>/home/bash/$WORKER
echo ' if [ !  $X = 1 ] '								 >>/home/bash/$WORKER
echo " then " 											>>/home/bash/$WORKER
echo " echo $Z GPU is missconfigured ! Check /home/bash and configure again - :))  $Z " >>/home/bash/$WORKER
echo ' echo " X = $X "   &&  sleep 999 '						 >>/home/bash/$WORKER
echo " exit 0 "										 >>/home/bash/$WORKER
echo " else " 										>>/home/bash/$WORKER
echo " DISPLAY=:0.$NR /usr/bin/aticonfig --pplib-cmd $Z set fanspeed 0 100 $Z ## STARTING FANS ! " >>/home/bash/$WORKER
echo " #### ============================#### " 					>>/home/bash/$WORKER ### This is from my manual input days .. I left it here .. Nostalgic I guess 
echo " ###### INPUT SETTINGS HERE !!! ######## "					 >>/home/bash/$WORKER
echo " ####============================#### " 						>>/home/bash/$WORKER
echo " # " 										>>/home/bash/$WORKER
echo " # $COMM "  									>>/home/bash/$WORKER


echo " $START " 									>>/home/bash/$WORKER
echo " # " 										>>/home/bash/$WORKER
echo " wait "										 >>/home/bash/$WORKER
echo " fi " 										>>/home/bash/$WORKER
echo " " 										>>/home/bash/$WORKER

chmod 777 /home/bash/$WORKER  > /dev/null 2>&1
chmod +x /home/bash/$WORKER  > /dev/null 2>&1

  ### Creating the script run by each Ethminer for Commisioning purpose 
  
  ### We need the time difference ( it is done so .. if a reboot occures this script will calculate the TIME left for commissioning 

  
  

##################################################################################################################################################################

 ### Creating the scrip for Commision mining !


#sleep 2
echo " #!/bin/bash " 								>/home/bash/$WORKERCOM
#echo " NAME=$INFO"
#echo ' echo $$ >> PIDFILE ' >>/home/bash/$WORKER



 ### Here we set the PID's for every T1 and T2 donations 
MISTERYLETTER=$(echo $INFO | sed 's/Worker //')

char="$MISTERYLETTER"

if   [ "$char" == "A" ] ; then echo ' echo "$$ COMS.A | This is Commision pid" >> PIDFILE ' >>/home/bash/$WORKERCOM ### Create ETHT1 file and add Worker A pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' )
SED=$(echo "sed -i '/COMS.A/c\' PIDFILE")

elif [ "$char" == "B" ] ; then echo ' echo "$$ COMS.B | This is Commision pid" >> PIDFILE ' >>/home/bash/$WORKERCOM ### Add worker B pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' )
SED=$(echo "sed -i '/COMS.B/c\' PIDFILE")

elif [ "$char" == "C" ] ; then echo ' echo "$$ COMS.C | This is Commision pid" >> PIDFILE' >>/home/bash/$WORKERCOM ### Add worker C pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' )
SED=$(echo "sed -i '/COMS.C/c\' PIDFILE")

elif [ "$char" == "D" ] ; then echo ' echo "$$ COMS.D | This is Commision pid" >> PIDFILE' >>/home/bash/$WORKERCOM ### Create ETHT2 file and add worker D pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
SED=$(echo "sed -i '/COMS.D/c\' PIDFILE")

elif [ "$char" == "E" ] ; then echo ' echo "$$ COMS.E | This is Commision pid" >> PIDFILE' >>/home/bash/$WORKERCOM ### Add worker E pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
SED=$(echo "sed -i '/COMS.E/c\' PIDFILE")

elif [ "$char" == "F" ] ; then echo ' echo "$$ COMS.F | This is Commision pid" >> PIDFILE' >>/home/bash/$WORKERCOM ### Add worker F pid
ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
SED=$(echo "sed -i '/COMS.F/c\' PIDFILE")

fi


if [ $DONUSER = 1 ] ; then 
echo " mkdir -p /home/rigslave/ETH
HOME=/home/rigslave/ETH"  							>>/home/bash/$WORKERCOM
fi

if [ $DONUSER = 2 ] ; then 
echo "mkdir -p /home/rigslave/EXP
HOME=/home/rigslave/EXP" 							>>/home/bash/$WORKERCOM
fi

if [ $DONUSER = 3 ] ; then 
echo "mkdir -p /home/rigslave/SHIFT
HOME=/home/rigslave/SHIFT" 							>>/home/bash/$WORKERCOM
fi


if [ $RUNSLOOP = 1 ] ; then ### This is done so that the main GPU - F - can alocate some video to actual display... or not but still configurable 
echo " unset PROMPT_COMMAND "							>>/home/bash/$WORKERCOM
echo " export GPU_FORCE_64BIT_PTR=0 " 						>>/home/bash/$WORKERCOM
echo " export GPU_SINGLE_ALLOC_PERCENT=100 " 					>>/home/bash/$WORKERCOM
echo " export GPU_MAX_ALLOC_PERCENT=99 " 					>>/home/bash/$WORKERCOM
echo " export GPU_MAX_HEAP_SIZE=100 "  						>>/home/bash/$WORKERCOM   ### Changed from 95 to 100 . lets see what  happens 
echo " export GPU_USE_SYNC_OBJECTS=1 "						 >>/home/bash/$WORKERCOM
else
echo " export GPU_FORCE_64BIT_PTR=0 "						 >>/home/bash/$WORKERCOM
echo " export GPU_SINGLE_ALLOC_PERCENT=100 "					 >>/home/bash/$WORKERCOM
echo " export GPU_MAX_ALLOC_PERCENT=100 " 					>>/home/bash/$WORKERCOM
echo " export GPU_MAX_HEAP_SIZE=100 "  						>>/home/bash/$WORKERCOM
echo " export GPU_USE_SYNC_OBJECTS=1 " 						>>/home/bash/$WORKERCOM

fi

echo " aticonfig --od-enable " 							>>/home/bash/$WORKERCOM
echo " echo Configured clocks set for $INFO : " 				>>/home/bash/$WORKERCOM
echo " amdconfig --odsc=$CLOCK,$MEMCLOCK --adapter=$NR " 			>>/home/bash/$WORKERCOM
echo " echo Ok .. sleeping for $SLEEP + 5 sec " 				>>/home/bash/$WORKERCOM
echo "  sleep $SLEEP  && sleep 5 "						>>/home/bash/$WORKERCOM
echo " $STRING.$NR "\
'/usr/bin/aticonfig --pplib-cmd " set fanspeed 0 100 " | grep Successful | wc -l ) ' >>/home/bash/$WORKERCOM
echo ' if [ !  $X = 1 ] ' 							>>/home/bash/$WORKERCOM
echo " then "									 >>/home/bash/$WORKERCOM
echo " echo $Z GPU is missconfigured ! Check /home/bash and configure again - yeah ... you fucked up :))  $Z " >>/home/bash/$WORKERCOM
echo ' echo " X = $X "   &&  sleep 99999999 '					>>/home/bash/$WORKERCOM
echo " exit 0 " 								>>/home/bash/$WORKERCOM
echo " else " 									>>/home/bash/$WORKERCOM
echo " DISPLAY=:0.$NR /usr/bin/aticonfig --pplib-cmd $Z set fanspeed 0 100 $Z ## STARTING FANS ! " >>/home/bash/$WORKERCOM

echo "$ECHO" 									>>/home/bash/$WORKERCOM  
echo "WORKLETT=$MISTERYLETTER" 							>>/home/bash/$WORKERCOM
echo 'PID=$(cat PIDFILE | grep NORM.$WORKLETT | grep -o -E '"'[0-9..]+')"  	>>/home/bash/$WORKERCOM
echo 'kill $PID' 								>>/home/bash/$WORKERCOM
echo " echo 'commissiontime' > $COMFLAGFILE "					>>/home/bash/$WORKERCOM ### This is the flag set for Donation splash - reporter needs this 
echo " $STARTCOM " 									>>/home/bash/$WORKERCOM	### This is the timeout needed later to be set from commision timer 
echo "sleep 2" 									>>/home/bash/$WORKERCOM	
echo "TERMSTART=$(echo $WORKER)" 							>>/home/bash/$WORKERCOM
echo 'nohup x-terminal-emulator --geometry=105x6 -T Worker_$WORKLETT  -e '"'sh /home/bash/$WORKER'"' &' >>/home/bash/$WORKERCOM
echo  $SED									>>/home/bash/$WORKERCOM ### will delete also the normal PID file , will be set first thing next ! 
#echo "./$WORKER" 									>>/home/bash/$WORKERCOM
echo " echo ""Commisioning Program has ended - $WORKER started""  && sleep 60"	>>/home/bash/$WORKERCOM
echo " " 									>>/home/bash/$WORKERCOM
echo " fi " 									>>/home/bash/$WORKERCOM
echo " " 									>>/home/bash/$WORKERCOM

chmod 777 /home/bash/$WORKERCOM  > /dev/null 2>&1
chmod +x /home/bash/$WORKERCOM  > /dev/null 2>&1




 ############################################################################################################
 ### ################# ZEC PART BUILDER ############################ ###
 
 ZEC=1
 POOL=$(echo '"stratum+tcp://us1-zcash.flypool.org:3333"')
 
 if [ $ZEC = 1 ] ; then
 ### FOR ZEC MINING !!!
 ### FIRST WE need the PIDS TODO 
 #WALLET=$(cat /home/bash/ZECWALLET | sed '/^$/d;s/[[:blank:]]//g' )




 ZZ=$( echo '"')
  ### 1rst instance 
echo " #!/bin/bash
 WALLET=$WALLET 
aticonfig --od-enable
echo Configured clocks set for $INFO :
amdconfig --odsc=$CLOCK,$MEMCLOCK --adapter=$NR 
echo Ok .. sleeping for $SLEEP + 5 sec 
sleep $SLEEP  && sleep 5 
export GPU_SINGLE_ALLOC_PERCENT=100 
export GPU_MAX_ALLOC_PERCENT=99 
export GPU_MAX_HEAP_SIZE=100 
export GPU_USE_SYNC_OBJECTS=1 "> /home/bash/$ZECWORKERT1
echo " $STRING.$NR "\
'/usr/bin/aticonfig --pplib-cmd " set fanspeed 0 100 " | grep Successful  | wc -l ) ' >>/home/bash/$ZECWORKERT1

WALLET=$(cat /home/bash/ZECWALLET | sed '/^$/d;s/[[:blank:]]//g' )

 if [ $NR = 0 ] ; then WALLET=$( echo "t1RVpR7U9ZA5SU94tXzEu7sLBtZrBkq4Vrf") 
 echo '/bin/echo -e "\e[0;32m "' >> /home/bash/$ZECWORKERT1
 fi ### Commisioning
 
echo 'echo $$ > '"$NR.T1PID" >> /home/bash/$ZECWORKERT1
echo "cd /home/rigslave/zogminer/src/
script /home/bash/Ist$NR.T1 -c $ZZ ./zcash-miner -G -stratum=$POOL  -user=$WALLET.Rig -S=$NR | ts $ZZ
  " >> /home/bash/$ZECWORKERT1
chmod +x /home/bash/$ZECWORKERT1
#screen -dmS Zcash$RUNSLOOP.T1 ./$ZECWORKERT1
 
 sleep 0.1


 ### 2nd instance 
 echo " #!/bin/bash
 WALLET=$WALLET
 echo " This is adapter $NR .. waiting $SLEEP sec "
sleep $SLEEP  && sleep 40 
export GPU_SINGLE_ALLOC_PERCENT=100 
export GPU_MAX_ALLOC_PERCENT=99 
export GPU_MAX_HEAP_SIZE=100 
export GPU_USE_SYNC_OBJECTS=1 " > /home/bash/$ZECWORKERT2

WALLET=$(cat /home/bash/ZECWALLET | sed '/^$/d;s/[[:blank:]]//g' )

 if [ $NR = 1 ] ; then WALLET=$( echo "t1RVpR7U9ZA5SU94tXzEu7sLBtZrBkq4Vrf") ### COmmisioning
 echo '/bin/echo -e "\e[0;32m "' >> /home/bash/$ZECWORKERT2
 fi ### Commisioning
 
 
  if [ $NR = 0 ] ; then WALLET=$( echo "t1RVpR7U9ZA5SU94tXzEu7sLBtZrBkq4Vrf") ### COmmisioning
 echo '/bin/echo -e "\e[0;32m "' >> /home/bash/$ZECWORKERT2
 fi ### Commisioning

 
 
echo 'echo $$ > '"$NR.T2PID" >> /home/bash/$ZECWORKERT2
echo "cd /home/rigslave/zogminer/src/
script /home/bash/Ist$NR.T2 -c $ZZ./zcash-miner -G -stratum=$POOL  -user=$WALLET.Rig -S=$NR | ts $ZZ
 " >> /home/bash/$ZECWORKERT2
chmod +x /home/bash/$ZECWORKERT2
#screen -dmS Zcash$RUNSLOOP.T2 ./$ZECWORKERT2
 
 

fi ### For ZECmining confition 

ZEC=0


###################################### OLD COMMISSIONING #####################################################
##############################################################################################################


  DUALMINER=0 ### Left this here so I will still have this script for dual mining.. I need a complete change for the comision to work ... so it will be redone ;/
  if [ $DUALMINER = 1 ] ; then 

echo " " 
echo " #!/bin/bash " >/home/bash/$WORKERCOM
echo ' echo $$ >> PIDFILE ' >>/home/bash/$WORKERCOM

if [ $DONUSER = 1 ] ; then 
echo " mkdir -p /home/rigslave/ETH
HOME=/home/rigslave/ETH"  >>/home/bash/$WORKERCOM
fi

if [ $DONUSER = 2 ] ; then 
echo "mkdir -p /home/rigslave/EXP
HOME=/home/rigslave/EXP" >>/home/bash/$WORKERCOM
fi

if [ $DONUSER = 3 ] ; then 
echo "mkdir -p /home/rigslave/SHIFT
HOME=/home/rigslave/SHIFT" >>/home/bash/$WORKERCOM
fi

MISTERYLETTER=$(echo $INFO | sed 's/Worker //')

char="$MISTERYLETTER"

if   [ "$char" == "A" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' ) 
echo ' echo $$ A > DONNT1' >>/home/bash/$WORKERCOM
SLEEP=15

elif [ "$char" == "B" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' )
echo ' echo $$ B >> DONNT1' >>/home/bash/$WORKERCOM
SLEEP=55

elif [ "$char" == "C" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' ) 
echo ' echo $$ C >> DONNT1' >>/home/bash/$WORKERCOM
SLEEP=90

elif [ "$char" == "D" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
echo ' echo $$ D > DONNT2' >>/home/bash/$WORKERCOM
SLEEP=90

elif [ "$char" == "E" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
echo ' echo $$ E >> DONNT2' >>/home/bash/$WORKERCOM
SLEEP=55

elif [ "$char" == "F" ] ; then ECHO=$(echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' ) 
echo ' echo $$ F >> DONNT2' >>/home/bash/$WORKERCOM
SLEEP=15

fi
 ####################### - END - #####################################################






echo " echo Ok .. sleeping for $SLEEP + 190 sec " >>/home/bash/$WORKERCOM
echo " sleep 190 " >>/home/bash/$WORKERCOM
echo "  sleep $SLEEP " >>/home/bash/$WORKERCOM
echo " $STRING.$NR "\
'/usr/bin/aticonfig --pplib-cmd " set fanspeed 0 100 " | grep Successful  | wc -l ) ' >>/home/bash/$WORKERCOM
echo ' if [ !  $X = 1 ] ' >>/home/bash/$WORKERCOM
echo " then " >>/home/bash/$WORKERCOM
echo " echo $Z GPU is missconfigured !  $Z " >>/home/bash/$WORKERCOM
echo ' echo " X = $X "   &&  sleep 99 ' >>/home/bash/$WORKERCOM
echo " exit 0 " >>/home/bash/$WORKERCOM
echo " else " >>/home/bash/$WORKERCOM
echo " # " >>/home/bash/$WORKERCOM
echo " # $COMM "  >>/home/bash/$WORKERCOM
#if [ $RUNSLOOP -lt 4 ] ; then 
#echo ' TIME=$( cat /home/bash/COMTIME2 |  sed "s/ TIMEOUT.//" ) ' >>/home/bash/$WORKERCOM
#else
#echo ' TIME=$( cat /home/bash/COMTIME1 |  sed "s/ TIMEOUT.//" ) ' >>/home/bash/$WORKERCOM
#fi
sleep 0.02
echo " echo Start > $COMFLAGFILE " >>/home/bash/$WORKERCOM ### This is the flag set for Donation splash - reporter needs this 
#echo ' echo 85368536 | sudo -S -iu etherium'>>/home/bash/$WORKERCOM
echo "$ECHO" >>/home/bash/$WORKERCOM 
echo ' timeout $TIME '\
"  $STARTCOM " >>/home/bash/$WORKERCOM			### This is the timeout needed later to be set from commision timer 
echo " # " >>/home/bash/$WORKERCOM
echo " rm $COMFLAGFILE " >>/home/bash/$WORKERCOM
echo " wait " >>/home/bash/$WORKERCOM
echo " fi " >>/home/bash/$WORKERCOM
echo " " >>/home/bash/$WORKERCOM
echo " "
chmod 777 /home/bash/$WORKERCOM  > /dev/null 2>&1
chmod +x /home/bash/$WORKERCOM  > /dev/null 2>&1

fi


let RUNSLOOP-=1
done 
####################################################################################################################################
###########################################  OLD COMMISION END  ####################################################################
ETH=0  ### DEBUGG
ZEC=1  ### DEBUGG



 ### This is ETHEREUM starter 
if [ $ETH = 1 ] ; then 
echo " Dropping to AUTOETH "
/home/bash/AUTO.ETHERUM.sh
sleep 1
/bin/echo -e "\e[0;32m  AUTOETH is done  \e[0m"
screen -dmS Reporter /home/bash/reporter.sh
fi


 ### This is ZCASH starter 
if [ $ZEC = 1 ] ; then 
echo " Dropping to AUTOZEC "
chmod +x /home/bash/ZecBBsitter.sh
nohup xterm -e ./ZecBBsitter.sh
sleep 1
/bin/echo -e "\e[0;32m  AUTOZEC is done  \e[0m"
chmod +x /home/bash/ZECreporter.sh
screen -dmS Reporter /home/bash/ZECreporter.sh
fi





#echo " "

sleep 0.8
#echo " waiting for all GPUs to start ... 90 sec "
#sleep 90
cd  /home/bash ### WTF ?
set PATH=$PATH:/home/bash

echo " my job is done here "
#sleep 180
RUN=1



while : ### Here starts the check loop for commit change and commision start and end 
do


if [ -f /home/bash/CommitNOW ] 
then
/bin/echo -e "\e[1;31m CommitNOW has been detected .. rewriting config files and killing curent miners \e[0m" #RED


for pid in `cat /home/bash/PIDFILE  | grep Ethminer |awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done

for pid in `cat /home/bash/PIDFILE  | grep Commision |awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done



#for pid in `cat /home/bash/PIDFILE  | awk '{print $1}'` 
#do 
#kill $pid 
#sleep 0.03
#done
/bin/echo -e "\e[1;31m Miners killed ... 15 sec cooloff \e[0m" #RED

sleep 15

/bin/echo -e "\e[1;31m Starting mining on new configuration\e[0m" #RED
now="$(date +"%r")"
echo "$now I have found new configuration file from Tarantula ... I will replace this commit file with a new one " >> /home/bash/Commit

now=$(date +"%r""%m-%d-%Y") ### Added this to keep all the Commit files 
FILE=$(echo $now)
mkdir /home/bash/OLDCOMMIT

cp /home/bash/Commit /home/bash/OLDCOMMIT/$FILE.Commit
sleep 0.05 ### CPU compute time 
mv /home/bash/Commit /home/bash/CommitOLD

  ### for the Splash screen - informing the user of commit 
  
  
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.A.sh
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.B.sh
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.C.sh
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.D.sh
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.E.sh
/bin/echo -e "  \033[1;97m=== Stats : Commit received UPGRADING ...   " > /home/bash/SplashWORKER.F.sh


#mv /home/bash/CommitNOW /home/bash/Commit
sleep 0.05 ### CPU compute time 
nohup /home/bash/Rig.sh &
sleep 0.03






for pid in `cat /home/bash/PIDFILE  | grep Ethminer |awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done
for pid in `cat /home/bash/PIDFILE  | grep Commision |awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done


for pid in `cat /home/bash/PIDFILEPrototype | grep Ethminer | awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done

for pid in `cat /home/bash/PIDFILEPrototype | grep Commision | awk '{print $1}'` 
do 
kill $pid 
sleep 0.05
done

screen -wipe

sleep 300 ### Leave ths here ... let the CPU think a bit


#sleep 2

rm /home/bash/CommitNOW
#sleep 3 ### CPU compute time 
exit 0


else


 ### This is a time checker that will open a secondary mine thread in commision time for each GPU 

 
 ### DEBUGG  
 
#if [ -f Comsionstatus ] ; then 
#rm Comsionstatus
#fi
#if [ -f COMTIME ] ; then 
#rm COMTIME ### We remove commision flag so we start to check from now on for the next commision ( is removed at boot also if anything ) 
#fi


DONATIONALLOW=$( cat CommitPort  | grep DONATIONALLOW |  sed 's/DONATIONALLOW=//'   | grep -v "#" | sed '/^$/d;s/[[:blank:]]//g') ### I am allowed to actually commision/donate ? 
sleep 0.05 ### CPU compute time 

CommisionT1TIME=$( cat CommitPort  | grep DONATIONT1TIME | sed 's/DONATIONT1TIME=//'| grep -v "#" | sed '/^$/d;s/[[:blank:]]//g') ### When the commision is set to happend ( begining ) GPU 1,2,3
sleep 0.05 ### CPU compute time 
CommisionT2TIME=$( cat CommitPort  | grep DONATIONT2TIME | sed 's/DONATIONT2TIME=//'| grep -v "#" | sed '/^$/d;s/[[:blank:]]//g') ### When the commision is set to happend ( begining ) GPU 4,5,6
sleep 0.05 ### CPU compute time 

CommtimeT1=$( cat CommitPort  | grep DONATIONT1WHILE | sed 's/DONATIONT1WHILE=//'| grep -v "#" | sed '/^$/d;s/[[:blank:]]//g')      ### How much Comision time for GPU 1,2,3 .i.e. the timeout of the miner 
sleep 0.05 ### CPU compute time 
CommtimeT2=$( cat CommitPort  | grep DONATIONT2WHILE | sed 's/DONATIONT2WHILE=//'| grep -v "#" | sed '/^$/d;s/[[:blank:]]//g')      ### How much Comision time for GPU 4,5,6 .i.e. the timeout of the miner 
sleep 0.05 ### CPU compute time 
#Commtime=04:33 ### DEBUGG 


if [ $DONATIONALLOW -gt 0 ] ; then ### Ok ... we are allowed to commision
  ############ STARTING COMMISION SCRIPT ################

 ### This is T1 for GPU 1,2,3 
 
 
 
date_a=$(date +"%H:%M") ### NOW , the actual time we live in :))
if [[ "$date_a" > "$CommisionT1TIME" ]] ; ### Are we passed the commission time beggin ? 
  then
  sleep 0.05 ### CPU compute time 
	      IFS=: read old_hour old_min <<< "$date_a"
	      IFS=: read hour min <<< "$CommisionT1TIME"
	      IFS=: read Dhour Dmin <<< "$CommtimeT1"
	
	      timenow=$(date -d "1970-01-01 $old_hour:$old_min:00" +%s) ### The date now ! 
	      timeComs=$(date -d "1970-01-01 $hour:$min:00" +%s) 	### The commision begin !
	      sec_dif=$(date -d "1970-01-01 $Dhour:$Dmin:00" +%s)       ### The commision while !
	      offset=$(date -d "1970-01-01 00:01:00" +%s)               ### Not used yet ( ever will be ... ? )
	      GMT=2
	      GMTv=$((  $GMT * 60  * 60)) ### Need to set correct GMT or the script will error 
	      sleep 1
	        TIMEOUT1=$(( ((((timeComs + $GMTv) + (sec_dif + $GMTv)) - (timenow + $GMTv)) +60 ) ))
		if [ $TIMEOUT1 -gt 0 ] ; then 
		sleep 0.05 ### CPU compute time 
		
		
		if [ -f ComsionstatusT1 ] ;
		
			then 
			sleep 0.05 ### CPU compute time 
			echo "It is $date_a : Commisionflag T1 is set , I will not run again ... waiting for the flag to be set off " 
			PASS=1
		
			else
			sleep 0.05 ### CPU compute time 
			echo "It is $date_a : We are in commision time :  Starting Ethminer for $TIMEOUT1 sec  " ### Finall -  we set a timeout for the miner of N sec 
			echo "Commision started" > ComsionstatusT1 ### We create a commision flag so we DO not touch it again ! 
			echo " TIMEOUT=$TIMEOUT1 " > COMTIME1
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_A  -e 'sh /home/bash/TERM_1COM.sh' &
			#echo "commissiontime" > TERM_1FLAG
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_B  -e 'sh /home/bash/TERM_2COM.sh' &
			#echo "commissiontime" > TERM_2FLAG
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_C  -e 'sh /home/bash/TERM_3COM.sh' &
			#echo "commissiontime" > TERM_3FLAG
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_D  -e 'sh /home/bash/TERM_4COM.sh' &
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_E  -e 'sh /home/bash/TERM_5COM.sh' &
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_F  -e 'sh /home/bash/TERM_FINALCOM.sh' &
			
		fi
		
		else 
		sleep 0.05 ### CPU compute time 
		
		echo "It is $date_a : Commision hours have passed for T1 ; next commision will happen tomorrow @ $CommisionT1TIME "  ### DEBUG
		if [ -f ComsionstatusT1 ] ; then 
		rm ComsionstatusT1 ### We remove commision flag so we start to check from now on for the next commision ( is removed at boot also if anything ) 
		fi
		
		if [ -f COMTIME1 ] ; then 
		sleep 0.05 ### CPU compute time 
		#rm TERM_1FLAG
		#rm TERM_2FLAG
		#rm TERM_3FLAG
		rm COMTIME1 ### We remove commision flag so we start to check from now on for the next commision ( is removed at boot also if anything ) 
		sleep 0.05 ### CPU compute time 
		echo "It is $date_a : we are removing the commision flag for T1 so we let the script check again " 
		
		fi
		
		sleep 1 ### Finall we wait for next commision time tomorrow
		fi 
	
  else 
  sleep 0.05 ### CPU compute time 
	sleep 1 ### Finall Commisioning is going to happen today 
	echo "It is $date_a :  ..T1 commision will start @ $CommisionT1TIME + 1min " ### DEBUG
  fi
  ### END COMMISION T1 SCRIPT 
  
  
    ### This is T2 for GPU 4,5,6 

date_a=$(date +"%H:%M") ### NOW , the actual time we live in :))
if [[ "$date_a" > "$CommisionT2TIME" ]] ; ### Are we passed the commission time beggin ? 
  then
  sleep 0.05 ### CPU compute time 
	      IFS=: read old_hour old_min <<< "$date_a"
	      IFS=: read hour min <<< "$CommisionT2TIME"
	      IFS=: read Dhour Dmin <<< "$CommtimeT2"
	
	      timenow=$(date -d "1970-01-01 $old_hour:$old_min:00" +%s) ### The date now ! 
	      timeComs=$(date -d "1970-01-01 $hour:$min:00" +%s) 	### The commision begin !
	      sec_dif=$(date -d "1970-01-01 $Dhour:$Dmin:00" +%s)       ### The commision while !
	      offset=$(date -d "1970-01-01 00:01:00" +%s)               ### Not used yet ( never will be ... ? )
	      GMT=2
	      GMTv=$((  $GMT * 60  * 60)) ### Need to set correct GMT or the script will error 
	      sleep 1
	        TIMEOUT2=$(( ((((timeComs + $GMTv) + (sec_dif + $GMTv)) - (timenow + $GMTv)) +60 ) ))
		if [ $TIMEOUT2 -gt 0 ] ; then 
		sleep 0.05 ### CPU compute time 
		
		
		
		
		if [ -f ComsionstatusT2 ] ;
			then 
			if [ ! $PASST2 = 1 ] ;then 
			echo "It is $date_a : Commisionflag T2 is set , I will not run again ... waiting for the flag to be set off " 
			fi
			sleep 0.05 ### CPU compute time 
			PASST2=1
		
			else
			sleep 0.05 ### CPU compute time 
			echo "It is $date_a : We are in commision time :  Starting Ethminer for $TIMEOUT2 sec  " ### Finall -  we set a timeout for the miner of N sec 
			echo "Commision started" > ComsionstatusT2 ### We create a commision flag so we DO not touch it again ! 
			echo " TIMEOUT=$TIMEOUT2 " > COMTIME2
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_A  -e 'sh /home/bash/TERM_1COM.sh' &
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_B  -e 'sh /home/bash/TERM_2COM.sh' &
			#nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_C  -e 'sh /home/bash/TERM_3COM.sh' &
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_D  -e 'sh /home/bash/TERM_4COM.sh' &
			#echo "commissiontime" > TERM_4FLAG
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_E  -e 'sh /home/bash/TERM_5COM.sh' &
			#echo "commissiontime" > TERM_5FLAG
			nohup x-terminal-emulator --geometry=105x6 -T DONATION.Worker_F  -e 'sh /home/bash/TERM_FINALCOM.sh' &
			#echo "commissiontime" > TERM_FINALFLAG
			
		fi
		
		else 
		sleep 0.05 ### CPU compute time 
		
		echo "It is $date_a : Commision hours have passed for T2 ; next commision will happen tomorrow @ $CommisionT2TIME "  ### DEBUG
		if [ -f ComsionstatusT2 ] ; then 
		sleep 0.05 ### CPU compute time 
		rm ComsionstatusT2 ### We remove commision flag so we start to check from now on for the next commision ( is removed at boot also if anything )
		PASST2=0
		fi
		
		if [ -f COMTIME2 ] ; then 
		sleep 0.05 ### CPU compute time 
		#rm TERM_4FLAG
		#rm TERM_5FLAG
		#rm TERM_FINALFLAG
		rm COMTIME2 ### We remove commision flag so we start to check from now on for the next commision ( is removed at boot also if anything ) 
		echo "It is $date_a : we are removing the commision flag for T2 so we let the script check again " 
		
		fi
		
		sleep 1 ### Finall we wait for next commision time tomorrow
		fi 
	
  else 
  sleep 0.5 ### CPU compute time 
	sleep 1 ### Finall Commisioning is going to happen today 
	echo "It is $date_a :  ..T2 commision will start @ $CommisionT2TIME + 1min " ### DEBUG
  fi
  ### END COMMISION T2 SCRIPT 
  
  
  
  
  
  
  
  
  
  
  
  
  else 
  
  echo " Donnation is not allowed" 
  PASS=1
  
fi ### The donationallow end ( will just disregard the entire script if not allowed ) 


((RUN-=1))
fi
sleep 20
done
fi


