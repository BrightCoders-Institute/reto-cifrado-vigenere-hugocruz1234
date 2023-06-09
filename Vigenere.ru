require 'matrix'

@vigenere = [
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

def searchmessage(message)
    message = message.upcase  # Convertir la letra a mayúsculas
    @vigenere.each_with_index do |row, index|
        if row[0] == message
            return index  # Devolver la posición encontrada
        end
    end
        return nil  # Si no se encuentra la letra, devolver nil
end

def searchkey(key)
    key = key.upcase  # Convertir la letra a mayúsculas
    @vigenere[0].each_with_index do |column, index|
        if column == key
          return index  # Devolver la posición encontrada
        end
      end
      
      return nil  # Si no se encuentra la letra, devolver nil
    end


def usermessage
    p "Bienvenid@, ingresa tu mensaje"
    word = gets.chomp
    position = searchmessage(word)
    puts "La letra '#{word}' se encuentra en la posición #{position}" unless position.nil?
    userkey
end

def userkey
    p "Ahora la palabra que sera tu clave"
    key = gets.chomp
    position = searchkey(key)
    puts "La letra '#{key}' se encuentra en la posición #{position}" unless position.nil?
end

usermessage