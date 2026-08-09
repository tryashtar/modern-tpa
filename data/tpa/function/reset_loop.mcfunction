$scoreboard objectives remove tpa_$(name)
data remove storage tpa:data names[0]
execute if data storage tpa:data names[0] run function tpa:reset_loop with storage tpa:data names[0]
