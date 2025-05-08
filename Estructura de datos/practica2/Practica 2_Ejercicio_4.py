#Calculadora que utiliza varias bibliotecas para operaciones avanzadas
import math
import sys
from datetime import datetime

def calculadora_avanzada():
    """Calculadora que utiliza varias bibliotecas para operaciones avanzadas"""
    
    print("\n" + "="*50)
    print(f"Calculadora Avanzada - {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}")
    print("="*50)
    
    while True:
        print("\nOpciones disponibles:")
        print("1. Operaciones básicas (+ - * /)")
        print("2. Potencias y raíces")
        print("3. Funciones trigonométricas")
        print("4. Logaritmos")
        print("5. Factorial")
        print("6. Salir")
        
        try:
            opcion = int(input("\nSeleccione una opción (1-6): "))
            
            if opcion == 6:
                print("\n¡Gracias por usar la calculadora avanzada!")
                sys.exit()
                
            if opcion < 1 or opcion > 6:
                print("Opción no válida. Intente de nuevo.")
                continue
                
            # Operaciones básicas
            if opcion == 1:
                import operator
                ops = {
                    '+': operator.add,
                    '-': operator.sub,
                    '*': operator.mul,
                    '/': operator.truediv
                }
                print("\nOperadores disponibles: + - * /")
                expresion = input("Ingrese la expresión (ej. 5 + 3): ")
                try:
                    num1, operador, num2 = expresion.split()
                    resultado = ops[operador](float(num1), float(num2))
                    print(f"Resultado: {expresion} = {resultado}")
                except:
                    print("Error en la expresión. Formato correcto: 'numero operador numero'")
            
            # Potencias y raíces
            elif opcion == 2:
                print("\na. Potencia (x^y)")
                print("b. Raíz cuadrada")
                print("c. Raíz n-ésima")
                sub_op = input("Seleccione (a-c): ").lower()
                
                if sub_op == 'a':
                    base = float(input("Base: "))
                    exponente = float(input("Exponente: "))
                    print(f"Resultado: {base}^{exponente} = {math.pow(base, exponente)}")
                elif sub_op == 'b':
                    num = float(input("Número: "))
                    print(f"√{num} = {math.sqrt(num)}")
                elif sub_op == 'c':
                    num = float(input("Número: "))
                    n = float(input("Raíz n-ésima (n): "))
                    print(f"{n}√{num} = {num ** (1/n)}")
                else:
                    print("Opción no válida")
            
            # Trigonometría
            elif opcion == 3:
                print("\na. Seno")
                print("b. Coseno")
                print("c. Tangente")
                print("d. Convertir grados a radianes")
                sub_op = input("Seleccione (a-d): ").lower()
                
                angulo = float(input("Ángulo en grados: "))
                rad = math.radians(angulo)
                
                if sub_op == 'a':
                    print(f"sin({angulo}°) = {math.sin(rad)}")
                elif sub_op == 'b':
                    print(f"cos({angulo}°) = {math.cos(rad)}")
                elif sub_op == 'c':
                    print(f"tan({angulo}°) = {math.tan(rad)}")
                elif sub_op == 'd':
                    print(f"{angulo}° = {rad} radianes")
                else:
                    print("Opción no válida")
            
            # Logaritmos
            elif opcion == 4:
                print("\na. Logaritmo natural (base e)")
                print("b. Logaritmo base 10")
                print("c. Logaritmo con base personalizada")
                sub_op = input("Seleccione (a-c): ").lower()
                
                num = float(input("Número: "))
                
                if sub_op == 'a':
                    print(f"ln({num}) = {math.log(num)}")
                elif sub_op == 'b':
                    print(f"log10({num}) = {math.log10(num)}")
                elif sub_op == 'c':
                    base = float(input("Base del logaritmo: "))
                    print(f"log{base}({num}) = {math.log(num, base)}")
                else:
                    print("Opción no válida")
            
            # Factorial
            elif opcion == 5:
                num = int(input("Número entero positivo: "))
                if num >= 0:
                    print(f"{num}! = {math.factorial(num)}")
                else:
                    print("El factorial solo está definido para números enteros no negativos")
        
        except ValueError:
            print("Error: Ingrese un valor numérico válido")
        except Exception as e:
            print(f"Error inesperado: {e}")

if __name__ == "__main__":
    calculadora_avanzada()