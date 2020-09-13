#!/usr/bin/env bash

# bold="\e[1m"
# green="\e[92m"
# red="\e[91m"
# gray="\e[37m"
# cyan="\e[96m"
# yellow="\e[93m"
# magenta="\e[95m"
# blue="\e[34m"
# normal="\e[0m"

# Especificar as partições que quer imprimir separadas por espaços;
partitionS="/dev/sdb4 /dev/sdb7 /dev/sda3"
# Especificar os ícones em ordem com a $partitionS, separadas por espaços;
iconS=("" "" "")
# Especificar as cores em ordem com os $iconS, separadas por espaços;
colorIconS=("#68F245" "#f35B51" "#427C77")
# Altere [ sed 's/\/home\/losaoall//g ] por [ sed 's/\/home\/SeuUser//g ] 
base=$(df -h $partitionS |awk '{print " "$6" "$3" "$5" de "$2}'|sed '1d'|sed 's/\/home\/losaoall\///g')

for (( i = 0; i <= $((${#iconS[@]}-1)); i++ ))
{
	echo -ne "%{F${colorIconS[${i}]}} ${iconS[$i]} %{F-}$(sed -n ''$(($i+1))'p' <<< "$base") "
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