class Circuit
  attr_accessor :wires

  def initialize
    @wires = {}
  end

  def get_signal(identifier)
    if identifier =~ /\A\d+\z/
      # If the identifier is a number, return the numeric value
      return identifier.to_i
    else
      # Otherwise, return the signal of the corresponding wire
      return @wires[identifier]
    end
  end

  def process_instruction(instruction)
    parts = instruction.split(' ')

    case parts.size
    when 3
      # Assign a signal directly to a wire
      @wires[parts[2]] = get_signal(parts[0])
    when 4
      # Apply NOT operation
      @wires[parts[3]] = ~get_signal(parts[1])
    when 5
      # Apply other operations (AND, OR, LSHIFT, RSHIFT)
      signal1 = get_signal(parts[0])
      signal2 = get_signal(parts[2])

      case parts[1]
      when 'AND'
        @wires[parts[4]] = signal1 & signal2
      when 'OR'
        @wires[parts[4]] = signal1 | signal2
      when 'LSHIFT'
        @wires[parts[4]] = signal1 << signal2
      when 'RSHIFT'
        @wires[parts[4]] = signal1 >> signal2
      end
    end
  end

  def execute_instructions(instructions)
    until @wires['a']
      instructions.each { |instruction| process_instruction(instruction) }
    end
  end
end

# Leer las instrucciones desde el archivo de entrada
instructions = File.read('input.txt').split("\n")

# Crear un objeto de la clase Circuit y ejecutar las instrucciones
circuit = Circuit.new
circuit.execute_instructions(instructions)

# Imprimir la señal final del cable 'a'
puts "La señal final de 'a' es: #{circuit.wires['a']}"
