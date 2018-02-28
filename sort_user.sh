#!/bin/bash

# sort_user.sh
# Autor: Marcos Castro
# O programa recebe um arquivo contendo em cada 
# linha o nome de uma pessoa e sorteia uma das pessoas

################################################
# Exemplo de conteúdo do arquivo:
# João
# Maria
# Marcos
# Yankee
# Catarina
# Pedro
#################################################

# o comando cat com a opção -n atribui um índice para cada linha
# o comando head -1 pega a primeira linha
# o comando tail -1 pega a última linha
# o comando cut -f 1 seleciona o primeiro campo que é o índice (número)
# ini é o número inicial
# end é o número final
# ini e end serão usados para sortear um número
ini=`cat $1 -n | head -1 | cut -f 1`
end=`cat $1 -n | tail -1 | cut -f 1`

dados=`cat $1 -n`

echo -e "\nParticiparão do sorteio:"
echo -e "$dados"
printf "\nSorteando"

# conta de 1 até 5 (dorme no total 5 segundos)
for ((i=1; i <= 5 ; i++))
do
	sleep 1 # dorme 1 segundo
	echo -e ".\c" # imprime o ponto sem quebra de linha
done

echo -e "\n"

# sorteia um número entre $ini e $end
num_sort=$((RANDOM%$end+$ini))

# mostra o número sorteado
echo -e "Número sorteado: $num_sort\n"

# agora é preciso saber quem é a pessoa sorteada associada ao $num_sort
# o grep procura por algum padrão e o cut seleciona o campo 2 (nome da pessoa)
nome_sort=`cat $1 -n | grep $num_sort | cut -f 2`

# mostra o nome associado ao número sorteado
echo -e "Nome do vencedor(a): $nome_sort\n"