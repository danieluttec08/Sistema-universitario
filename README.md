![banner](./imagenes/Banner_daniel.png)
# 🎓 Sistema Universitario en Sui Move

Este proyecto implementa un **sistema de gestión universitaria descentralizado** sobre la blockchain de **Sui**, desarrollado completamente en **Move**.

Permite administrar universidades, carreras, profesores y estudiantes, así como registrar calificaciones, todo dentro del modelo de objetos seguro e inmutable de Sui.

---

## 🧩 Descripción del Proyecto

El módulo `sistema_universitario::sistema_universitario` define una estructura de datos y funciones para manejar entidades académicas.

### 📘 Funcionalidades principales:
- Crear universidades.
- Agregar carreras con su duración.
- Registrar profesores y estudiantes.
- Asignar calificaciones por estudiante y carrera.
- Editar o eliminar carreras.
- Eliminar una universidad completa.

---

## 🚀 Publicar el paquete en Testnet

Ubicado en la raíz del proyecto, ejecuta:

sui client publish 


📋 Guarda el valor del Package ID que aparece en consola, por ejemplo:

```
Package ID: 0x1234567890abcdef1234567890abcdef12345678
```

Ese será el identificador del módulo para las llamadas posteriores.

