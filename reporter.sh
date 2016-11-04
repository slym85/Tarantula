#!/bin/bash

 ### This is version 2.4.0 - Updated the Temp Fan Clock control system to have a fail safe system - Still not working !!! 
 ### SLOW CPU optimized - it will check and report sick GPU's 
 ### Sick info and comunication protoco, should work | Edit it works ! 
 ### Fixed the Wrong Ave total HS bug by multiplicatiojn of donating HS 
      # Update : Fixed the fix ... Dual mining is obsoleet now .. 
 ### Version updated 28.09.2016
 #sleep 3
 echo "$$ | Reporter " >> PIDFILE
 
 HOME=/home/rigslave/
CLOCKCONTROL=1		### This is Thermal clock control - 1 is on 
DUALMINING=0 		### Just canceling the Hash Rate multiplier 
MAXTEMP=86		### This will trigger CLOCKDOWN
TEMPCONTROL=0 		### DEBUGG
TARGETTEMP=75		### This is target GPU temp 
if [ -f TARGETTEMP ] ; then 
TARGETTEMP=$( cat TARGETTEMP |  grep -o -E '[0-9..]+' )
else TARGETTEMP=75		### This is target GPU temp 
fi


 ### Some first run variables 
RCLA=0
RCLB=0
RCLC=0
RCLD=0
RCLE=0
RCLF=0

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


############################################################################################################################################



