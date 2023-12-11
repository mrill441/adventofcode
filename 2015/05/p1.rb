# coding: utf-8

conducta = File.read('ejemplo.txt')

# Inicializar una variable para contar las cadenas "buenas"
strings_buenos = 0

conducta.split("\n").each do |letras|
  # Regla 1: Contiene al menos tres vocales (aeiou)
  número_vocales = letras.scan(/[aeiou]/).count
  next false unless número_vocales >= 3

  # Regla 2: Contiene al menos una letra que aparece dos veces seguidas
  next false unless letras =~ /(.)\1/

  # Regla 3: No contiene las cadenas ab, cd, pq, o xy
  next false if letras =~ /(ab|cd|pq|xy)/

  # Si llegamos aquí, la cadena cumple con todas las reglas y es "buenas"
  strings_buenos += 1
end

# Imprimir el número de cadenas "buenas"
puts "Número de cadenas 'buenas': #{strings_buenos}"
