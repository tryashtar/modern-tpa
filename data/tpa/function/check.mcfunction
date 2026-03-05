$execute if entity $(name) run scoreboard players enable @a[name=!$(name)] tpa_$(name)
$execute unless entity $(name) as @a run trigger tpa_$(name) add 0
$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request {name:"$(name)",index:$(index)}
