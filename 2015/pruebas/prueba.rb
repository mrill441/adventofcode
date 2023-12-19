def simulate_circuit(instructions)
  signals = {}
  operations = {
    'AND' => :&,
    'OR' => :|,
    'LSHIFT' => :<<,
    'RSHIFT' => :>>,
    'NOT' => :~,
    '->' => :assign
  }
  until instructions.empty?
    instruction = instructions.shift
    parts = instruction.split

    if parts.length == 3
      signals[parts[2]] = resolve_signal(parts[1], signals) & 0xFFFF
    elsif parts.length == 4
      signals[parts[3]] = ~resolve_signal(parts[1], signals) & 0xFFFF
    else
      op = operations[parts[1]]
      signals[parts[4]] = resolve_signal(parts[0], signals).send(op, resolve_signal(parts[2], signals)) & 0xFFFF
    end
  end
end

def resolve_signal(input, signals)
  if input.match?(/\A\d+\z/)
    input.to_i
  elsif signals.key?(input)
    signals[input]
  else
    raise "señal no resuelta para #{input}"
  end
end

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
puts "señal final en cable 'a': #{resulting_signals['a']}