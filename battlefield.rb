# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    battlefield.rb                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexandr <alexandr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/24 18:09:23 by alexandr          #+#    #+#              #
#    Updated: 2017/09/24 23:32:06 by alexandr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Class creates completed map with randomly filled ships. Method @create@ takes
# empty map, takes array of ships and does *magic* (randomly fills ships).
# Method @show@, actually, shows map.

class Battlefield

	def initialize(arr_ships, arr_map)
		@ships = arr_ships
		@map = arr_map
	end

	def create
		@ships.each_with_index do |obj, index|	
			loop do 															# While optimal random x & y coordinates are not found - loop
				x_pos = (1 + Random.rand(10))
				y_pos = (1 + Random.rand(10))
				if (obj.position == "along" && (x_pos + obj.life) <= 11)		# If horizontal positioned ship does not overflow the map
					break if check(x_pos, y_pos, obj)							# And it's position doesn't cross the rules - break loop
				end
				if (obj.position == "across" && (y_pos + obj.life) <= 11)		# If vertical positioned ship does not overflow the map
					break if check(x_pos, y_pos, obj)							# And it's position doesn't cross the rules - break loop
				end
			end
		end
	end

	def show
		print "# ".bg_blue
		10.times do |x|
			print "#{x} ".bg_red
		end
		print "\n"
		1.upto(10) do |y|
			print "#{(y + 64).chr} ".bg_red
			1.upto(10) do |x|
				print "#{@map[y][x]} ".bg_black.gray
			end
		print "\n"
		end
	end

	private

	def check (x_p, y_p, obj)

		flag = true
			if (obj.position == "along")										# Check rules for horizontal positioned ships
				count = x = x_p - 1
				while x < (x_p + obj.life + 1)	
					if (@map[y_p][x] != "." || @map[y_p + 1][x] != "." || @map[y_p - 1][x] != ".")
						flag = false
						break
					end
					x += 1
				end
			end

			if (obj.position == "across")										# Check rules for vertical positioned ships
				count = y = y_p - 1
				while y < (y_p + obj.life + 1)
					if (@map[y][x_p] != "." || @map[y][x_p + 1] != "." || @map[y][x_p - 1] != ".")
						flag = false
						break
					end
					y += 1
				end
			end
		set_ship(x_p, y_p, obj) if flag											# If everything is fine - set ship
		flag
	end

	def set_ship (x_pos, y_pos, obj)
		if obj.position == "along"
			obj.life.times do |x|
				@map[y_pos][x_pos + x] = obj.life
			end
		elsif obj.position == "across"
			obj.life.times do |y|
				@map[y_pos + y][x_pos] = obj.life
			end
		end
	end
end