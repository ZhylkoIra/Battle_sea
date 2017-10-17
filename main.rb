# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    main.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexandr <alexandr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/24 17:05:38 by alexandr          #+#    #+#              #
#    Updated: 2017/09/24 22:48:48 by alexandr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "./general_methods.rb"
require "./battlefield.rb"

answer = ""
while answer != "n"
	arr_ships = create_ships							# create an array, filled with ships
	arr_map = create_map								# create an empty array with dots
	battlefield = Battlefield.new(arr_ships, arr_map)	# create a new battlefield
	battlefield.create									# insert ships into the map
	battlefield.show									# output
	answer = ask("Create a new map? (y/n)")
end
