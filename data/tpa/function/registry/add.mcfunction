# create per-player triggers
$scoreboard objectives add tpa_$(name) trigger {translate:"tpa.trigger.request",fallback:"Request teleport to %s",with:["$(name)"]}
$scoreboard objectives add tpcancel_$(name) trigger {translate:"tpa.trigger.cancel",fallback:"Cancel teleport request to %s",with:["$(name)"]}
$scoreboard objectives add tpaccept_$(name) trigger {translate:"tpa.trigger.accept",fallback:"Allow %s to teleport to you",with:["$(name)"]}
$scoreboard objectives add tpreject_$(name) trigger {translate:"tpa.trigger.reject",fallback:"Disallow %s to teleport to you",with:["$(name)"]}

# this will be inserted into the menu with a macro
# the "index" field is not part of the dialog schema, it's for filtering
$data modify storage tpa:data menu append value {index:$(index),label:{translate:"tpa.menu.request.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/send_request",shadow_color:0},{player:{name:"$(name)"}},"$(name)"]},tooltip:{translate:"tpa.menu.request.tooltip",fallback:"Request to teleport to this player"},action:{type:"run_command",command:"trigger tpa_$(name)"}}
$data modify storage tpa:data lookups.$(index) set value "$(name)"

# command to run when later searching for online players
# this player is online now, so we check to see if they go offline
$data modify storage tpa:data entry.online_check set value 'execute unless entity $(name) run function tpa:online/leave {name:"$(name)",index:$(index)}'
