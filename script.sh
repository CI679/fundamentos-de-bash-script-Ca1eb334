#!/bin/bash

#Tipos de variables: Universal -> Numero, Bool o una cadena
n1=10
n2=7
echo "El valor de n1 es $n1" #Se antepone $ para referirse al vlaoe de la variable

#Estructuras de control condicionales
#Operadores condicionales <(-lt)  >(-gt) <=(-le) >=(-ge) ==(-eq)  !-(-ne)

if [[ $n1 -gt $n2 ]]; then #Important los espacios
	echo "La sentencia es verdadera $n1 > $n2."
else #puede o no haber else
	echo "La secuencia es galsa $n1 > $n2."
fi

#Todo programa regresa un valor, si es exitose es 0
ls
res=$?
echo "El resultado de la ejecucion fue exitosa es $res."
ls
if [[ $? -eq 0 ]]; then
	echo "La sentencia se ejecuto correctamente."
else
	echo "La sentencia no se ejecuto correctamente."
fi

#Operadores para manipular archivos
# -e Si un archivo o carpeta existe
# -d Nos indica si es una carpeta
# -r -w -x (Si puede leer, escribir o ejecutar)
# -s Si el archivo esta vacio

file="./file-demo"

if [[ -s $file ]]; then
	echo "El archivo esta vacio."
else
	echo "El archivo contiene algo."
fi

#Operadores logicos AND (&&) OR (||)

if [ -r $file ] && [ -x $file ]; then
	echo "El archivo se puede leer y ejecutar"
else
	echo "El archivo no se puede leer ni ejecutar"
fi

#Estructura de control case 

#$ = array donde $# ($1, $2, $3 . . $n) -h//bandera hola//parametro

case $1 in 
	hola )
		echo "Bienvenido"
	;;
	adios)
		echo "Adios"
	;;
	*) #Comodin por eso no lleva espacio
		echo "No entiendo lo que dices"
	;;
esac

#Estructuras iterativas
#Leer un valor que pide el script

#While
user=""
while [[ $user != "admin" ]]; do
	read -p "Cual es tu usuario?" user 
done

#For

for i in {1..5}; do
	echo "El numero es $i"
done

for ((i=0; i<=5; i++)); do
	echo "* El numero es $i"
done

invitados=(pedro juan david maria lulu ivan)
for invitado in ${invitados[@]}; do #@ funciona para seleccionar todos los elementos de un arreglo
	echo "Hola $invitado"
done

#Funciones
suma(){
	echo "Hola desde la funcion suma"
}

resta(){
	echo $(( $1 - $2))
}

suma
total=$(resta 9 4) #Asi se le da parametros a una funcion, y se guarda en una variable
echo "El total es $total"


