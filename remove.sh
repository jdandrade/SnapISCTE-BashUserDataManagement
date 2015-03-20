#!/bin/bash

verificauser(){

	cd users

	existe=$( cat utilizadores.txt | awk -F',' '{print $1}' | grep -x "$1" | wc -l )

	if [ "$existe" -eq 1 ]; then

 		echo "Utilizador existente!"

	else

 		echo "Utilizador não existente!"
		cd ..
		exit 0

	fi
cd ..
}

verificauser $1
verificauser $2

cd users
username=$(echo "$1" | sed s/@/./)
existe=$( grep "$2" network_$username | wc -l )

if [ "$existe" -eq 1 ]; then
 
	cat network_$username |  sed "/$2/d" >> temp_network
	mv temp_network network_$username
	echo "Operação bem sucedida. $2 já não faz parte da lista de amigos de $1!"

else

	echo "Amizade inexistente. Insucesso na operação realizada!"
	cd ..
	exit 0

fi

cd ..
exit 0
