$execute unless entity $(name) run function tpa:logout {name:"$(name)",index:$(index)}
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_online_loop with storage tpa:data iter[0]
