while True:
    nombre = input("Por favor, ingresa tu nombre: ").strip()
    if nombre:  # Verifica que no sea una cadena vacía
        break
    print("Debes ingresar un nombre válido. Intenta nuevamente.")

print(f"\n¡Hola, {nombre}! Es un placer conocerte.")