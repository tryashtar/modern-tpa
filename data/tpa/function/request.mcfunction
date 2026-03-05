$scoreboard players set @s tpa_$(name) 0
$scoreboard players set @s tpawaiting $(index)
$scoreboard players enable $(name) tpaccept
$tellraw $(name) [{selector:"@s",color:"gold"}," is requesting to teleport to you. ",{text:"[Click here to accept]",color:"green",click_event:{action:"run_command",command:"/trigger tpaccept"}}]
