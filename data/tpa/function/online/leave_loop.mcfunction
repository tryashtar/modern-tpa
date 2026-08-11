$execute unless entity $(name) run function tpa:online/leave {name:"$(name)"}

data remove storage tpa:data temp.iter[0]
execute if data storage tpa:data temp.iter[0] run function tpa:online/leave_loop with storage tpa:data temp.iter[0]
