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


arr[1]="1. Criação de user"
arr[2]="2. Adicionar ligação entre utilizadores"
arr[3]="3. Remoção de ligação"
arr[4]="4. Backup"
arr[5]="5. Estatisticas"
arr[6]="6. Sair"


opcao=0
                 while [ $opcao != 6 ]
                        do


				echo "~~~~~~~~~~~~~ BEM-VINDO ~~~~~~~~~~~~~"
				echo "Administração SnapISCTE"

					for i in "${arr[@]}"
						do
							echo $i
						done

				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

	
				echo "Escolha uma opção"
			read opcao

				if [ "$opcao" == 1 ]; then
					echo "~~~~~~~~~~~~~ MODO CRIAÇÃO DE USER ~~~~~~~~~~~~~"
					./novo_util.sh

				elif [ "$opcao" == 2 ]; then
					echo "~~~~~~~~~~~~~ ADICIONAR AMIGO ~~~~~~~~~~~~~"
					./adiciona.sh

				elif [ "$opcao" == 3 ]; then
					echo "~~~~~~~~~~~~~ REMOVER AMIGO ~~~~~~~~~~~~~"
					
					echo "Escreva o nome de utilizador (email)"
					read user
					verificauser $user
					echo

					echo "Escreva o nome do amigo a remover (email)" 
					read amigo
					verificauser $amigo
					echo

					./remove.sh $user $amigo

				elif [ "$opcao" == 4 ]; then
					echo "~~~~~~~~~~~~~ BACKUP DOS USERS ~~~~~~~~~~~~~"
					./backup.sh

				elif [ "$opcao" == 5 ]; then
					echo "~~~~~~~~~~~~~ ESTATISTICAS ~~~~~~~~~~~~~"
					./estatisticas.sh

				else [ "$opcao" == 6 ]
					echo "A sair... Volte sempre!"
					exit 0

				fi
			done
exit 0
