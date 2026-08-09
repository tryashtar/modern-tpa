$scoreboard players reset @s tpa_$(name)
$scoreboard players enable @s tpcancel_$(name)
scoreboard players enable @s tpcancel
execute store result storage tpa:data iter[0].sender_index int 1 run scoreboard players get @s tpaindex
function tpa:resolve_lookup with storage tpa:data iter[0]
function tpa:request_send with storage tpa:data iter[0]
