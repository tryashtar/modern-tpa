$scoreboard players enable $(name) tpaccept_$(sender)
$scoreboard players enable $(name) tpreject_$(sender)
$tellraw $(name) ["",{selector:"@s",color:"gold"}," is requesting to teleport to you. ",{text:"[Click here to accept]",color:"green",click_event:{action:"run_command",command:"/trigger tpaccept_$(sender)"}}]
