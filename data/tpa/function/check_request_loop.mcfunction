$execute if entity $(name) run function tpa:try_enable {name:"$(name)"}
$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request {name:"$(name)"}
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_request_loop with storage tpa:data iter[0]
