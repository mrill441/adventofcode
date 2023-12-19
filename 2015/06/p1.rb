# Tamaño de la cuadrícula
GRID_SIZE = 1000

# Inicializar una cuadrícula de luces (inicialmente todas apagadas)
grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE, false) }

# Método para aplicar una operación en la cuadrícula
def apply_operation(grid, operation, start_coords, end_coords)
  start_x, start_y = start_coords
  end_x, end_y = end_coords

  (start_x..end_x).each do |x|
    (start_y..end_y).each do |y|
      case operation
      when 'turn on'
        grid[x][y] = true
      when 'turn off'
        grid[x][y] = false
      when 'toggle'
        grid[x][y] = !grid[x][y]
      end
    end
  end
end

# Método para verificar si una línea es una operación válida
def valid_operation?(line)
  line =~ /^(turn on|turn off|toggle) (\d+,\d+) through (\d+,\d+)$/
end

# Leer las instrucciones y aplicarlas a la cuadrícula
instrucciones = File.read('ejemplo.txt').split("\n")

instrucciones.each do |instruction|
  if valid_operation?(instruction)
    parts = instruction.split(' ')
    operation = parts[0]

    if parts[1] == 'on' || parts[1] == 'off'
      operation += " #{parts[1]}"
      start_coords = parts[2].split(',').map(&:to_i)
      end_coords = parts[4].split(',').map(&:to_i)
    else
      start_coords = parts[1].split(',').map(&:to_i)
      end_coords = parts[3].split(',').map(&:to_i)
    end

    # Mover la llamada a apply_operation dentro del alcance del bucle
    apply_operation(grid, operation, start_coords, end_coords)
  else
    puts "Instrucción no válida: #{instruction}"
  end
end

# Contar cuántas luces están encendidas
lights_on_count = grid.flatten.count(true)

puts "Número de luces encendidas: #{lights_on_count}"
