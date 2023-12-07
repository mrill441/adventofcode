require 'set'

# Inicializar conjuntos para Santa y Robo-Santa
casas_santa = Set.new
casas_robo_santa = Set.new

# Leer el archivo y procesar cada línea
distribucion = File.read('ejemplo.txt')
distribucion.split("\n").each do |linea| 
  # Alternar entre Santa y Robo-Santa
  santa, robo_santa = casas_santa, casas_robo_santa

  x_santa, y_santa = 0, 0
  x_robo_santa, y_robo_santa = 0, 0

  # Agregar la casa inicial al conjunto correspondiente
  santa.add([x_santa, y_santa])
  robo_santa.add([x_robo_santa, y_robo_santa])

  # Iterar sobre cada caracter de la línea
  linea.each_char.each_with_index do |valor, index|
    if index.even?
      # Movimientos de Santa
      case valor
      when '>'
        x_santa += 1
      when '<'
        x_santa -= 1
      when '^'
        y_santa += 1
      when 'v'
        y_santa -= 1
      end
      santa.add([x_santa, y_santa])
    else
      # Movimientos de Robo-Santa
      case valor
      when '>'
        x_robo_santa += 1
      when '<'
        x_robo_santa -= 1
      when '^'
        y_robo_santa += 1
      when 'v'
        y_robo_santa -= 1
      end
      robo_santa.add([x_robo_santa, y_robo_santa])
    end
  end
end

# Combinar los conjuntos y calcular el tamaño total
casas_totales = casas_santa | casas_robo_santa

# Imprimir el tamaño del conjunto total al final
puts "Número total de casas únicas visitadas por Santa y Robo-Santa: #{casas_totales.size}"
