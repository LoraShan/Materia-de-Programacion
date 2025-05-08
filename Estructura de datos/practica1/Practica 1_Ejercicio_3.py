# Solicitar al usuario que ingrese las partes real e imaginaria de ambos números
print("Ingrese el primer número complejo:")
real1 = float(input("Parte real: "))
imag1 = float(input("Parte imaginaria: "))

print("\nIngrese el segundo número complejo:")
real2 = float(input("Parte real: "))
imag2 = float(input("Parte imaginaria: "))

# Crear los números complejos
complejo1 = complex(real1, imag1)
complejo2 = complex(real2, imag2)

# Calcular y mostrar la suma
suma = complejo1 + complejo2
print(f"\nResultado de la suma: {suma}")