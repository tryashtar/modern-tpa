$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request {name:"$(name)",index:$(index)}
$execute as @a[scores={tpcancel_$(name)=1..}] at @s run function tpa:cancel {name:"$(name)",index:$(index)}
$execute as @a[scores={tpaccept_$(name)=1..}] at @s run function tpa:accept {name:"$(name)",index:$(index)}
$execute as @a[scores={tpreject_$(name)=1..}] at @s run function tpa:reject {name:"$(name)",index:$(index)}
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_loop with storage tpa:data iter[0]
