#!/bin/bash

echo "Contagem do número de alunos por licenciatura"

	cat users/utilizadores.txt | awk -F',' '{print $3}'| sort | uniq -ic | sort -r
echo

echo "Cinco principais dominios de emails dos utilizadores registados"

	cat users/utilizadores.txt | awk -F',' '{print $1}' | awk -F'@' '{print $2}' | sort | uniq -c | sort -r | head -5
echo

echo "Utilizador com mais ligações"

	topligacoes=$( wc -l users/network_* | sort -r | grep -v "total" | head -1 )
	numero=$( echo "$topligacoes" | awk '{print $1}' )
	ficheiro=$( echo "$topligacoes" | awk -F'users/network_' '{print $2}' )
	echo "$ficheiro - $numero ligações"
echo

echo "Licenciatura com mais ligações"

	cursos=$( cat users/utilizadores.txt | awk -F',' '{print $3}' | sort | uniq -c | awk '{print $2}' )

		for c in $cursos; do

			sum=0
	
			users=$( cat users/utilizadores.txt | grep "$c" | awk -F',' '{print $1}')

			for u in $users; do

				if [ "$( cat users/utilizadores.txt | grep "$u" | awk -F',' '{print $3}' )" == "$c" ]; then

				utilizador=$( echo "$u" | sed s/@/./ )
		
				lines=$( cat users/network_$utilizador | wc -l )		
				sum=$(( $sum + $lines ))
				fi

			done
			subtotal=$( echo "$c-$sum" | uniq )
			echo "$subtotal" >> tmp.txt
		
 		done

	cat tmp.txt | sort -r | head -1
	rm tmp.txt
echo

echo "Mês do ano em que mais ligações foram estabelecidas"

	cat users/network_* | awk '{print $1}' | awk -F'-' '{print $1,$2}' | sort | uniq -c | sort -n | head -1 | awk -F' ' '{print $3, $2}'
echo

exit 0
