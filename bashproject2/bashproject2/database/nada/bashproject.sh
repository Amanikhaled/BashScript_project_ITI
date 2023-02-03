#!/bin/bash


file=`find $PWD -name "database"` 2> .file

if  [[ -z $file ]]
then
        mkdir database 2> .file
        
else

select choice in  "show databases" "create database" "connect database" "drop database" "exit"
	do
		

case $choice in
	"show databases")
		
		ls ./database
		;;
	"create database")
		
		echo "enter your database name : "
		read name
		source .checkname.sh
		dn=`find ./database -name "$name"` 
		if [ -z $dn  ]
		then  mkdir ./database/$name

		       content=`ls -af  `
			
	             cp  $content  database/$name 2> .file
		else
		   echo "$name database  exists"
		fi

		;;
	"connect database")
	echo "enter your database name : "
                read name
                
                if [ -d ./database/$name  ]
		then
		 cd ./database/$name
                     source .Menu.sh 	
                
                else
                   
echo "$name database doesn't exists"
                          
                fi

                ;;
	"drop database")
		
		echo "enter your database name : "

		 read name
                dn=`find ./database -name "$name"`
                if [ -z $dn  ]
                then
                        echo "$name database doesn't exists"

                else
			
                    rm  -r  database/$name
                fi
		;;

	"exit")
		break
		;;
esac
done
fi

