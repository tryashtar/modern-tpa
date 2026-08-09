scoreboard players reset @s tpa
data modify storage tpa:data personal_menu set from storage tpa:data online_menu
execute store result storage tpa:data personal_id int 1 run scoreboard players get @s tpaindex
function tpa:menu_filter_self with storage tpa:data
execute unless data storage tpa:data personal_menu[0] run return run tellraw @s {text:"There are no players to teleport to",color:"red"}
function tpa:menu_show with storage tpa:data
