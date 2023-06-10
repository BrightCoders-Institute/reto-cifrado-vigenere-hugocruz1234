require 'rspec'
require_relative 'vigenere'

describe 'igualar' do
    it 'Igualar el tamaño de mensaje con el de clave' do
        message = "hola"
        key = "secreto"
        igualar(message,key)
    end
end

describe 'main' do
    it 'Ingresa una palabra y la encripta por vigenere' do
        message = "holacomoestas"
        key = "prueba"
        igualar(message,key)
    end
end

describe 'main' do
    it 'Ingresa una palabra y la encripta por vigenere' do
        message = "adcx"
        key = "secretario"
        igualar(message,key)
    end
end