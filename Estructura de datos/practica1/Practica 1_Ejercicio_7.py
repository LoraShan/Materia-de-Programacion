# Solicitar al usuario que ingrese un número
numero = float(input("Ingrese un número: "))

# Determinar si el número es positivo, negativo o cero
if numero > 0:
    print(f"El número {numero} es positivo")
elif numero < 0:
    print(f"El número {numero} es negativo")
else:
    print("El número ingresado es cero")