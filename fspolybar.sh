#!/usr/bin/env bash

# Especificar as partições que quer imprimir separadas por espaços;
partitionS="/dev/sdb4 /dev/sdb7 /dev/sda3"
# Especificar os ícones em ordem com a $partitionS, separadas por espaços;
iconS=("" "" "")
# Base
base=$(df -h $partitionS |awk '{print " "$3" "$5" de "$2}'|sed '1d')

for (( i = 0; i <= $((${#iconS[@]}-1)); i++ ))
{
	echo -n "| ${iconS[$i]} $(sed -n ''$(($i+1))'p' <<< "$base") "
}


#
#  Modelo de configuração do módulo na config da polybar
# [module/filesystem]
# type = custom/script
# interval = 120
# exec = echo "$(sh ~/caminho/fspolybar.sh)"
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