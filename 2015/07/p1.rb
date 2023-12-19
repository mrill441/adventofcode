def simulate_circuit(instructions)
  signals = {}
  operations = {
    'AND'     => :&,
    'OR'      => :|,
    'LSHIFT'  => :<<,
    'RSHIFT'  => :>>,
    'NOT'     => :~,
    '->'      => :assign
  }

  until instructions.empty?
    instruction = instructions.shift
    parts = instruction.split

    if parts.length == 3  # Asignación directa de señal a un cable
      signals[parts[2]] = resolve_signal(parts[0], signals)
    elsif parts.length == 4  # Operación NOT
      signals[parts[3]] = ~resolve_signal(parts[1], signals) & 0xFFFF
    else  # Otras operaciones binarias
      op = operations[parts[1]]
      signals[parts[4]] = resolve_signal(parts[0], signals).send(op, resolve_signal(parts[2], signals)) & 0xFFFF
    end
  end

  signals
end

def resolve_signal(input, signals)
  if input.match?(/\A\d+\z/)  # Números directos
    input.to_i
  elsif signals.key?(input)  # Señal de otro cable
    signals[input]
  else
    raise "Señal no resuelta para #{input}"
  end
end

# Ejemplo de uso
input_instructions = [
  '123 -> x',
  '456 -> y',
  'x AND y -> d',
  'x OR y -> e',
  'x LSHIFT 2 -> f',
  'y RSHIFT 2 -> g',
  'NOT x -> h',
  'NOT y -> i',
  '-> a'
]

resulting_signals = simulate_circuit(input_instructions)
puts "Señal final en el cable 'a': #{resulting_signals['a']}"
