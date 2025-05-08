print("Suma de números (ingrese 0 para terminar)")

total = 0  # Acumulador para la suma

while True:
    try:
        numero = float(input("Ingrese un número (0 para terminar): "))
        
        if numero == 0:
            break  # Salir del bucle si se ingresa 0
        
        total += numero  # Sumar el número al total
        
    except ValueError:
        print("Error: Debe ingresar un número válido. Intente nuevamente.")

# Mostrar el resultado
print(f"\nLa suma total de los números ingresados es: {total}")