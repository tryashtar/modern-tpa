$execute unless data storage tpa:data persist.online[{name:"$(insertion)"}] run function tpa:online/join {name:"$(insertion)"}

data remove storage tpa:data temp.new_players[0]
execute if data storage tpa:data temp.new_players[0] run function tpa:online/join_loop with storage tpa:data temp.new_players[0]
