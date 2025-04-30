import pymysql
from tkinter import messagebox

def crear_conexion():
    try:
        conexion = pymysql.connect(
            host='localhost',
            user='root',             
            password='raylin1648',
            database='prueba',
            cursorclass=pymysql.cursors.DictCursor
        )
        return conexion
    except Exception as e:
        messagebox.showerror("Error de Conexión", f"No se pudo conectar:\n{e}")
        return None
