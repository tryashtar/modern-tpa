$scoreboard players reset @s tpcancel_$(sender)
$scoreboard players enable @s tpa_$(sender)
tp @s ~ ~ ~ ~ ~
$tellraw @s {text:"Your teleport request to $(sender) was accepted",color:"gold"}
