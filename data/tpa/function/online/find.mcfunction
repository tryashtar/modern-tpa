# invalidate the "bulk" triggers, since they could be enabled for requests that are about to be removed
# they will be re-enabled when scanning for requests to resolve
scoreboard players reset @a tpcancel
scoreboard players reset @a tpreject
scoreboard players reset @a tpaccept

# we also build online-only versions of the name and menu lists
data modify storage tpa:data online_menu set from storage tpa:data menu
data modify storage tpa:data online_names set from storage tpa:data names
data modify storage tpa:data iter set from storage tpa:data names
execute if data storage tpa:data iter[0] run function tpa:online/find_loop with storage tpa:data iter[0]

# disable lingering triggers for joining players
data modify storage tpa:data iter set from storage tpa:data names
execute if entity @a[tag=tpa_join,limit=1] if data storage tpa:data iter[0] run function tpa:online/join_loop
tag @a[tag=tpa_join] remove tpa_join
