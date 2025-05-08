# Solicitar al usuario que ingrese la temperatura en Celsius
celsius = float(input("Ingrese la temperatura en grados Celsius: "))

# Calcular la conversión a Fahrenheit: F = (C × 9/5) + 32
fahrenheit = (celsius * 9/5) + 32

# Mostrar el resultado
print(f"{celsius}°C equivalen a {fahrenheit}°F")