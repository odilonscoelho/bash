#!/usr/bin/env bash

# A ordem em que as partições são especificadas definem a ordem que os $iconS e $colorIconS 
# correspondentes a cada partição tem que ser informado
# Especificar as partições que quer imprimir separadas por espaços;
partitionS="/dev/sdb4 /dev/sdb7 /dev/sda3"
# Especificar os ícones em ordem com a $partitionS, separadas por espaços;
iconS=("" "" "") #
# Especificar as cores em ordem com os $iconS, separadas por espaços;
colorIconS=("#68F245" "#427C77" "#f35B51")
# Espefificar as fontes que quer Usar, a polybar é baseada em font-0
# para fonte-1 escolha "2";
fontIconS=("3" "3" "2")
# Altere [ sed 's/\/home\/losaoall//g ] por [ sed 's/\/home\/SeuUser//g ] 
base=$(df -h $partitionS |awk '{print " "$6" "$3" "$5" de "$2}'|sed '1d'|sed 's/\/home\/losaoall\///g')

for (( i = 0; i <= $((${#iconS[@]}-1)); i++ ))
{
	echo -ne "  %{F${colorIconS[${i}]}}%{T${fontIconS[${i}]}}${iconS[$i]} %{F- T-}$(sed -n ''$(($i+1))'p' <<< "$base")  "
}


#
#  Modelo de configuração do módulo na config da polybar
# [module/filesystem]
# type = custom/script
# interval = 120
# exec = bash ~/caminho/fspolybar.sh
# tail = true
# format-padding = 1
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#