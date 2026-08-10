# enable the relevant triggers
$scoreboard players reset @s tpa_$(name)
$scoreboard players enable @s tpcancel_$(name)
scoreboard players enable @s tpcancel

# get the player's name from their index, without having to resolve another text component
execute store result storage tpa:data iter[0].sender_index int 1 run scoreboard players get @s tpaindex
function tpa:request/lookup with storage tpa:data iter[0]

function tpa:request/send with storage tpa:data iter[0]
