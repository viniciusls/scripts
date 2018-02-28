#!/bin/bash
#Autor: @jeanrafaellourenco
#Sorteia uma frase aleatória para finalidades diversas.

#ini e end definem o range de números a serem sorteados, o valor de end varia de acordo com o tamanho do array.
ini="1"
end="4"

#Array de frases aleatórias 
#frase=( "Procuramos fazer o possível para não passarmos vergonha!" "É só um if!" "Precisa fazer um refactor!" "Você pode contar sempre com a equipe de condominios")
#Ou
frase[0]="Procuramos fazer o possível para não passarmos vergonha!"
frase[1]="Precisa fazer um refactor!"
frase[2]="Anota a sugestão."
frase[3]="Todo dia um 7x1 diferente!"
frase[4]="É só um if!"


# sorteia um número entre $ini e $end
num_sort=$((RANDOM%$end+$ini))

# mostra a frase que corresponde ao número sorteado
echo -e "${frase[$num_sort]}"
