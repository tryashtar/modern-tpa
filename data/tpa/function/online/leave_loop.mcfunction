$stopwatch remove tpa:$(from)/$(to)

data remove storage tpa:data removing[0]
execute if data storage tpa:data removing[0] run function tpa:online/leave_loop with storage tpa:data removing[0]
