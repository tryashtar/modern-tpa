# this function is not called by the pack
# it can be run manually to rebuild the saved list of player names
scoreboard players reset * tpaindex
data modify storage tpa:data menu set value []
data modify storage tpa:data pending set value []
execute if data storage tpa:data names[0] run function tpa:registry/remove_loop with storage tpa:data names[0]
