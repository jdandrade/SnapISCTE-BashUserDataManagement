#!/bin/bash

if [ -f backup/backup_SnapISCTE_$(date "+%Y_%m_%d").zip ]; then

	echo "Ficheiro já existente. Deseja substituir? (S/N)"
	read resposta
	if echo $resposta | grep -iq s ; then
		zip -rp backup/backup_SnapISCTE_$(date "+%Y_%m_%d").zip users/utilizadores.txt users/network_*
	elif echo $resposta | grep -iq n ; then
		echo "Operação ZIP não executada!"
	fi
else

	zip -rp backup/backup_SnapISCTE_$(date "+%Y_%m_%d").zip users/utilizadores.txt users/network_*

fi
exit 0
