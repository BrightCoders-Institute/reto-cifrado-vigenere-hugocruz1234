require 'matrix'

@Vigenere = [
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
    ["A", "B", "C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z"],
    ["B", "C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A"],
    ["C", "D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B"],
    ["D", "E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C"],
    ["E", "F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D"],
    ["F", "G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E"],
    ["G", "H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F"],
    ["H", "I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G"],
    ["I",  "J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H"],
    ["J",  "K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I"],
    ["K",  "L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"],
    ["L", "M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"],
    ["M",  "N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"],
    ["N",  "Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"],
    ["Ñ",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"],
    ["O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ"],
    ["P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O"],
    ["Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P"],
    ["R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q"],
    ["S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R"],
    ["T",  "U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S"],
    ["U",  "V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T"],
    ["V",  "W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U"],
    ["W",  "X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V"],
    ["X",  "Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W"],
    ["Y",  "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X"],
    ["Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"],
    ]

def imprimir 
    @Vigenere.each do |fila|
        fila.each do |elemento|
        print "#{elemento}\t" # \t para separar los elementos por una tabulación
        end
        puts "\n" # Salto de línea después de cada fila
    end  
end

imprimir()
