function tpa:check with storage tpa:data iter[0]
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_loop
