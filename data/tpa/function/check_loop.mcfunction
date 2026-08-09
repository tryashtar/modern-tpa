$execute if entity $(name) run scoreboard players enable @a[name=!$(name)] tpa_$(name)
$execute unless entity $(name) as @a run trigger tpa_$(name) add 0
$execute unless entity $(name) run data remove storage tpa:data active_menu[{entry:{name:"$(name)"}}]
$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request {name:"$(name)",index:$(index)}
data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:check_loop with storage tpa:data iter[0]
