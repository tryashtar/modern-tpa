# if there is a matching tpa request, then we should just accept it instead
$execute if data storage tpa:data pending[{here:0b,from:"$(name)",to:"$(sender)"}] run return run function tpa:pending/accept {from:"$(name)",to:"$(sender)",accept:"tp $(name) $(sender)"}

# enable the relevant triggers
$scoreboard players enable $(name) tpaccept_$(sender)
$scoreboard players enable $(name) tpaccept
$scoreboard players enable $(name) tpreject_$(sender)
$scoreboard players enable $(name) tpreject

# add the request to the pending list, including menu data
# the indices are singleton objects so we can use them with some menu macros
$data modify storage tpa:data pending append value {here:1b,accept:"tp $(name) $(sender)",from:"$(sender)",to:"$(name)",from_index:{index:$(sender_index)},to_index:{index:$(index)},menu_cancel:{label:{translate:"tpa.menu.cancel_here.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/cancel",shadow_color:0},{player:"$(name)"},"$(name)"]},tooltip:{translate:"tpa.menu.cancel_here.tooltip",fallback:"Cancel request for this player to teleport to you"},action:{type:"run_command",command:"trigger tpcancel_$(name)"}},menu_accept:{label:{translate:"tpa.menu_here.accept.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/accept",shadow_color:0},{player:"$(sender)"},"$(sender)"]},tooltip:{translate:"tpa.menu.accept_here.tooltip",fallback:"Teleport yourself to this player"},action:{type:"run_command",command:"trigger tpaccept_$(sender)"}},menu_reject:{label:{translate:"tpa.menu.reject_here.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/reject",shadow_color:0},{player:"$(sender)"},"$(sender)"]},tooltip:{translate:"tpa.menu_here.reject.tooltip",fallback:"Do not teleport yourself to this player"},action:{type:"run_command",command:"trigger tpreject_$(sender)"}}}

# the stopwatches should always be cleaned up, but delete an existing one just in case
# we wouldn't want the request to instantly invalidate itself
# we use slash as a delimiter since it can't appear in usernames, avoiding any two username pairs mapping to the same ID
$stopwatch remove tpa:$(sender)/$(name)
$stopwatch create tpa:$(sender)/$(name)

# send a message
$tellraw $(name) {translate:"tpa.request_here.message",fallback:"%s is requesting that you teleport to them. %s",with:[{selector:"@s",color:"gold"},{translate:"tpa.request_here.prompt",fallback:"[✔ Click here to accept]",color:"green",click_event:{action:"run_command",command:"/trigger tpaccept_$(sender)"}}]}
