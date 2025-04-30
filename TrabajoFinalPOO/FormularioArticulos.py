import tkinter as tk
from tkinter import ttk, messagebox
import pymysql
import pymysql.cursors

# ---------------------------------------------------
# Función para crear conexión usando PyMySQL
# ---------------------------------------------------
def crear_conexion():
    try:
        conexion = pymysql.connect(
            host='localhost',
            user='root',               # O el usuario que prefieras
            password='raylin1648',
            database='prueba',
            cursorclass=pymysql.cursors.DictCursor
        )
        return conexion
    except Exception as e:
        messagebox.showerror("Error de Conexión", f"No se pudo conectar a la base de datos:\n{e}")
        return None

# ---------------------------------------------------
# Funciones de operación sobre la tabla 'articulos'
# ---------------------------------------------------
def guardar_articulo():
    descripcion = descripcion_entry.get().strip()
    precio = precio_entry.get().strip()
    if not descripcion or not precio:
        messagebox.showwarning("Campos vacíos", "Completa todos los campos.")
        return

    try:
        precio_f = float(precio)
    except ValueError:
        messagebox.showerror("Error", "El precio debe ser un número válido.")
        return

    conn = crear_conexion()
    if not conn:
        return

    try:
        with conn.cursor() as cursor:
            sql = "INSERT INTO articulos (descripcion, precio) VALUES (%s, %s)"
            cursor.execute(sql, (descripcion, precio_f))
        conn.commit()
        messagebox.showinfo("Éxito", "Artículo guardado correctamente.")
        descripcion_entry.delete(0, tk.END)
        precio_entry.delete(0, tk.END)
    except Exception as e:
        messagebox.showerror("Error al guardar", str(e))
    finally:
        conn.close()

def consultar_articulo():
    codigo = codigo_entry.get().strip()
    if not codigo:
        messagebox.showwarning("Campo vacío", "Ingresa el código a consultar.")
        return

    try:
        id_int = int(codigo)
    except ValueError:
        messagebox.showerror("Error", "El código debe ser un entero.")
        return

    conn = crear_conexion()
    if not conn:
        return

    try:
        with conn.cursor() as cursor:
            sql = "SELECT descripcion, precio FROM articulos WHERE id = %s"
            cursor.execute(sql, (id_int,))
            row = cursor.fetchone()
        if row:
            consulta_descripcion_entry.delete(0, tk.END)
            consulta_precio_entry.delete(0, tk.END)
            consulta_descripcion_entry.insert(0, row['descripcion'])
            consulta_precio_entry.insert(0, str(row['precio']))
        else:
            messagebox.showinfo("No encontrado", "No existe un artículo con ese código.")
    except Exception as e:
        messagebox.showerror("Error en consulta", str(e))
    finally:
        conn.close()

def mostrar_listado():
    conn = crear_conexion()
    if not conn:
        return

    try:
        with conn.cursor() as cursor:
            sql = "SELECT id, descripcion, precio FROM articulos ORDER BY id"
            cursor.execute(sql)
            rows = cursor.fetchall()
        listado_text.delete(1.0, tk.END)
        for r in rows:
            listado_text.insert(tk.END,
                f"ID: {r['id']}   Descripción: {r['descripcion']}   Precio: {r['precio']}\n"
            )
    except Exception as e:
        messagebox.showerror("Error al listar", str(e))
    finally:
        conn.close()

# ---------------------------------------------------
# Montaje de la interfaz gráfica con pestañas
# ---------------------------------------------------
ventana = tk.Tk()
ventana.title("Mantenimiento de artículos")
ventana.geometry("360x320")

notebook = ttk.Notebook(ventana)
notebook.pack(fill='both', expand=True)

# --- Pestaña 1: Carga de artículos ---
tab1 = ttk.Frame(notebook)
notebook.add(tab1, text='Carga de artículos')

ttk.Label(tab1, text="Descripción:").pack(pady=(15,5))
descripcion_entry = ttk.Entry(tab1, width=30)
descripcion_entry.pack()

ttk.Label(tab1, text="Precio:").pack(pady=(10,5))
precio_entry = ttk.Entry(tab1, width=15)
precio_entry.pack()

ttk.Button(tab1, text="Confirmar", command=guardar_articulo).pack(pady=15)

# --- Pestaña 2: Consulta por código ---
tab2 = ttk.Frame(notebook)
notebook.add(tab2, text='Consulta por código')

ttk.Label(tab2, text="Código:").pack(pady=(15,5))
codigo_entry = ttk.Entry(tab2, width=10)
codigo_entry.pack()

ttk.Label(tab2, text="Descripción:").pack(pady=(10,5))
consulta_descripcion_entry = ttk.Entry(tab2, width=30)
consulta_descripcion_entry.pack()

ttk.Label(tab2, text="Precio:").pack(pady=(10,5))
consulta_precio_entry = ttk.Entry(tab2, width=15)
consulta_precio_entry.pack()

ttk.Button(tab2, text="Consultar", command=consultar_articulo).pack(pady=15)

# --- Pestaña 3: Listado completo ---
tab3 = ttk.Frame(notebook)
notebook.add(tab3, text='Listado completo')

ttk.Button(tab3, text="Mostrar listado", command=mostrar_listado).pack(pady=10)
listado_text = tk.Text(tab3, height=10, wrap='none')
listado_text.pack(fill='both', expand=True, padx=10, pady=(0,10))

ventana.mainloop()
