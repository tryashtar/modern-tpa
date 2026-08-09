execute as @a at @s unless score @s tpaindex matches 1.. run function tpa:register
data modify storage tpa:data iter set from storage tpa:data names
data modify storage tpa:data active_menu set from storage tpa:data menu
execute if data storage tpa:data iter[0] run function tpa:check_loop with storage tpa:data iter[0]
execute as @a[scores={tpaccept=1..}] at @s run function tpa:accept
execute as @a[scores={tpa=1..}] at @s run function tpa:menu
scoreboard players enable @a tpa
