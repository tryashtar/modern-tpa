$scoreboard players reset @s tpaccept_$(from)
$scoreboard players reset @s tpreject_$(from)
$scoreboard players reset $(from) tpcancel_$(to)
$scoreboard players enable $(from) tpa_$(to)
$tp $(from) ~ ~ ~ ~ ~
$tellraw $(from) {text:"Your teleport request to $(to) was accepted",color:"gold"}
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
$stopwatch remove tpa:$(from)_$(to)
