![banner](./imagenes/Banner_daniel.png)
# 🎓 Sistema Universitario en Sui Move

Este proyecto implementa un **sistema de gestión universitaria descentralizado** sobre la blockchain de **Sui**, desarrollado completamente en **Move**.

Permite administrar universidades, carreras, profesores y estudiantes, así como registrar calificaciones, todo dentro del modelo de objetos seguro e inmutable de Sui.

---

## 🧩 Descripción del Proyecto

El módulo `sistema_universitario::sistema_universitario` define una estructura de datos y funciones para manejar entidades académicas.

### Estructura del módulo

- **Universidad**  
  - `nombre: String`  
  - `carreras: VecMap<CodigoCarrera, Carrera>`  
  - `profesores: VecMap<IDProfesor, Profesor>`  
  - `estudiantes: VecMap<IDEstudiante, Estudiante>`

- **Carrera**  
  - `nombre: String`  
  - `duracion: u8`  
  - `calificaciones: VecMap<IDEstudiante, u8>`

- **Profesor**  
  - `nombre: String`  
  - `materia: String`

- **Estudiante**  
  - `nombre: String`  
  - `edad: u8`

- **Identificadores**: `CodigoCarrera`, `IDProfesor`, `IDEstudiante` (todos con tipo `u16`).


### 📘 Funcionalidades principales:
- Crear universidades.
- Agregar carreras con su duración.
- Registrar profesores y estudiantes.
- Asignar calificaciones por estudiante y carrera.
- Editar o eliminar carreras.
- Eliminar una universidad completa.

---

## 🚀 Publicar el paquete en Testnet

1. Compila el módulo para asegurarte que no existan errores:
```
sui move build
```

2. Ubicado en la raíz del proyecto, ejecuta:

```
sui client publish 
```

Al finalizar, obtendrás un Package ID que identifica tu módulo en la blockchain.
📌 Guarda este ID, lo necesitarás para llamar a todas las funciones:

```
Ejemplo: 
Package ID: 0x1234567890abcdef1234567890abcdef12345678

```
---
## Uso del módulo: funciones principales

### A continuación se muestran los pasos para crear universidades, carreras, profesores y estudiantes, así como asignar calificaciones.
Cada comando incluye descripción de los parámetros principales y cuáles deberás cambiar según tu despliegue

## 🏛️ 1. Crear una universidad

```
sui client call \
  --package <PACKAGE_ID> \
  --module sistema_universitario \
  --function crear_universidad \
  --args "<NOMBRE_UNIVERSIDAD>" \
  --gas-budget 100000000

```
**Parámetros:**

- <PACKAGE_ID>	ID del paquete publicado en Sui.
- <NOMBRE_UNIVERSIDAD>	Nombre de la universidad que quieres crear. Puede ser cualquier string.

Este comando devuelve un Object ID que representa la universidad creada.
📌 Guarda este ID para usarlo en todas las demás funciones.

## 🎓 2. Agregar una carrera

```
sui client call \
  --package <PACKAGE_ID> \
  --module sistema_universitario \
  --function agregar_carrera \
  --args "<NOMBRE_CARRERA>" <DURACION> <CODIGO_CARRERA> <OBJECT_ID_UNIVERSIDAD> \
  --gas-budget 100000000

```
**Parámetros:**

| Parámetro                 | Descripción                                     |
| ------------------------- | ----------------------------------------------- |
| `<NOMBRE_CARRERA>`        | Nombre de la carrera (string).                  |
| `<DURACION>`              | Duración en años (u8).                          |
| `<CODIGO_CARRERA>`        | Código único de la carrera (u16).               |
| `<OBJECT_ID_UNIVERSIDAD>` | Object ID de la universidad previamente creada. |


## 👩‍🏫 3. Registrar un profesor

```
sui client call \
  --package <PACKAGE_ID> \
  --module sistema_universitario \
  --function agregar_profesor \
  --args "<NOMBRE_PROFESOR>" "<MATERIA>" <ID_PROFESOR> <OBJECT_ID_UNIVERSIDAD> \
  --gas-budget 100000000
```
**Parámetros:**

| Parámetro                 | Descripción                     |
| ------------------------- | ------------------------------- |
| `<NOMBRE_PROFESOR>`       | Nombre completo del profesor.   |
| `<MATERIA>`               | Materia que enseña el profesor. |
| `<ID_PROFESOR>`           | ID único del profesor (u16).    |
| `<OBJECT_ID_UNIVERSIDAD>` | Object ID de la universidad.    |


## 🎒 4. Registrar un estudiante

```
sui client call \
  --package <PACKAGE_ID> \
  --module sistema_universitario \
  --function agregar_estudiante \
  --args "<NOMBRE_ESTUDIANTE>" <EDAD> <ID_ESTUDIANTE> <OBJECT_ID_UNIVERSIDAD> \
  --gas-budget 100000000
```
**Parámetros:**

| Parámetro                 | Descripción                     |
| ------------------------- | ------------------------------- |
| `<NOMBRE_ESTUDIANTE>`     | Nombre completo del estudiante. |
| `<EDAD>`                  | Edad del estudiante (u8).       |
| `<ID_ESTUDIANTE>`         | ID único del estudiante (u16).  |
| `<OBJECT_ID_UNIVERSIDAD>` | Object ID de la universidad.    |

## 🧮 5. Asignar calificación

```
sui client call \
  --package <PACKAGE_ID> \
  --module sistema_universitario \
  --function asignar_calificacion \
  --args <CODIGO_CARRERA> <ID_ESTUDIANTE> <CALIFICACION> <OBJECT_ID_UNIVERSIDAD> \
  --gas-budget 100000000
```
**Parámetros:**

| Parámetro                 | Descripción                  |
| ------------------------- | ---------------------------- |
| `<CODIGO_CARRERA>`        | Código de la carrera (u16)   |
| `<ID_ESTUDIANTE>`         | ID del estudiante (u16)      |
| `<CALIFICACION>`          | Nota del estudiante (0–100)  |
| `<OBJECT_ID_UNIVERSIDAD>` | Object ID de la universidad. |

---

## ✔ 6. Verificar objetos y estado

Consulta todos los objetos de tu cuenta:

```
sui client objects
```

Ver los datos de una universidad específica:

```
sui client object <OBJECT_ID_UNIVERSIDAD> 
```
- <OBJECT_ID_UNIVERSIDAD> 
- Ejemplo: 0x1234567890abcdef1234567890abcdef12345678

---

## 📊 7. Flujo completo de prueba

- Publicar el paquete y obtener Package ID.

- Crear universidad (guardar Object ID).

- Agregar carreras, profesores y estudiantes.

- Asignar calificaciones.

- Consultar datos y verificar resultados en la blockchain.

---

## 🧾 Autor

**Daniel Galicia Fuentes**
- Proyecto desarrollado en Move sobre la blockchain de Sui.
- 💻 GitHub: https://github.com/danieluttec08
