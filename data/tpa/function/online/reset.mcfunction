# this function is not called by the pack
# it can be run manually to rebuild the saved list of player names
scoreboard players reset * tpaindex
data modify storage tpa:data persist.pending set value []
execute if data storage tpa:data persist.online[0] run function tpa:online/reset_loop with storage tpa:data persist.online[0]
