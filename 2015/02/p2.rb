require 'pry'

medidas = File.read('ejemplo.txt')
expresiones = medidas.split("\n")
factores = expresiones.map do |expresión|
  valores = expresión.split('x').map(&:to_i)
  suma = 0
  min1, min2 = valores.min(2) 
  resultado = 2 * min1 + 2 * min2 + valores[0] * valores[1] * valores[2]
  suma += resultado
end
# Imprimir el array factores y la suma final
puts "Factores: #{factores}"
puts "Suma final de resultados: #{factores.sum}"

binding.pry