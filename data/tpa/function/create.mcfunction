$scoreboard objectives add tpa_$(name) trigger "Request teleport to $(name)"
$data modify storage tpa:data menu append value {index:$(index),label:["",{atlas:"gui",sprite:"friends/send_request",shadow_color:0}," ",{player:{name:"$(name)"}}," ","$(name)"],tooltip:"Request to teleport to this player",action:{type:"run_command",command:"trigger tpa_$(name)"}}
