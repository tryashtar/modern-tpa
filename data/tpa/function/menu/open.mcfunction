scoreboard players reset @s tpa

data modify storage tpa:data temp.personal.menu set value []
data modify storage tpa:data temp.personal.menu append from storage tpa:data persist.online[].menu.tpa

# add user-specific entries to the menu
execute store result storage tpa:data temp.personal.id int 1 run scoreboard players get @s tpaindex
function tpa:menu/personal with storage tpa:data temp.personal

# show the menu
execute unless data storage tpa:data temp.personal.menu[0] run return run tellraw @s {translate:"tpa.menu.empty",fallback:"There are no players to teleport to",color:"red"}
function tpa:menu/show with storage tpa:data temp.personal
