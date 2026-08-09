$scoreboard players reset @s tpcancel_$(to)
$scoreboard players enable @s tpa_$(to)
$scoreboard players reset $(to) tpaccept_$(from)
$scoreboard players reset $(to) tpreject_$(from)
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
