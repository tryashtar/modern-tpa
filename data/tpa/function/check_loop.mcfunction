$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request {name:"$(name)",index:$(index)}
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_loop with storage tpa:data iter[0]
