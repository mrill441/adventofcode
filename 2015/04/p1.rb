require 'digest'

def mine_advent_coin(secret_key)
  number = 1
  loop do
    data = "#{secret_key}#{number}"
    hash = Digest::MD5.hexdigest(data)
    
    # Verificar si el hash comienza con al menos cinco ceros
    if hash.start_with?('00000')
      return number
    end

    # Intentar con el siguiente número
    number += 1
  end
end

# Ejemplos de uso
secret_key1 = 'ckczppom'
secret_key2 = 'pqrstuv'

result1 = mine_advent_coin(secret_key1)
result2 = mine_advent_coin(secret_key2)

puts "Si la clave secreta es #{secret_key1}, el resultado debería ser 609043. Resultado: #{result1}"
puts "Si la clave secreta es #{secret_key2}, el resultado debería ser 1048970. Resultado: #{result2}"