sleep 0.03 ### CPU Compute time 
HSTAVG=0
CLOCKA=$(cat /home/bash/Commit | grep CLOCK_A| sed 's/CLOCK_A.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKA=$(cat /home/bash/Commit | grep MEM_A | sed 's/MEM_A.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
sleep 0.03 ### CPU Compute time 
CLOCKF=$(cat /home/bash/Commit | grep CLOCK_F| sed 's/CLOCK_F.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKF=$(cat /home/bash/Commit | grep MEM_F | sed 's/MEM_F.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
sleep 0.03 ### CPU Compute time 
CLOCKB=$(cat /home/bash/Commit | grep CLOCK_B| sed 's/CLOCK_B.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKB=$(cat /home/bash/Commit | grep MEM_B | sed 's/MEM_B.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
sleep 0.03 ### CPU Compute time 
CLOCKC=$(cat /home/bash/Commit | grep CLOCK_C| sed 's/CLOCK_C.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKC=$(cat /home/bash/Commit | grep MEM_C | sed 's/MEM_C.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
sleep 0.03 ### CPU Compute time 
CLOCKD=$(cat /home/bash/Commit | grep CLOCK_D| sed 's/CLOCK_D.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKD=$(cat /home/bash/Commit | grep MEM_D | sed 's/MEM_D.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
sleep 0.03 ### CPU Compute time 
CLOCKE=$(cat /home/bash/Commit | grep CLOCK_E| sed 's/CLOCK_E.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')
MEMCLOCKE=$(cat /home/bash/Commit | grep MEM_E | sed 's/MEM_E.//'| grep -v "#"| sed '/^$/d;s/[[:blank:]]//g')

 ### These are 2 Mining flags - constant , only for SPLASH i It reports the coin been mined and the coin been mined in commision  

 UFL=$( cat mining )
 DFL=$( cat miningcom )
sleep 0.03 ### CPU Compute time 
rm /home/bash/Splash.sh
rm /home/bash/SplashWORKER.A.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/SplashWORKER.F.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/SplashWORKER.B.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/SplashWORKER.C.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/SplashWORKER.D.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/SplashWORKER.E.sh
sleep 0.03 ### CPU Compute time 
rm /home/bash/awe1
sleep 0.03 ### CPU Compute time 
rm /home/bash/awe
sleep 0.03 ### CPU Compute time 

/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.A.sh
sleep 0.03 ### CPU Compute time 
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.B.sh
sleep 0.03 ### CPU Compute time 
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.C.sh
sleep 0.03 ### CPU Compute time 
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.D.sh
sleep 0.03 ### CPU Compute time 
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.E.sh
sleep 0.03 ### CPU Compute time 
/bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ...   " > /home/bash/SplashWORKER.F.sh
sleep 0.03 ### CPU Compute time 


HST=0
sleep 3
MEDRUNS=3 ### Debugg - here should be 0 

FAN=100
FAN_A=100
FAN_B=100
FAN_C=100
FAN_D=100
FAN_E=100
FAN_F=100


while : ### The Script LOOP 
do

sleep 0.05
#HSTAVG=0
HSFM=0
HSAM=0
HSBM=0
HSCM=0
HSDM=0
HSEM=0

 ### Setting FAN vars defaults 





echo " " > /home/bash/Splash.sh
RUNS=7
OPCL=0
CPU2=$( cat /proc/loadavg | awk -F. '{print $1.$2}' | sed 's/0//g' )
CPU=$(expr $CPU2 / 2) 
uptime=$( uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/') 
/bin/echo -e "\e[1;33m  ===========DISPLAYING WORKERS BY POSSITION=========  \e[0m" >> /home/bash/Splash.sh   ## YELLOW
/bin/echo -e "\e[1;33m  ====== BASED ON THE REPORT OF THE MOTHERBOARD =====  \e[0m" >> /home/bash/Splash.sh   ## YELLOW
/bin/echo -e "\e[1;33m If the M.B's report is wrong, this script can't correct \e[0m" >> /home/bash/Splash.sh   ## YELLOW
echo " Uptime = $uptime , load = $CPU ,Avg H/s = $HSTAVG "  >> /home/bash/Splash.sh
echo " " >> /home/bash/Splash.sh

until [  $RUNS -lt 2 ]; do ### The reporter LOOP 

sleep 6  ### TURNED OFF FOR DEBUGGIN Sweetspot is 6 ! round it gives 35 sec for each GPU to report 


((RUNS-=1))

if [ $SPLASH = 1 ] > /dev/null 2>&1 ; then # FOR FAST first delivery 
sleep 0.001
fi


if [ $RUNS = 6 ] ; then PCI=$PCI0 SLOT=2 ; NAME=typescriptA ; WORKER=$(echo WORKER.A) ; CLK=$CLOCKA ; MEM=$MEMCLOCKA ; COMFLAGFILE=TERM_1FLAG ; FAN=$FAN_A ; DEVICE=1
fi

if [ $RUNS = 5 ] ; then PCI=$PCI1 SLOT=1 ; NAME=typescriptF ; WORKER=$(echo WORKER.F) ; CLK=$CLOCKF ; MEM=$MEMCLOCKF ; COMFLAGFILE=TERM_FINALFLAG ; FAN=$FAN_F ; DEVICE=0
fi

if [ $RUNS = 4 ] ; then PCI=$PCI2 SLOT=3 ; NAME=typescriptB ; WORKER=$(echo WORKER.B) ; CLK=$CLOCKB ; MEM=$MEMCLOCKB ; COMFLAGFILE=TERM_2FLAG ; FAN=$FAN_B ; DEVICE=2
fi

if [ $RUNS = 3 ] ; then PCI=$PCI3 SLOT=4 ; NAME=typescriptC ; WORKER=$(echo WORKER.C) ; CLK=$CLOCKC ; MEM=$MEMCLOCKC ; COMFLAGFILE=TERM_3FLAG ; FAN=$FAN_C ; DEVICE=3
fi

if [ $RUNS = 2 ] ; then PCI=$PCI4 SLOT=5 ; NAME=typescriptD ; WORKER=$(echo WORKER.D) ; CLK=$CLOCKD ; MEM=$MEMCLOCKD ; COMFLAGFILE=TERM_4FLAG ; FAN=$FAN_D ; DEVICE=4
fi

if [ $RUNS = 1 ] ; then PCI=$PCI5 SLOT=6 ; NAME=typescriptE ; WORKER=$(echo WORKER.E) ; CLK=$CLOCKE ; MEM=$MEMCLOCKE ; COMFLAGFILE=TERM_5FLAG ; FAN=$FAN_E ; DEVICE=5
fi


FALS=0
SICK=0


if [ $PCI -gt 0 ] > /dev/null 2>&1
	then 
	    if [ $RUNS = 5 ] 
	    then
	    
	    sleep 0.01 ### ESCAPING here - this will be done further down at a specific case ( F is OPLC device 0 ... can't put this in logics here ..) 
	   
	    else 
	    ((OPCL+=1)) ### DEBUGGIN
	    fi
	    
	    if [ -f $NAME ] ; then ### Check if we actualy have a typescript file ( only working GPU will have one )  
	    
	    ### This is the DAG creation check 
		
		
		tail --lines=1500 /home/bash/$NAME | grep hashes | grep -o 'PoWhash.* ' | sed 's/^.\{28\}//g' | sed 's/://g' | sed 's/[=].*$//' | sed 's/[H/s].*$//' | tail --lines=650 > /home/bash/awe
		cat awe | awk 'NR == 1 { max=$1; min=$1; sum=0 }
			      { if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1;}
			      END {printf "Min: %d\tMax: %d\tAverage: %f\n", min, max, sum/NR}' | grep -o 'Max.*' | sed 's/Max:.//' | sed 's/A.*//' > /home/bash/awe1
		
		

###################################################################################		  
                ### This is the time of hash vs current date calculator 
                date_a=$(date +"%H:%M:%S") ### This is current time 
                CAL=$(tail --lines=1200 /home/bash/$NAME | tail --lines=30 | grep hashes | tail --lines=1 | sed 's/miner .//' | sed 's/^.\{0,5\}//g' | sed 's/[^[[35m] //' | awk -F'ethminer' '{print $1 ","}' | sed 's/ [^[[0m^[[30m|^[[34m,] //')
                TSICK=$(echo $CAL | sed 's/[^0-9:.]*//g' | sed -e 's/^\(.\{10\}\).*/\1/' |  sed 's/[35]//' | sed 's/[5]//') ### this is last has timestamp avail;able in typescript file 

                ### Prototype : Need to see the diff from the timestamp and the date 


	old=$TSICK
	new=$(date +"%H:%M:%S")
	
	echo " $new - the timestamp "  ### DEBUGG
	echo " $old - the current time " ### DEBUGG
		### feeding variables by using read and splitting with IFS
		IFS=: read old_hour old_min old_sec <<< "$old"
		IFS=: read hour min sec <<< "$new"

		### convert hours to minutes and seconds
		### the 10# is there to avoid errors with leading zeros
		### by telling bash that we use base 10
		total_old_minutes=$((10#$old_hour*60 + 10#$old_min*60 + 10#$old_sec))
		total_minutes=$((10#$hour*60 + 10#$min*60 + 10#$sec))


              #GMT=2
              #GMTv=$((  $GMT * 60  * 60)) ### Need to set correct GMT or the script will error 
              sleep 1
              #TIMEOUT=$(( ((((timeComs + $GMTv) - (timenow + $GMTv)) +60 ) )))
                 #TIMEOUT=$(( ((((timeComs + $GMTv) + (sec_dif + $GMTv)) - (timenow + $GMTv)) +60 ) ))
                #echo $TIMEOUT
                DIFF=$(echo "$((total_minutes - total_old_minutes))")
                if [ $DIFF -gt 30 ] 
		  
		    #if [ $DIFF -lt -100 ] ### This is an error override 
			#then 
			#rm /home/bash/$NAME
		    #fi
		  
                then 
                SICK=1
                echo " there is a $DIFF sec lag on hash check - GPU is sick ! " ### GPU is normal condition 

                else 
                echo "the difference is $((total_minutes - total_old_minutes)) sec" ### Here we have declared the GPU sick 
                fi

####################################################################################		
		### This is the hasrate script and stability calculator 
		HA=$(<awe1)
		HS=0
		HS=$(tail --lines=300 /home/bash/$NAME| grep hashes | grep -o 'PoWhash.* ' | sed 's/^.\{28\}//g' | sed 's/://g' | sed 's/[=].*$//' | sed 's/[H/s].*$//' | tail --lines=160 | perl -lane '$a+=$_ for(@F);$f+=scalar(@F);END{print "H/s = ".$a/$f}' |  sed 's/[.].*$//' | sed 's|H/s =.||' )
		if [ $HS -gt 30000000 ] ; then Unst=$(expr $HA \* 958 / 1000 ) ; VUnst=$(expr $HA \* 92 / 100 ) ;fi ## DEBUGG values is 955 | 88     | Calcualtion : we take the MAX hashrate "HA"
		  if [ $HS -gt 25000000 ] ; then Unst=$(expr $HA \* 928 / 1000 ) ; VUnst=$(expr $HA \* 89 / 100 ) ;fi ## DEBUGG values is 925 | 86   | and check against HS witch is the Average hashrate"HS"
		    if [ $HS -gt 18000000 ] ; then Unst=$(expr $HA \* 882 / 1000 ) ; VUnst=$(expr $HA \* 83 / 100 ) ;fi ## DEBUGG values is 882 | 83 | if they differ by e given % then GPU (VERY) unstable 
		#T=$(amdconfig --adapter=$OPCL --odgt | grep 'Temperature' | cut -d'-' -f2 | cut -d'.' -f1 | tr -d ' ')
fi
		
		
		
		echo " " > /home/bash/Splash$WORKER.sh 
		### Here we need to wait for typescript to actualy have some info ...
		
		      if [ $RUNS = 5 ] ; then
				T=$(amdconfig --adapter=0 --odgt | grep 'Temperature' | cut -d'-' -f2 | cut -d'.' -f1 | tr -d ' ') ### There is a bug here .. Worker F IS opencl device 0 ! I hardcoded it here 
				/bin/echo -e "\e[1;30m    SLOT $SLOT installed - $WORKER is OpenClDevice 0  " >> /home/bash/Splash$WORKER.sh   ## GREEN
			else
				T=$(amdconfig --adapter=$OPCL --odgt | grep 'Temperature' | cut -d'-' -f2 | cut -d'.' -f1 | tr -d ' ')
				/bin/echo -e "\e[1;30m    SLOT $SLOT installed - $WORKER is OpenClDevice $OPCL  " >> /home/bash/Splash$WORKER.sh   ## GREEN
		      fi
		    
		    
		### Temp Color conditions 
		if [ $T -gt 40 ] ; then CT=$(/bin/echo -e "\e[1;34m $T \e[0m" ) ;fi ## BLUE 
		  if [ $T -lt 30 ] ; then CT=$(/bin/echo -e "\e[0;34m $T \e[0m" ) ;fi ## Blue 
		    if [ $T -gt 30 ] ; then CT=$(/bin/echo -e "\e[1;34m $T \e[0m" ) ;fi ## Light Blue 
		      if [ $T -gt 50 ] ; then CT=$(/bin/echo -e "\e[1;32m $T \e[0m" ) ;fi ## Light Green 
			if [ $T -gt 58 ] ; then CT=$(/bin/echo -e "\e[0;32m $T \e[0m" ) ;fi  ## green 
			  if [ $T -gt 65 ] ; then CT=$(/bin/echo -e "\e[0;32m $T \e[0m" ) ;fi ## Brown/Orange ### Edit changed to green 17.06 
			    if [ $T -gt 70 ] ; then CT=$(/bin/echo -e "\e[1;33m $T \e[0m" ) ;fi ## Yellow 
			      if [ $T -gt 77 ] ; then CT=$(/bin/echo -e "\033[0;93m $T \e[0m" ) ;fi ##light Yellow 
				if [ $T -gt 84 ] ; then CT=$(/bin/echo -e "\e[1;31m $T \e[0m" ) ;fi ## Light Red 
				  if [ $T -gt 86 ] ; then CT=$(/bin/echo -e "\e[0;31m $T \e[0m" ) ;fi ## Red
				   if [ $T -gt 87 ] ; then CT=$(/bin/echo -e "\033[2;103m $T \e[0m") ;fi ## YELLOW BACKGROUND !!
				    if [ $T -gt 92 ] ; then CT=$(/bin/echo -e "\033[0;101m $T \e[0m" ) ;fi  ## RED BACKGROUND !! 
	    ##RETURN
	    
sleep 0.05






##############################################################################
 ### Scketchup Temp control script TODO : Still has errors .. script will stop fans on hot GPU's and start on cold ones ... it has something to do with the location of the GPU vs the name of the GPU 
 ### Do not enable until fixed .. 
##############################################################################


if [ $RUNS = 5 ]
then DEVICE=0
else DEVICE=$OPCL
fi 


 ### TODO : Every GPU needs a target temp , and a default if Tarantula fails to provide one - I will use CommitPort for this 
 ### Target temp sesitivity should be 5-10 C* for Fan change ... will use the same Sleep as for Temp fetch .. and run with that temp ...
 if [ $TEMPCONTROL = 1 ] ; then 
 ### DEBUGG
  TG=$TARGETTEMP
  FAN=$( DISPLAY=:0.$DEVICE aticonfig --pplib-cmd "get fanspeed 0" | grep Result | awk '{print $4}' | sed 's/[%]//' | sed '/^$/d;s/[[:blank:]]//g' )
  CLOCK=$( amdconfig --od-getclocks --adapter=$DEVICE | grep Peak | awk '{print $4}' | sed 's/[:]//' |head --lines=1 | sed '/^$/d;s/[[:blank:]]//g' )
  PCLOCK=$CLOCK
    #DISPLAY=:0.$i aticonfig --pplib-cmd "get fanspeed 0"
  
  
  
  echo " @@@ "
  echo " Temp is $T , FAN @ $FAN% , Clock is $CLOCK and Target temp is $TG "

  if [ $TG -gt $T ] 
      then ### THE CARD IS COLDER !
	  TARGET=$( expr $TG - $T )
	  if [ $TARGET -gt 3 ] ; then TARGETT=3 ; fi
	  REFAN=$( expr $FAN - $TARGETT )
	    
		if [ $REFAN -lt 35 ] ### Failsafe for out of range values
		     then REFAN=35 
		fi

	  /bin/echo -e "\e[1;34m $WORKER We will substract $TARGETT to fan speed as the Card is to COLD | New fanspeed is $REFAN \e[0m"
	  FAN=$(echo "\e[14;32mFan @  $REFAN% \e[0m")
	   DISPLAY=:0.$DEVICE /usr/bin/aticonfig --pplib-cmd  " set fanspeed 0 $REFAN  " 
  
      else ### THE CARD IS HOTTER !
	  TARGET=$( expr $T - $TG )
	  TARGETT=$( echo "${TARGET%.*}" )
	  REFAN=$( expr $FAN + $TARGETT )
	  
	    
		if [ $REFAN -gt 99 ] ### Failsafe for out of range values
		    then 
		    REFAN=100 
		    FAN=$(echo "\e[14;33mFan @ $REFAN% \e[0m")
		    else
		    FAN=$(echo "\e[14;33mFan @  $REFAN% \e[0m")
		fi
	    if [ $T -gt $MAXTEMP ] ; then REFAN=100 ; fi 
	  /bin/echo -e "\e[0;31m $WORKER We will add $TARGETT to fan speed as the Card is to HOT | New fanspeed is $REFAN \e[0m"
	   DISPLAY=:0.$DEVICE /usr/bin/aticonfig --pplib-cmd  " set fanspeed 0 $REFAN  " 
	  
  fi
	sleep 0.5 
	echo " Set the fan speed for $WORKER with string $STRING @ $REFAN % "
	if [ $REFAN -lt 100 ] ; then 
	REFAN=$(echo " $REFAN")
	
	if [ $TG = $T ] ; then 
	    if [ $REFAN -gt 99 ] ### Failsafe for out of range values
	    then 
	      REFAN=100 
	      FAN=$(echo "\e[3;36mFan @ $REFAN% \e[0m")
	    else
	      FAN=$(echo "\e[3;36mFan @ $REFAN% \e[0m")
	    fi
	fi
fi

  
  
  
  
fi ### For Tempcontrol VAR 
################################### - END - ###########################################################




#######################################################################################################
 ### This is ClockControl script
 
if [ $CLOCKCONTROL = 1 ] ; then ### Is enabled ? 
 ### The Vars 
TG=$TARGETTEMP ### Reformating that 
if [ ! $TEMPCONTROL = 1 ] ; then ### This is so I do not recheck the clock ... if TEMPCONTROL is WORKING I have my clock already , no need to ask the GPU again.
 CLOCK=$( amdconfig --od-getclocks --adapter=$DEVICE | grep Peak | awk '{print $4}' | sed 's/[:]//' | head --lines=1 | sed '/^$/d;s/[[:blank:]]//g' )
fi

 ### Clock control - The actual script 
 if [ $T -gt $MAXTEMP ] 
    then ### we go for downclock
	echo " Entering Reclock condition as GPU is hot : $T.c... and maxtemp is $MAXTEMP.c"
 
	vT=$(amdconfig --adapter=$DEVICE --odgt | grep Temperature | sed 's/[.]/ /' | awk '{print $5}')
    
	if [ $T = $vT ]  ### Entering clock down condition  
		then ### This is double verification - I do not want to downclock the wrong adapter .... 
		#CLOCK=$( amdconfig --od-getclocks --adapter=$DEVICE | grep Peak | awk '{print $4}' | sed 's/[:]//' |head --lines=1 | sed '/^$/d;s/[[:blank:]]//g' )
		DISPLAY=:0.$DEVICE /usr/bin/aticonfig --pplib-cmd  " set fanspeed 0 100  " ### Just to be sure we are gonna push the Fans @ 100% 
		RECLOCK=$(expr $CLOCK - 2 ) ### Downclock calculation ... I might have a dinamic calculation here .. but well .. lazy 
		WHO=$( echo "$WORKER" | sed 's/[.]/ /' | awk '{print $2}' )
		echo " Executting clocks for adapter=$DEVICE with $RECLOCK core for worker $WHO" ### Information 
		amdconfig --odsc=$RECLOCK,$MEM --adapter=$DEVICE  ### Set the new clock
		if [ $RECLOCK -gt 999 ] ; then ### Splash shaping 
		PCLOCKP=$( /bin/echo -e "\e[1;33m$RECLOCK\e[0m" ) ### Format the new clock number 1000 + (I want to see the new clocks YELLOW ) 
					else
		PCLOCKP=$( /bin/echo -e "\e[1;33m $RECLOCK\e[0m" ) ### Format the new clock number 999 - (I want to see the new clocks YELLOW )
		fi
		  ### Figguring out which worker to edit and use for Splash next 
		    
		    char="$WHO"
		      if   [ "$char" == "A" ] ; then CLOCKA=$PCLOCKP
		      elif [ "$char" == "B" ] ; then CLOCKB=$PCLOCKP
		      elif [ "$char" == "C" ] ; then CLOCKC=$PCLOCKP
		      elif [ "$char" == "D" ] ; then CLOCKD=$PCLOCKP
		      elif [ "$char" == "E" ] ; then CLOCKE=$PCLOCKP
		      elif [ "$char" == "F" ] ; then CLOCKF=$PCLOCKP
		      fi
		      CLK=$PCLOCKP ### For instant print 
		else 
		echo " I have encountered an error : Given Temp is $T and adapter Temp is $vT : they do not match - It might be a location error , anyways not going to touch the adapter"
	fi
	
	
fi
 ### CLOCKSCRIPT END 

fi ### For CLOCKCONTROL VAR 

#################################### - END - ############################################################



#################################### 
 ### SPLASH CASES 
################################
PRINT=0
DAGFLAG=0
INFO=$( cat $NAME | wc -l )
		### CASE : Boot up Splash 
	#if [ $INFO -lt 10 ]  ### Booting up print 
	#	    then 
	#	    /bin/echo -e "  \033[1;97m=== Stats : \e[1;32m H/s= Booting up ... temp is $CT $CLK;$MEM   " >> /home/bash/Splash$WORKER.sh
	#	    PRINT=1
	#fi
		
		### CASE : DAG creation identification 
	if [ $PRINT = 0 ]  ### Check if we double printed this 
		then 
		
		DAGCHECK=$( tail --lines=500 /home/bash/$NAME | grep DAG | grep Progress | wc -l )
		if [ $DAGCHECK -gt 1 ] 
		      then
		      PRINT=1
		      DAGFLAG=1
		      DAGFINISHED=0
		      DAGFINISHED=$( tail --lines=3000 /home/bash/$NAME | grep DAG | grep -v "Creating" | grep 100 | wc -l )
		      
		      
		       $UFL=$( cat mining )
		       $DFL=$( cat miningcom )
		      
		      
			    if [ $DAGFINISHED -gt 0 ] ### here ve see DAG has finished and we execute an auto commit just to sure all workers are started again 
				  then 
				  /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m DAG COMPLETED Recommit \e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
				  sleep 2
				  cp /home/bash/Commit /home/bash/CommitNOW
				  sleep 20
				  exit 0
				  #DAGFLAG=1
				  #PRINT=1
			    
			    else
			    
				PR=$(tail --lines=300 /home/bash/$NAME | grep DAG | grep -o 'Progress.* ' | grep -v "Creating" |  grep -o -E '[0-9..]+' | sed 's/[0]//' |  sed '/^$/d;s/[[:blank:]]//g' | tail --lines=3 | wc -l )
				   if [ $PR -gt 0 ] 
				      then ### It is GENERATING the DAG 
					  PR=$(tail --lines=100 /home/bash/$NAME | grep DAG | grep -o 'Progress.* ' |  grep -o -E '[0-9..]+' | sed 's/[0]//' |  sed '/^$/d;s/[[:blank:]]//g' | tail --lines=1 )
					  /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m  GENERATING DAG $PR %  \e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
					  PRINT=1
					  DAGFLAG=1
				      else 
					  PR=$(tail --lines=100 /home/bash/$NAME | grep DAG | grep -o 'Progress.* ' |  grep -o -E '[0-9..]+' | sed 's/[0]//' |  sed '/^$/d;s/[[:blank:]]//g' | tail --lines=1 )
					  /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;31m   CREATING  DAG $PR %  \e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
					  PRINT=1
					  DAGFLAG=1
					  
				   fi
			    fi
		  fi    
	fi ### for PRINTVAR
		
		
	### CASE : Booting UP Splash 	
	if [ $PRINT = 0 ] ; then ### Check if we double printed this 
		  if [ $INFO -lt 100 ]  ### Booting up print 
		    then 
		    /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m H/s= Booting up ...   \e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
		    ASKGRACE=1
		    PRINT=1
		  fi
	fi
		
		
		
		
	### CASE : SICK SPLASH AND FLAG 	
	if [ $PRINT = 0 ] ; then ### Check if we double printed this 
	    if  [ $SICK = 1 ] ; then ### Sick Print - if we have a SICKFKLAG 
		  /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m H/s= $HS\033[1;31m !_SICK_!\e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
		  PRINT=1
		  fi
	fi ### for PRINTVAR
		
		
		
	### CASE : DONNATION SPLASH AND FLAG 	
	if [ $PRINT = 0 ] ; then ### Check if we double printed this 
		  if [ -f $COMFLAGFILE ] ; then ### Commisionflag ? PRINT COMMISIONING ! 
			if [ $DUALMINING = 1 ] ; then HSC=$(expr $HS \* 2 )
			  /bin/echo -e "  \033[1;97m==Stats: $UFL|$DFL\e[1;32m H/s= $HSC\e[1;34m DONATION\e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
			   else
			  /bin/echo -e "  \033[1;97m==Stats:  *$DFL* \e[1;32m H/s= $HSC\e[1;34m DONATION\e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
			  fi
		  PRINT=1
		  fi
	fi ### For PRINT VAR
		    
		
		
		
		
		
	### CASE : STABILITY SPLASH - last case but best one 	
	if [ $PRINT = 0 ] ; then ### Check if we double printed this 
		
		  if [ $VUnst -gt $HS ]  
		    then 
			/bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m H/s= $HS\033[1;31m UNSTABLE\e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
		    else
		      if [ $Unst -gt $HS ]
			 then 
			    /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m H/s= $HS\e[0;33m UNSTABLE\e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh
			   else
			    /bin/echo -e "  \033[1;97m=== Stats: $UFL  \e[1;32m H/s= $HS\e[1;34m  STABLE \e[0m temp is $CT $FAN $CLK;$MEM  " >> /home/bash/Splash$WORKER.sh 
		      fi
		   fi
	fi ### For PRINT VAR 
	    
	    
	    
	    
	    
	    date_a=$(date +"%H:%M:%S") ### | Rechecking time to be precise 
	    sleep 0.05
	    
	   
	    
	    S1=$(lspci -v | grep VGA | grep 0$SLOT | grep -o 'AMD/ATI.* ' |  sed 's|AMD/ATI].||' |   sed 's/(.*//' )
		S2=$(lspci -v | grep 0$SLOT -A 1 | grep VGA -A 1  | grep Subsystem  |  sed 's/Subsystem.//' | awk 'BEGIN{FS=OFS=","} {gsub(/^[ \t]+|[ \t]+$/, "", $1)}1' ) 
		/bin/echo -e "  \033[1;30m    $S1 $S2 \e[0m "  >> /home/bash/Splash$WORKER.sh
		
		echo " TEMP=$T ">> /home/bash/Splash$WORKER.sh
		

		sleep 0.05
		
		
		if    [ $DAGFLAG = 1 ] ; then 
		    echo " SICK=0 ">> /home/bash/Splash$WORKER.sh
		    echo " DATE $date_a  " >> /home/bash/Splash$WORKER.sh 
		    echo " ASKGRACE=1" >> /home/bash/Splash$WORKER.sh 
		    else
		    
		if  [ $SICK = 1 ] ; then 
		  echo " SICK=1 ">> /home/bash/Splash$WORKER.sh
		  #echo " DATE $TSICK " >> /home/bash/Splash$WORKER.sh 
		  echo " DATE $date_a  " >> /home/bash/Splash$WORKER.sh 
		  echo " ASKGRACE=0" >> /home/bash/Splash$WORKER.sh 
		
		    else
		  echo " SICK=0 ">> /home/bash/Splash$WORKER.sh
		  echo " DATE $date_a  " >> /home/bash/Splash$WORKER.sh 
		  echo " ASKGRACE=$ASKGRACE" >> /home/bash/Splash$WORKER.sh 
		fi;fi
	else
		#echo "    ---------------------------------- " > /home/bash/Splash$WORKER.sh 
		/bin/echo -e "\e[1;33m    No GPU ! $WORKER DISABLED on slot $SLOT \e[0m"  > /home/bash/Splash$WORKER.sh ## YELLOW
		echo "    ---------------------------------- " >> /home/bash/Splash$WORKER.sh 
		FALS=1
		HS=0
fi


SICK=0


if [ ! -f /home/bash/$NAME ] ; then 
HS=0
else 

 if [ -f $COMFLAGFILE ]
      then ### Need to claculate the full hasrate in the AVG hasrate calcultaion 
	  if [ $DUALMINING = 1 ] ; then 
		HSC=$(expr $HS \* 2 )
		else
		HSC=$HS
	  fi
      else 
      HSC=$HS
 fi    
sleep 0.05
 
 
 
 ### Hacked here ... it should be fetched in the previous condition .. but ,, 
 
 
 
fi
  ### This is the AVG M/h script 
if [ $FALS = 0 ] ; then 
    if [ $RUNS = 6 ] ; then  HSAM=$HSC ; fi
    if [ $RUNS = 5 ] ; then  HSFM=$HSC ; fi
    if [ $RUNS = 4 ] ; then  HSBM=$HSC ; fi
    if [ $RUNS = 3 ] ; then  HSCM=$HSC ; fi
    if [ $RUNS = 2 ] ; then  HSDM=$HSC ; fi
    if [ $RUNS = 1 ] ; then  HSEM=$HSC ; fi
fi

sleep 0.05 
ASKGRACE=0
done ### The LOOP 

SPLASH=1 ### This is the fast splash canceler

HSTAVG=$( expr $HSAM + $HSBM + $HSCM + $HSDM + $HSEM + $HSFM )
if [ -f /home/bash/CommitNOW ] ; then 
exit 0 
fi


done ### The script LOOP 
fi

sleep 5

exit 0




