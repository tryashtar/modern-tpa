# invalidate the "bulk" triggers, since they could be enabled for requests that are about to be removed
# they will be re-enabled when scanning for requests to resolve
scoreboard players reset @a tpcancel
scoreboard players reset @a tpreject
scoreboard players reset @a tpaccept

# check for players that left
data modify storage tpa:data temp.iter set from storage tpa:data persist.online
execute if data storage tpa:data temp.iter[0] run function tpa:online/leave_loop with storage tpa:data temp.iter[0]

# check for players that joined
# collect all player names into a list to iterate
data modify storage tpa:data temp.new_players set value []
execute at @a[limit=1] run summon text_display ~ ~ ~ {text:{selector:"@a",separator:""},UUID:[I;1716794702,2087798280,-1181833320,1792419479]}
execute if score #players tpaindex matches 1 run data modify storage tpa:data temp.new_players append from entity 6654354e-7c71-4608-b98e-a7986ad62697 text{}
execute if score #players tpaindex matches 2.. run data modify storage tpa:data temp.new_players append from entity 6654354e-7c71-4608-b98e-a7986ad62697 text.extra[{}]
kill 6654354e-7c71-4608-b98e-a7986ad62697
execute if data storage tpa:data temp.new_players[0] run function tpa:online/join_loop with storage tpa:data temp.new_players[0]

# update triggers for joining players
data modify storage tpa:data temp.iter set from storage tpa:data persist.online
execute if entity @a[tag=tpa_join,limit=1] if data storage tpa:data temp.iter[0] run function tpa:online/trigger_loop with storage tpa:data temp.iter[0]

execute if score #players tpaindex matches 1 run tag @a add tpa_join
scoreboard players reset @a[tag=tpa_join] tpa
scoreboard players reset @a[tag=tpa_join] tpahere
tag @a[tag=tpa_join] remove tpa_join
