#Calculadora usando funciones
def suma(a, b):
    """Función que suma dos números"""
    return a + b

def resta(a, b):
    """Función que resta dos números"""
    return a - b

def multiplicacion(a, b):
    """Función que multiplica dos números"""
    return a * b

def division(a, b):
    """Función que divide dos números"""
    if b == 0:
        return "Error: No se puede dividir entre cero"
    return a / b

def mostrar_menu():
    """Muestra el menú de opciones"""
    print("\nCalculadora básica")
    print("1. Suma")
    print("2. Resta")
    print("3. Multiplicación")
    print("4. División")
    print("5. Salir")

def main():
    """Función principal de la calculadora"""
    while True:
        mostrar_menu()
        opcion = input("Seleccione una operación (1-5): ")
        
        if opcion == '5':
            print("¡Hasta luego!")
            break
        
        if opcion not in ('1', '2', '3', '4'):
            print("Opción no válida. Intente de nuevo.")
            continue
        
        try:
            num1 = float(input("Ingrese el primer número: "))
            num2 = float(input("Ingrese el segundo número: "))
        except ValueError:
            print("Error: Debe ingresar números válidos")
            continue
        
        if opcion == '1':
            print(f"Resultado: {num1} + {num2} = {suma(num1, num2)}")
        elif opcion == '2':
            print(f"Resultado: {num1} - {num2} = {resta(num1, num2)}")
        elif opcion == '3':
            print(f"Resultado: {num1} * {num2} = {multiplicacion(num1, num2)}")
        elif opcion == '4':
            print(f"Resultado: {num1} / {num2} = {division(num1, num2)}")

if __name__ == "__main__":
    main()