execute as @a[tag=!tpa_registered] at @s run function tpa:register
data modify storage tpa:data iter set from storage tpa:data names
execute if data storage tpa:data iter[0] run function tpa:check_loop
execute as @a[scores={tpaccept=1..}] at @s run function tpa:accept
