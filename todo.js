const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let tareas = [];
const categoriasPermitidas = ["Estudio", "Trabajo", "Personal"];

function agregarTarea(titulo, descripcion, categoria) {
    if (!categoriasPermitidas.includes(categoria)) {
        console.log("Categoría no válida. Usa: Estudio, Trabajo o Personal.");
        return;
    }

    const nuevaTarea = {
        id: tareas.length + 1,
        titulo: titulo,
        descripcion: descripcion,
        categoria: categoria,
        completada: false
    };

    tareas.push(nuevaTarea);
    console.log(`Tarea "${titulo}" agregada a ${categoria}.`);
}

function listarTareas(filtroCategoria = null) {
   console.log("\nLISTADO DE TAREAS");
    
    let tareasAMostrar = filtroCategoria 
        ? tareas.filter(t => t.categoria === filtroCategoria)
        : tareas;

    if (tareasAMostrar.length === 0) {
        console.log("No hay tareas para mostrar.");
    } else {
        tareasAMostrar.forEach(t => {
            const estado = t.completada ? "Completada" : "Pendiente";
            console.log(`${t.id}. ${estado} ${t.titulo} (${t.categoria}): ${t.descripcion}`);
        });
    }
}

function completarTarea(id) {
    const tarea = tareas.find(t => t.id === parseInt(id));
    if (tarea) {
        tarea.completada = true;
        console.log(`Tarea "${tarea.titulo}" marcada como completada.`);
    } else {
        console.log("ID de tarea no encontrado.");
    }
}

function mostrarMenu() {
    console.log(`
---------------------------
1. Agregar Tarea
2. Listar Todas
3. Listar por Categoría
4. Completar Tarea
5. Salir
---------------------------`);
    rl.question('Selecciona una opción: ', (opcion) => {
        switch (opcion) {
            case '1':
                rl.question('Título: ', (titulo) => {
                    rl.question('Descripción: ', (desc) => {
                        rl.question('Categoría (Estudio/Trabajo/Personal): ', (cat) => {
                            agregarTarea(titulo, desc, cat);
                            mostrarMenu();
                        });
                    });
                });
                break;
            case '2':
                listarTareas();
                mostrarMenu();
                break;
            case '3':
                rl.question('¿Qué categoría filtrar? ', (cat) => {
                    listarTareas(cat);
                    mostrarMenu();
                });
                break;
            case '4':
                rl.question('ID de la tarea: ', (id) => {
                    completarTarea(id);
                    mostrarMenu();
                });
                break;
            case '5':
                console.log("¡Adiós!");
                rl.close();
                break;
            default:
                console.log("Opción no válida.");
                mostrarMenu();
                break;
        }
    });
}

mostrarMenu();