require 'set'

casas_visitadas = Set.new

distribucion = File.read('ejemplo.txt')
distribucion.split("\n").each do |linea| 
  x = 0
  y = 0

  casas_visitadas.add([x, y])

  linea.each_char do |valor|
    case valor
    when '>'
      x += 1
    when '<'
      x -= 1
    when '^'
      y += 1
    when 'v'
      y -= 1
    end

    casas_visitadas.add([x, y])
  end

  puts "Posición final: (#{x}, #{y}), Movimientos: #{linea}"
end

puts "Número de casas únicas visitadas por Santa: #{casas_visitadas.size}"
