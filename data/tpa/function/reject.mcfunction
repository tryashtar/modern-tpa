$scoreboard players reset @s tpaccept_$(name)
$scoreboard players reset @s tpreject_$(name)
$scoreboard players reset @s tpain_$(name)
execute store result storage tpa:data iter[0].sender int 1 run scoreboard players get @s tpaindex
function tpa:resolve_lookup with storage tpa:data iter[0]
$execute as $(name) run function tpa:reject_send with storage tpa:data iter[0]
