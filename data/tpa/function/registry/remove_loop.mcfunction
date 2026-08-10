$scoreboard objectives remove tpa_$(name)
$scoreboard objectives remove tpahere_$(name)
$scoreboard objectives remove tpaccept_$(name)
$scoreboard objectives remove tpcancel_$(name)
$scoreboard objectives remove tpreject_$(name)

data remove storage tpa:data persist.players[0]
execute if data storage tpa:data persist.players[0] run function tpa:registry/remove_loop with storage tpa:data persist.players[0]
