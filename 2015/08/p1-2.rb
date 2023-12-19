def process_string(line)
  # Eliminar comillas al principio y al final de la cadena
  line = line[1..-2]

  # Reemplazar las secuencias de escape específicas
  line.gsub!('\\"', '"')
  line.gsub!('\\\\', '\\')

  # Reemplazar las secuencias de escape hexadecimal
  line.gsub!(/\\x[0-9a-fA-F]{2}/) { |match| match[2..-1].to_i(16).chr }

  line
end

def calculate_difference(file_path)
  total_code_chars = 0
  total_memory_chars = 0

  File.foreach(file_path) do |line|
    # Contar los caracteres de código
    total_code_chars += line.strip.length

    # Procesar la cadena y contar los caracteres en memoria
    memory_string = process_string(line)
    total_memory_chars += memory_string.length
  end

  # Calcular la diferencia
  difference = total_code_chars - total_memory_chars
  puts "La diferencia total es: #{difference}"
end

# Ejemplo de uso con un archivo llamado 'santas_list.txt'
calculate_difference('input_copy.txt')
