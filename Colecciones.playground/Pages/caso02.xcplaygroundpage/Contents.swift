let INCAS: Set = [
    "Manco Cápac",
    "Sinchi Roca",
    "Lloque Yupanqui",
    "Mayta Cápac",
    "Cápac Yupanqui",
    "Inca Roca",
    "Yahuar Huácac",
    "Huiracocha",
    "Pachacútec Inca Yupanqui",
    "Amaru Inca Yupanqui",
    "Túpac Inca Yupanqui",
    "Huayna Cápac",
    "Huáscar",
    "Atahualpa"
]

let OTROS: Set = ["Atahualpa", "Huáscar"]

print(INCAS.contains("Huáscar"))

let UNION = INCAS.union(OTROS)
print(UNION)

let YUPANQUI = INCAS.filter { $0.contains("Yupanqui") }
print(YUPANQUI)
