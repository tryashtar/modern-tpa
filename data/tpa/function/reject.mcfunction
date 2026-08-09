$scoreboard players reset @s tpaccept_$(from)
$scoreboard players reset @s tpreject_$(from)
$scoreboard players reset $(from) tpcancel_$(to)
$scoreboard players enable $(from) tpa_$(to)
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
$stopwatch remove tpa:$(from)_$(to)
