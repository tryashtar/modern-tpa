$scoreboard objectives remove tpa.$(name)
$scoreboard objectives remove tpahere.$(name)
$scoreboard objectives remove tpaccept.$(name)
$scoreboard objectives remove tpcancel.$(name)
$scoreboard objectives remove tpreject.$(name)

data remove storage tpa:data persist.players[0]
execute if data storage tpa:data persist.players[0] run function tpa:registry/remove_loop with storage tpa:data persist.players[0]
