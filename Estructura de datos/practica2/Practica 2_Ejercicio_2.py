# Solicitar información al usuario
nombre = input("Ingrese su nombre: ")
edad = int(input("Ingrese su edad: "))
ciudad = input("Ingrese su ciudad: ")

# Crear el diccionario
persona = {
    'nombre': nombre,
    'edad': edad,
    'ciudad': ciudad
}

# Mostrar resultados
print("\nInformación almacenada:")
print(f"Nombre: {persona['nombre']}")
print(f"Edad: {persona['edad']} años")
print(f"Ciudad: {persona['ciudad']}")

# Acceder específicamente a la edad
print(f"\nLa edad de {persona['nombre']} es {persona['edad']} años.")