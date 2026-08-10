# if there is a matching tpahere request, then we should just accept it instead
$execute if data storage tpa:data persist.pending[{here:1b,from:"$(name)",to:"$(sender)"}] run return run function tpa:pending/accept {from:"$(name)",to:"$(sender)",from_index:$(index),to_index:$(sender_index),accept:"tp $(sender) $(name)"}

# enable the relevant triggers
$scoreboard players enable $(name) tpaccept.$(sender)
$scoreboard players enable $(name) tpaccept
$scoreboard players enable $(name) tpreject.$(sender)
$scoreboard players enable $(name) tpreject

# add the request to the pending list, including menu data
# the indices are duplicated so we can use them with some menu macros
$data modify storage tpa:data persist.pending append value {here:0b,accept:"tp $(sender) $(name)",from:"$(sender)",to:"$(name)",from_index:$(sender_index),from_index_nested:{index:$(sender_index)},to_index:$(index),to_index_nested:{index:$(index)},menu_cancel:{label:{translate:"tpa.menu.cancel.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/cancel",shadow_color:0},{player:"$(name)"},"$(name)"]},tooltip:{translate:"tpa.menu.cancel.tooltip",fallback:"Cancel request to teleport to this player"},action:{type:"run_command",command:"trigger tpcancel.$(name)"}},menu_accept:{label:{translate:"tpa.menu.accept.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/accept",shadow_color:0},{player:"$(sender)"},"$(sender)"]},tooltip:{translate:"tpa.menu.accept.tooltip",fallback:"Allow this player to teleport to you"},action:{type:"run_command",command:"trigger tpaccept.$(sender)"}},menu_reject:{label:{translate:"tpa.menu.reject.button",fallback:"%s %s %s",with:[{atlas:"gui",sprite:"friends/reject",shadow_color:0},{player:"$(sender)"},"$(sender)"]},tooltip:{translate:"tpa.menu.reject.tooltip",fallback:"Disallow this player to teleport to you"},action:{type:"run_command",command:"trigger tpreject.$(sender)"}}}

# the stopwatches should always be cleaned up, but delete an existing one just in case
# we wouldn't want the request to instantly invalidate itself
$stopwatch remove tpa:timeout_$(sender_index)_$(index)
$stopwatch create tpa:timeout_$(sender_index)_$(index)

# send a message
$tellraw $(name) {translate:"tpa.request.message",fallback:"%s is requesting to teleport to you. %s",with:[{selector:"@s",color:"gold"},{translate:"tpa.request.prompt",fallback:"[✔ Click here to accept]",color:"green",click_event:{action:"run_command",command:"/trigger tpaccept.$(sender)"}}]}
