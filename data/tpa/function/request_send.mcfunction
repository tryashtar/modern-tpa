$scoreboard players enable $(name) tpaccept_$(sender)
$scoreboard players enable $(name) tpaccept
$scoreboard players enable $(name) tpreject_$(sender)
$scoreboard players enable $(name) tpreject
$tellraw $(name) ["",{selector:"@s",color:"gold"}," is requesting to teleport to you. ",{text:"[Click here to accept]",color:"green",click_event:{action:"run_command",command:"/trigger tpaccept_$(sender)"}}]
$data modify storage tpa:data pending append value {from:"$(sender)",to:"$(name)",from_index:{index:$(sender_index)},to_index:{index:$(index)},menu_cancel:{label:["",{atlas:"gui",sprite:"friends/cancel",shadow_color:0}," ",{player:{name:"$(name)"}}," ","$(name)"],tooltip:"Cancel request to teleport to this player",action:{type:"run_command",command:"trigger tpcancel_$(name)"}},menu_accept:{label:["",{atlas:"gui",sprite:"friends/accept",shadow_color:0}," ",{player:{name:"$(sender)"}}," ","$(sender)"],tooltip:"Allow this player to teleport to you",action:{type:"run_command",command:"trigger tpaccept_$(sender)"}},menu_reject:{label:["",{atlas:"gui",sprite:"friends/reject",shadow_color:0}," ",{player:{name:"$(sender)"}}," ","$(sender)"],tooltip:"Disallow this player to teleport to you",action:{type:"run_command",command:"trigger tpreject_$(sender)"}}}
# remove a stopwatch that may have been lingering from either player logging out
$stopwatch remove tpa:$(sender)_$(name)
$stopwatch create tpa:$(sender)_$(name)
