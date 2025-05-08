Algoritmo Suma_Filas_Columnas
    Definir matriz Como Entero
    Dimension matriz(5,5)
    
    Definir sumaFilas, sumaColumnas Como Entero
    Dimension sumaFilas(5), sumaColumnas(5)
    
    // Inicializar las sumas en 0
    Para i <- 1 Hasta 5 Hacer
        sumaFilas[i] <- 0
        sumaColumnas[i] <- 0
    FinPara
    
    // Cargar la matriz con valores ingresados por el usuario
    Para i <- 1 Hasta 5 Hacer
        Para j <- 1 Hasta 5 Hacer
            Escribir "Ingrese un número para la posición [", i, ",", j, "]: "
            Leer matriz[i, j]
        FinPara
    FinPara
    
    // Calcular la suma de cada fila y cada columna
    Para i <- 1 Hasta 5 Hacer
        Para j <- 1 Hasta 5 Hacer
            sumaFilas[i] <- sumaFilas[i] + matriz[i, j]
            sumaColumnas[j] <- sumaColumnas[j] + matriz[i, j]
        FinPara
    FinPara
    
    // Mostrar las sumas de las filas
    Escribir "Suma de cada fila:"
    Para i <- 1 Hasta 5 Hacer
        Escribir "Fila ", i, ": ", sumaFilas[i]
    FinPara
    
    // Mostrar las sumas de las columnas
    Escribir "Suma de cada columna:"
    Para j <- 1 Hasta 5 Hacer
        Escribir "Columna ", j, ": ", sumaColumnas[j]
    FinPara
    
FinAlgoritmo
