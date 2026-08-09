$scoreboard players enable $(from) tpcancel_$(to)
$scoreboard players enable $(from) tpcancel
$scoreboard players enable $(to) tpaccept_$(from)
$scoreboard players enable $(to) tpaccept
$scoreboard players enable $(to) tpreject_$(from)
$scoreboard players enable $(to) tpreject
$execute if stopwatch tpa:$(from)_$(to) 60.. run function tpa:reject {from:"$(from)",to:"$(to)"}
$execute as $(from) if score @s tpcancel_$(to) matches 1.. run function tpa:cancel {from:"$(from)",to:"$(to)"}
$execute as $(from) if score @s tpcancel matches 1.. run function tpa:cancel {from:"$(from)",to:"$(to)"}
$execute as $(from) if score @s tpcancel matches 1.. run scoreboard players reset @s tpcancel
$execute as $(to) if score @s tpaccept_$(from) matches 1.. at @s run function tpa:accept {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpaccept matches 1.. at @s run function tpa:accept {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpaccept matches 1.. at @s run scoreboard players reset @s tpaccept
$execute as $(to) if score @s tpreject_$(from) matches 1.. run function tpa:reject {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpreject matches 1.. run function tpa:reject {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpreject matches 1.. run scoreboard players reset @s tpreject
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_resolve_loop with storage tpa:data iter[0]
