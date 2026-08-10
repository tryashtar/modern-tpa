# this player has left the game
# cancel all requests related to them
$scoreboard players reset @a tpa.$(name)
$scoreboard players reset @a tpahere.$(name)
$scoreboard players reset @a tpcancel.$(name)
$scoreboard players reset @a tpreject.$(name)
$scoreboard players reset @a tpaccept.$(name)

# remove pending requests and their stopwatches
data modify storage tpa:data temp.removing set value []
$data modify storage tpa:data temp.removing append from storage tpa:data persist.pending[{from:"$(name)"}]
$data modify storage tpa:data temp.removing append from storage tpa:data persist.pending[{to:"$(name)"}]
execute if data storage tpa:data temp.removing[0] run function tpa:online/leave_loop with storage tpa:data temp.removing[0]
$data remove storage tpa:data persist.pending[{from:"$(name)"}]
$data remove storage tpa:data persist.pending[{to:"$(name)"}]

# remove them from the online list
$data remove storage tpa:data persist.online[{name:"$(name)"}]

# toggle the online check for next time
$data modify storage tpa:data persist.players[{name:"$(name)"}].online_check set value 'execute as $(name) run function tpa:online/join {name:"$(name)"}'
