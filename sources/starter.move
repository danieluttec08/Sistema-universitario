module sistema_universitario::sistema_universitario {
    use std::string::String;
    use sui::vec_map::{VecMap, Self};
    use sui::object;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Universidad has key {
        id: UID,
        nombre: String,
        carreras: VecMap<CodigoCarrera, Carrera>,
        profesores: VecMap<IDProfesor, Profesor>,
        estudiantes: VecMap<IDEstudiante, Estudiante>,
    }

    public struct Carrera has store, drop, copy {
        nombre: String,
        duracion: u8,
        calificaciones: VecMap<IDEstudiante, u8>,
    }

    public struct Profesor has store, drop, copy {
        nombre: String,
        materia: String,
    }

    public struct Estudiante has store, drop, copy {
        nombre: String,
        edad: u8,
    }

    public struct CodigoCarrera has store, drop, copy {
        value: u16,
    }

    public struct IDProfesor has store, drop, copy {
        value: u16,
    }

    public struct IDEstudiante has store, drop, copy {
        value: u16,
    }

    // Crear una nueva universidad
    public fun crear_universidad(nombre: String, ctx: &mut TxContext) {
        let universidad = Universidad {
            id: object::new(ctx),
            nombre,
            carreras: vec_map::empty(),
            profesores: vec_map::empty(),
            estudiantes: vec_map::empty(),
        };

        transfer::transfer(universidad, tx_context::sender(ctx));
    }

    // Agregar una carrera a la universidad
    public fun agregar_carrera(nombre: String, duracion: u8, codigo: u16, universidad: &mut Universidad) {
        let carrera = Carrera {
            nombre,
            duracion,
            calificaciones: vec_map::empty(),
        };

        let cod = CodigoCarrera { value: codigo };
        universidad.carreras.insert(cod, carrera);
    }

    // Registrar un profesor
    public fun agregar_profesor(nombre: String, materia: String, id: u16, universidad: &mut Universidad) {
        let profesor = Profesor { nombre, materia };
        let id_prof = IDProfesor { value: id };
        universidad.profesores.insert(id_prof, profesor);
    }

    // Registrar un estudiante
    public fun agregar_estudiante(nombre: String, edad: u8, id: u16, universidad: &mut Universidad) {
        let estudiante = Estudiante { nombre, edad };
        let id_est = IDEstudiante { value: id };
        universidad.estudiantes.insert(id_est, estudiante);
    }

    // Asignar una calificación a un estudiante en una carrera
    public fun asignar_calificacion(codigo: u16, id_est: u16, nota: u8, universidad: &mut Universidad) {
        let cod = CodigoCarrera { value: codigo };
        let id_est = IDEstudiante { value: id_est };

        let carrera = universidad.carreras.get_mut(&cod);
        carrera.calificaciones.insert(id_est, nota);
    }

    // Editar nombre de una carrera
    public fun editar_nombre_carrera(codigo: u16, nuevo_nombre: String, universidad: &mut Universidad) {
        let cod = CodigoCarrera { value: codigo };
        let carrera = universidad.carreras.get_mut(&cod);
        carrera.nombre = nuevo_nombre;
    }

    // Eliminar una carrera
    public fun eliminar_carrera(codigo: u16, universidad: &mut Universidad) {
        let cod = CodigoCarrera { value: codigo };
        universidad.carreras.remove(&cod);
    }

    // Eliminar universidad
    public fun eliminar_universidad(universidad: Universidad) {
        let Universidad { id, nombre: _, carreras: _, profesores: _, estudiantes: _ } = universidad;
        id.delete();
    }
}
