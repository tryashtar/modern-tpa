scoreboard players reset * tpaindex
data modify storage tpa:data menu set value []
data modify storage tpa:data pending set value []
execute if data storage tpa:data names[0] run function tpa:reset_loop with storage tpa:data names[0]
