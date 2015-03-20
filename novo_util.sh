#!/bin/bash

verificauser(){
cd users

existe=$( cat utilizadores.txt | awk -F',' '{print $1}' | grep -x "$1" | wc -l )

if [ "$existe" -eq 1 ]; then

	echo "Utilizador já existente!!!"
	cd ..
	exit 0

fi

cd ..
}


echo "Username(e-mail)?"
read username
verificauser $username

echo "Nome completo"
read nome

echo "Curso?"
read curso

curso=$( echo $curso | awk '{print toupper($0)}' )

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n +1)


email=$ echo "A sua password e: $password , por favor altere a mesma." | mail -s "Password SnapISCTE" $username

pwsha1um=$( echo "$password" | sha1sum | awk '{print $1}' )

echo "$username,$nome,$curso,$pwsha1um" >> users/utilizadores.txt

utilizador=$(echo "$username" | sed s/@/./)

nomeficheiro=$(echo "network_$utilizador")


touch users/$nomeficheiro

exit 0
