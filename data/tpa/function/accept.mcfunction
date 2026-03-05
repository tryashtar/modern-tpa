scoreboard players reset @s tpaccept
scoreboard players operation #temp tpaindex = @s tpaindex
execute as @a if score @s tpawaiting = #temp tpaindex run function tpa:teleport
