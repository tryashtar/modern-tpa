scoreboard players reset @s tpa

# add user-specific entries to the menu
data modify storage tpa:data personal.menu set from storage tpa:data online_menu
execute store result storage tpa:data personal.id int 1 run scoreboard players get @s tpaindex
function tpa:menu/personal with storage tpa:data personal

# show the menu
execute unless data storage tpa:data personal.menu[0] run return run tellraw @s {translate:"tpa.menu.empty",fallback:"There are no players to teleport to",color:"red"}
function tpa:menu/show with storage tpa:data personal
