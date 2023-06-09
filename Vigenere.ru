require 'matrix'

@vigenere = [
    ["0", "1", "2", "3", "4", "5", "6", "7", "8",  "9",  "10",  "11", "12",  "13",  "14",  "15",  "16",  "17",  "18",  "19",  "20",  "21",  "22",  "23",  "24",  "25"],
    ["A", "B", "C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z"],
    ["B", "C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A"],
    ["C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B"],
    ["D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C"],
    ["E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D"],
    ["F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E"],
    ["G", "H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F"],
    ["H", "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G"],
    ["I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H"],
    ["J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I"],
    ["K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J"],
    ["L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K"],
    ["M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L"],
    ["N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M"],
    ["O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N"],
    ["P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O"],
    ["Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P"],
    ["R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q"],
    ["S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R"],
    ["T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S"],
    ["U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T"],
    ["V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U"],
    ["W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V"],
    ["X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W"],
    ["Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X"],
    ["Z", "A", "B", "C", "D", "E", "F", "G", "H",  "I",  "J",  "K",  "L", "M",  "N",    "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y"]
  ]
  @solution=""

def compararfila(mensaje,clave)
    mensaje.downcase!  # Convertir la letra a minúscula  
    n = mensaje.ord - 'a'.ord
    index = @vigenere[0].index(n.to_s)
    p "La posición de la coincidencia es: #{index}"
    compararcolumna(index,clave)
end

def compararcolumna(indexm,clave)
    clave = clave.upcase
    index = @vigenere[1].index(clave)
    letracoincidencia = @vigenere[indexm+1][index]
    @solution += letracoincidencia
    p "La posición de la coincidencia es: #{index}"
    p "Valor de coincidencia: #{@solution}" 
end

def ingresardatos 
    p "Ingresa tu mensaje: " 
    mensaje = gets.chomp 
    p "Ingresa tu clave: " 
    clave = gets.chomp
    compararfila(mensaje,clave)
end

def request
    p "Introduce tu mensaje: "
    message = gets.chomp
    p "Introduce tu palabra clave: "
    key = gets.chomp
    adapt_size(message,key)
end

def adapt_size(message, key)
    size = [message.length, key.length].max
    key = key.ljust(size, key)
    p key
end
  
ingresardatos
