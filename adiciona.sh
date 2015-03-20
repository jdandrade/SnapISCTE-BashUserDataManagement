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

echo "Insira o User (e-mail)."
read utilizador

verificauser $utilizador

echo "Insira o User do amigo a adicionar (e-mail)."
read amigo

verificauser $amigo

username=$(echo "$utilizador" | sed s/@/./)

echo "$( date +%Y-%m-%d ) $amigo" >> users/network_$username
echo
echo "Operação bem sucedida. $amigo faz parte da lista de amigos de $utilizador!"
echo
exit 0
