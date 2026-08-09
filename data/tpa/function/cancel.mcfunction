$scoreboard players reset @s tpcancel_$(name)
$scoreboard players enable @s tpa_$(name)
$scoreboard players reset @s tpaout_$(name)
execute store result storage tpa:data iter[0].sender int 1 run scoreboard players get @s tpaindex
function tpa:resolve_lookup with storage tpa:data iter[0]
function tpa:cancel_send with storage tpa:data iter[0]
