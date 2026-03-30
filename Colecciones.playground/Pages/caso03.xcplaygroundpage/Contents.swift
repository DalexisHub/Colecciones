import Foundation

let metroLima: [String: [String]] = [
    "Linea 1": [
        "Villa El Salvador", "Parque Industrial", "Pumacahua",
        "Villa Maria", "Maria Auxiliadora", "San Juan",
        "Atocongo", "Jorge Chavez", "Ayacucho",
        "Los Cabitos", "Angamos", "San Borja Sur", "La Cultura",
        "Nicolas Arriola", "Gamarra", "28 de Julio", "Miguel Grau",
        "El Angel", "Presbistero Maestro", "Caja de Agua",
        "Piramides del Sol", "Los Jardines", "Los Postes",
        "San Carlos", "San Martin", "Santa Rosa", "Bayovar"
    ],
    "Linea 2": [
        "Puerto del Callao", "Insurgentes", "Oscar R. Benavides",
        "Plaza Bolognesi", "Estacion Central", "Manco Capac",
        "Cangallo", "Municipalidad de Ate"
    ],
    "Linea 3": [
        "El Alamo", "Naranjal", "Tomas Valle",
        "Estacion Central", "Lince", "Javier Prado", "Pedro Miotta"
    ],
    "Linea 4": [
        "Gambeta", "Aeropuerto", "Carmen de la Legua",
        "Pueblo Libre", "Lince", "La Molina", "Mercado Santa Anita"
    ]
]

func consultarEstaciones(de linea: String) {
    if let estaciones = metroLima[linea] {
        print("Estaciones de la \(linea): \(estaciones.joined(separator: ", "))")
    } else {
        print("La linea '\(linea)' no existe en el sistema.")
    }
}

func buscarLineasDeEstacion(nombre: String) {
    var lineasEncontradas: [String] = []
    for (linea, estaciones) in metroLima {
        if estaciones.contains(nombre) {
            lineasEncontradas.append(linea)
        }
    }
    if !lineasEncontradas.isEmpty {
        print("La estacion '\(nombre)' pertenece a: \(lineasEncontradas.joined(separator: " y "))")
    } else {
        print("La estacion '\(nombre)' no fue encontrada.")
    }
}

func verificarEstacionEnLinea(estacion: String, linea: String) {
    if let estaciones = metroLima[linea] {
        let existe = estaciones.contains(estacion)
        print("La estacion \(estacion) esta en la \(linea)?: \(existe ? "Si" : "No")")
    } else {
        print("Linea no valida.")
    }
}

func contarEstaciones(de linea: String) {
    if let cantidad = metroLima[linea]?.count {
        print("La \(linea) tiene un total de \(cantidad) estaciones.")
    }else {
        print("La linea '\(linea)' no existe.")
    }
}

print("RESULTADOS METRO LIMA 2040")
print("")
consultarEstaciones(de: "Linea 1")
print("")
buscarLineasDeEstacion(nombre: "Estacion Central")
print("")
verificarEstacionEnLinea(estacion: "Aeropuerto", linea: "Linea 4")
print("")
contarEstaciones(de: "Linea 4")
