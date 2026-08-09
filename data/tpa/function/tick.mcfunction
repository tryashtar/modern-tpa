# register newly-joined (or renamed) players
execute as @a at @s unless score @s tpaindex matches 1.. run function tpa:register

# update the list of online players
scoreboard players operation #last_players tpaindex = #players tpaindex
execute store result score #players tpaindex if entity @a
execute unless score #players tpaindex = #last_players tpaindex run function tpa:check_online

# check for trigger inputs
data modify storage tpa:data iter set from storage tpa:data names
execute if data storage tpa:data iter[0] run function tpa:check_loop with storage tpa:data iter[0]
execute as @a[scores={tpa=1..}] at @s run function tpa:menu
scoreboard players enable @a tpa
