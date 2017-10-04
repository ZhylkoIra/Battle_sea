# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ship.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexandr <alexandr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/24 17:56:18 by alexandr          #+#    #+#              #
#    Updated: 2017/09/24 23:38:42 by alexandr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

class Ship

	attr_reader :name, :life

	def initialize(name, life)
		@name = name
		@life = life
		@position = set_position
	end

	def name
		@name
	end

	def life
		@life
	end

	def position
		@position
	end

	private

	def set_position					# sets random position of the ship
		position = ["across", "along"]
		position[Random.rand(2)]
	end
end