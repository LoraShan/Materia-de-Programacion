Algoritmo Vector_Invertido
    // Definir los vectores
    Definir vectorOriginal, vectorInvertido Como Cadena
    Dimension vectorOriginal(5)
    Dimension vectorInvertido(5)
    
    // Leer datos desde el teclado
    Para i <- 1 Hasta 5 Hacer
        Escribir "Ingrese una palabra para la posición ", i, ": "
        Leer vectorOriginal[i]
    FinPara
    
    // Copiar en orden inverso
    Para i <- 1 Hasta 5 Hacer
        vectorInvertido[i] <- vectorOriginal[6 - i]
    FinPara
    
    // Mostrar el vector invertido
    Escribir "Vector invertido:"
    Para i <- 1 Hasta 5 Hacer
        Escribir vectorInvertido[i]
    FinPara
FinAlgoritmo
