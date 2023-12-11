require 'digest'

def mine_advent_coin(secret_key, leading_zeros_count)
  number = 1
  loop do
    data = "#{secret_key}#{number}"
    hash = Digest::MD5.hexdigest(data)
    
    # Verificar si el hash comienza con el número especificado de ceros
    if hash.start_with?('0' * leading_zeros_count)
      return number
    end

    # Intentar con el siguiente número
    number += 1
  end
end

# Ejemplos de uso
secret_key1 = 'ckczppom'
secret_key2 = 'ckczppom'

result1 = mine_advent_coin(secret_key1, 5) # Cambiado a 5 ceros
result2 = mine_advent_coin(secret_key2, 5) # Cambiado a 5 ceros

puts "Si la clave secreta es #{secret_key1}, el resultado debería ser 609043. Resultado: #{result1}"
puts "Si la clave secreta es #{secret_key2}, el resultado debería ser 1048970. Resultado: #{result2}"

# Buscar uno que comience con seis ceros
secret_key3 = 'ckczppom' # Reemplazar con tu clave secreta
result3 = mine_advent_coin(secret_key3, 6) # Buscar seis ceros

puts "Si la clave secreta es #{secret_key3}, el resultado debería tener seis ceros. Resultado: #{result3}"
