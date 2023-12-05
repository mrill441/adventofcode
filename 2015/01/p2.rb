# frozen_string_literal: true

# puts 'Hola Mundo'
require 'pry'

set = File.read('input.txt')
set.split("\n").each do |instrucciones|
  floor = 0
  posición = 0
  instrucciones.each_char do |caracter|
    posición += 1
    if caracter == '('
      floor += 1
    elsif caracter == ')'
      floor -= 1
    end
    next unless floor == -1

    puts "posición: #{posición} #{instrucciones}"
    break
  end
end
