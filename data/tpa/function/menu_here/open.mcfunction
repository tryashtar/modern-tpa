scoreboard players reset @s tpahere

data modify storage tpa:data temp.personal.menu set value []
data modify storage tpa:data temp.personal.menu append from storage tpa:data persist.online[].menu.tpahere

# add user-specific entries to the menu
execute store result storage tpa:data temp.personal.id int 1 run scoreboard players get @s tpaindex
function tpa:menu_here/personal with storage tpa:data temp.personal

# show the menu
execute unless data storage tpa:data temp.personal.menu[0] run return run tellraw @s {translate:"tpa.menu_here.empty",fallback:"There are no players to teleport",color:"red"}
function tpa:menu_here/show with storage tpa:data temp.personal
