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

3. Ubicado en la raíz del proyecto, ejecuta:

```
sui client publish 
```

Al finalizar, obtendrás un Package ID que identifica tu módulo en la blockchain.
📌 Guarda este ID, lo necesitarás para llamar a todas las funciones:

```
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
Parámetros:

Parámetro	Descripción
<PACKAGE_ID>	ID del paquete publicado en Sui.
<NOMBRE_UNIVERSIDAD>	Nombre de la universidad que quieres crear. Puede ser cualquier string.

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
| Parámetro                 | Descripción                                     |
| ------------------------- | ----------------------------------------------- |
| `<NOMBRE_CARRERA>`        | Nombre de la carrera (string).                  |
| `<DURACION>`              | Duración en años (u8).                          |
| `<CODIGO_CARRERA>`        | Código único de la carrera (u16).               |
| `<OBJECT_ID_UNIVERSIDAD>` | Object ID de la universidad previamente creada. |


## 👩‍🏫 3. Registrar un profesor
sui client call \
  --package 0x1234567890abcdef1234567890abcdef12345678 \
  --module sistema_universitario \
  --function agregar_profesor \
  --args "Dra. Ana Pérez" "Bases de Datos" 200 0xabc123... \
  --gas-budget 100000000

## 🎒 4. Registrar un estudiante
sui client call \
  --package 0x1234567890abcdef1234567890abcdef12345678 \
  --module sistema_universitario \
  --function agregar_estudiante \
  --args "Juan López" 20 300 0xabc123... \ --agregar el package de 
  --gas-budget 100000000

🧮 5. Asignar calificación
sui client call \
  --package 0x1234567890abcdef1234567890abcdef12345678 \
  --module sistema_universitario \
  --function asignar_calificacion \
  --args 101 300 95 0xabc123... \
  --gas-budget 100000000


📌 Donde:

101 = código de carrera

300 = ID del estudiante

95 = nota (0–100)

0xabc123... = ID de la universidad

🧾 6. Verificar objetos creados

Ver todos los objetos de tu cuenta:

sui client objects


Ver los datos de una universidad:

sui client object 0xabc123...

🧠 Estructuras principales
Universidad

nombre: String

carreras: VecMap<CodigoCarrera, Carrera>

profesores: VecMap<IDProfesor, Profesor>

estudiantes: VecMap<IDEstudiante, Estudiante>

Carrera

nombre: String

duracion: u8

calificaciones: VecMap<IDEstudiante, u8>

Profesor

nombre: String

materia: String

Estudiante

nombre: String

edad: u8

📦 Estructura del proyecto
sistema_universitario/
│
├── sources/
│   └── sistema_universitario.move   # Código fuente del módulo
│
├── Move.toml                        # Configuración del paquete Move
└── README.md                        # Documentación del proyecto

🧪 Pruebas locales

Antes de desplegar en testnet, puedes ejecutar pruebas locales:

sui move build
sui move test


Si todo está correcto, podrás publicar el paquete sin errores.

📜 Ejemplo de flujo completo

Publica el paquete.

Crea la universidad (guarda el objectId).

Agrega carreras, profesores y estudiantes.

Asigna calificaciones.

Consulta los datos con sui client object.

Este flujo simula el manejo completo de una universidad descentralizada en la blockchain de Sui.

🧾 Autor

Daniel Galicia Fuentes
Proyecto desarrollado en Move sobre la Sui Testnet
💻 GitHub: https://github.com/tu_usuario
