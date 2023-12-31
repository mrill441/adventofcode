# frozen_string_literal: true

# puts 'Hola Mundo'
require 'pry'

set = File.read('input.txt')
set.split("\n").each do |instrucciones|
  floor = 0
  instrucciones.each_char do |caracter|
    if caracter == '('
      floor += 1
    elsif caracter == ')'
      floor -= 1
    end
  end
  puts "floor: #{floor} #{instrucciones}"
end
