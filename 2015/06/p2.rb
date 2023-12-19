# Tamaño de la cuadrícula
GRID_SIZE = 1000

# Inicializar una cuadrícula de luces (inicialmente todas con brillo 0)
grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE, 0) }

# Método para aplicar una operación en la cuadrícula
def apply_operation(grid, operation, start_coords, end_coords)
  start_x, start_y = start_coords
  end_x, end_y = end_coords

  (start_x..end_x).each do |x|
    (start_y..end_y).each do |y|
      case operation
      when 'turn on'
        grid[x][y] += 1
      when 'turn off'
        grid[x][y] = [grid[x][y] - 1, 0].max
      when 'toggle'
        grid[x][y] += 2
      end
    end
  end
end

# Leer las instrucciones y aplicarlas a la cuadrícula
instructions = File.read('ejemplo.txt')
instructions.each_line do |instruction|
  parts = instruction.split(' ')
  operation = if parts[0] == 'toggle'
                'toggle'
              else
                "#{parts[1]} #{parts[2]}"
              end
  start_coords = parts[-3].split(',').map(&:to_i)
  end_coords = parts[-1].split(',').map(&:to_i)

  apply_operation(grid, operation, start_coords, end_coords)
end

# Calcular la suma total del brillo de las luces
total_brightness = grid.flatten.sum

puts "Total de brillo de las luces: #{total_brightness}"
