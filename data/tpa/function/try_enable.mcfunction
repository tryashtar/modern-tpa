data modify storage tpa:data incoming_requests set value []
$data modify storage tpa:data incoming_requests append from storage tpa:data pending[{to:"$(name)"}]
execute if data storage tpa:data incoming_requests[0] run function tpa:try_enable_loop with storage tpa:data incoming_requests[0]
$scoreboard players enable @a[name=!$(name),tag=!tpa_incoming] tpa_$(name)
tag @a[tag=tpa_incoming] remove tpa_incoming
