require 'pry'
producto = File.read('ejemplo.txt')
expresiones = producto.split("\n")  # => ["2x3x4", "1x1x10", "10x2x4"]
factores = expresiones.map do |expresión|
  valores = expresión.split('x').map(&:to_i) # => [[2, 3, 4], [1, 1, 10], [10, 2, 4]]
  suma_resultados = 0
  min1, min2 = valores.min(2) # [[2, 3], [1, 1], [2, 4]]
  resultado = 2 * valores[0] * valores[1] + 2 * valores[0] * valores[2] + 2 * valores[1] * valores[2] + min1 * min2  # [58, 43, 144]
  suma_resultados += resultado
end
# Imprimir el array factores y la suma final
puts "Factores: #{factores}"
puts "Suma final de resultados: #{factores.sum}"

binding.pry