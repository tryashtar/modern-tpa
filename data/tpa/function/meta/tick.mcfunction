# register newly-joined (or renamed) players
execute as @a at @s unless score @s tpaindex matches 1.. run function tpa:registry/register

# check for players that have joined or left
# we need to cancel all requests involving leaving players, and reset lingering triggers for joining players
# obviously, the leave_game criteria fires too late to be useful
scoreboard players operation #last_players tpaindex = #players tpaindex
execute store result score #players tpaindex if entity @a
execute unless score #players tpaindex = #last_players tpaindex run function tpa:online/find

# handle menu open triggers
scoreboard players enable @a tpa
scoreboard players enable @a tpahere
execute as @a[scores={tpa=1..}] at @s run function tpa:menu/open
execute as @a[scores={tpahere=1..}] at @s run function tpa:menu_here/open

# check for new requests
data modify storage tpa:data iter set from storage tpa:data online_names
execute if data storage tpa:data iter[0] run function tpa:request/check_loop with storage tpa:data iter[0]

# handle pending requests
scoreboard players set #ended tpaindex 0
data modify storage tpa:data iter set from storage tpa:data pending
execute if data storage tpa:data iter[0] run function tpa:pending/check_loop with storage tpa:data iter[0]
execute if score #ended tpaindex matches 1 run function tpa:pending/end_clear
