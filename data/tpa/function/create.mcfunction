$scoreboard objectives add tpa_$(name) trigger "Request teleport to $(name)"
$scoreboard objectives add tpcancel_$(name) trigger "Cancel teleport request to $(name)"
$scoreboard objectives add tpaccept_$(name) trigger "Allow $(name) to teleport to you"
$scoreboard objectives add tpreject_$(name) trigger "Disallow $(name) to teleport to you"
$scoreboard objectives add tpaout_$(name) dummy
$scoreboard objectives add tpain_$(name) dummy
$data modify storage tpa:data menu append value {index:$(index),label:["",{atlas:"gui",sprite:"friends/send_request",shadow_color:0}," ",{player:{name:"$(name)"}}," ","$(name)"],tooltip:"Request to teleport to this player",action:{type:"run_command",command:"trigger tpa_$(name)"}}
$data modify storage tpa:data lookups.$(index) set value $(name)
