# this player has joined the game
# mark them to have their lingering triggers reset
tag @s add tpa_join

# toggle the online check for next time
$data modify storage tpa:data persist.players[{name:"$(name)"}].online_check set value 'execute unless entity $(name) run function tpa:online/leave {name:"$(name)"}'
