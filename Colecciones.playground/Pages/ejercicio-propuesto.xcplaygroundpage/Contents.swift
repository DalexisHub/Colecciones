import Foundation

let CONECTORES: Set<String> = [
    "es", "un", "una", "el", "la", "los", "las",
    "a", "en", "y", "o", "de", "del", "al"
]

let frase = "Bienvenidos a Tecsup, hoy es un gran día"

let limpio = frase.lowercased()
    .components(separatedBy: CharacterSet.punctuationCharacters)
    .joined()

let palabras = limpio.split(separator: " ")

let resultado = palabras.filter { !CONECTORES.contains(String($0)) }

print("Palabras válidas:")

for (i, palabra) in resultado.enumerated() {
    print("\(palabra) \(i + 1)")
}

print("Total: \(resultado.count)")
