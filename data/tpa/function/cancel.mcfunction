$scoreboard players reset @s tpcancel_$(to)
scoreboard players reset @s tpcancel
$scoreboard players enable @s tpa_$(to)
$scoreboard players reset $(to) tpaccept_$(from)
$scoreboard players reset $(to) tpaccept
$scoreboard players reset $(to) tpreject_$(from)
$scoreboard players reset $(to) tpreject
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
$stopwatch remove tpa:$(from)_$(to)
