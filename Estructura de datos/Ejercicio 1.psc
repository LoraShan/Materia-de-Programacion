Algoritmo Vector_Cuadrado_Cubo
    Definir vector_numeros Como Entero
    Dimension vector_numeros(10)
    
    // Llenar el vector con valores aleatorios del 1 al 10
    Para i <- 1 Hasta 10 Hacer
        vector_numeros[i] <- Aleatorio(1,10)
    FinPara
    
    // Mostrar cada número con su cuadrado y su cubo
    Escribir "Número | Cuadrado | Cubo"
    Escribir "-------------------------"
    Para i <- 1 Hasta 10 Hacer
        Escribir vector_numeros[i], "       | ", vector_numeros[i]^2, "       | ", vector_numeros[i]^3
    FinPara
FinAlgoritmo
