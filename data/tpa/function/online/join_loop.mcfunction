# we even reset the request triggers
# if a player left with an enabled trigger, then the target player left, then the first player rejoined, the request trigger should not be enabled
# triggers that should be enabled will be enabled when scanning for requests to resolve
$scoreboard players reset @a[tag=tpa_join] tpa.$(name)
$scoreboard players reset @a[tag=tpa_join] tpahere.$(name)
$scoreboard players reset @a[tag=tpa_join] tpcancel.$(name)
$scoreboard players reset @a[tag=tpa_join] tpreject.$(name)
$scoreboard players reset @a[tag=tpa_join] tpaccept.$(name)

data remove storage tpa:data temp.iter[0]
execute if data storage tpa:data temp.iter[0] run function tpa:online/join_loop with storage tpa:data temp.iter[0]
