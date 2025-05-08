# Solicitar al usuario que ingrese un número entero
try:
    numero = int(input("Ingrese un número entero: "))
    
    # Determinar si el número es par o impar
    if numero % 2 == 0:
        print(f"El número {numero} es par")
    else:
        print(f"El número {numero} es impar")
        
except ValueError:
    print("Error: Debe ingresar un número entero válido")