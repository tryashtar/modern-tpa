$$(online_check)

data remove storage tpa:data temp.iter[0]
execute if data storage tpa:data temp.iter[0] run function tpa:online/find_loop with storage tpa:data temp.iter[0]
