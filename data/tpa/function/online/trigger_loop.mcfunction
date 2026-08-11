# set up the correct trigger state on join
$scoreboard players enable @a[tag=tpa_join,name=!$(name)] tpa.$(name)
$scoreboard players enable @a[tag=tpa_join,name=!$(name)] tpahere.$(name)
$scoreboard players reset @a[tag=tpa_join] tpcancel.$(name)
$scoreboard players reset @a[tag=tpa_join] tpreject.$(name)
$scoreboard players reset @a[tag=tpa_join] tpaccept.$(name)

data remove storage tpa:data temp.iter[0]
execute if data storage tpa:data temp.iter[0] run function tpa:online/trigger_loop with storage tpa:data temp.iter[0]
