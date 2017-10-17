# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    general_methods.rb                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexandr <alexandr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/24 17:57:07 by alexandr          #+#    #+#              #
#    Updated: 2017/09/24 23:18:07 by alexandr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "./ship.rb"

class String

def gray;           "\e[37m#{self}\e[0m" end 	# colorize console (UNIX)
def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end

end

def ask(string)
	puts string
	gets.chomp
end

def create_ships

	armada = ["Battleship", "Corvette", "Corvette", "Brig", "Brig", "Brig", "Frigate",
		"Frigate", "Frigate", "Frigate"]
	arr_ships = []

	armada.each_with_index do |var, index|
		case var
			when "Battleship"
				life = 4
			when "Corvette"
				life = 3
			when "Brig"
				life = 2
			when "Frigate"
				life = 1
		end
		arr_ships.push(Ship.new(var, life))
	end
	arr_ships
end

def create_map

	arr_map = Array.new(12).map!{Array.new(12)}

	12.times do |y|
		12.times do |x|
			arr_map[y][x] = "."
		end
	end
	arr_map
end
