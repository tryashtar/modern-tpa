# enable the relevant triggers
# you can't have a tpa request and a tpahere request to the same player at the same time
# it would make it unclear which one they are accepting
$scoreboard players reset @s tpa.$(name)
$scoreboard players reset @s tpahere.$(name)
$scoreboard players enable @s tpcancel.$(name)
scoreboard players enable @s tpcancel

# get the player's name from their index, without having to resolve another text component
execute store result storage tpa:data temp.iter[0].sender_index int 1 run scoreboard players get @s tpaindex
function tpa:request/lookup with storage tpa:data temp.iter[0]

function tpa:request/send_here with storage tpa:data temp.iter[0]
