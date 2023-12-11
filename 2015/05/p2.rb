# coding: utf-8

def se_porta_bien?(string)
  # Regla 1: Contiene un par de dos letras que aparecen al menos dos veces en la cadena sin solapamiento
  par_repetido = string =~ /(.{2}).*\1/
  return false unless par_repetido

  # Regla 2: Contiene al menos una letra que se repite con exactamente una letra entre ellas
  repeat_with_one_between = string =~ /(.).\1/
  return false unless repeat_with_one_between

  # Si pasa ambas reglas, la cadena es "buena"
  true
end

# Contar el número total de cadenas "buena" en un archivo
conducta = File.read('ejemplo.txt')
strings_buenos = conducta.split("\n").count { |linea| se_porta_bien?(linea) }

puts "Número total de cadenas 'buena': #{strings_buenos}"
