# enable triggers for this request
# this must be done every tick, since players can run "trigger add 0" to disable their own trigger
$scoreboard players enable $(from) tpcancel_$(to)
$scoreboard players enable $(from) tpcancel
$scoreboard players enable $(to) tpaccept_$(from)
$scoreboard players enable $(to) tpaccept
$scoreboard players enable $(to) tpreject_$(from)
$scoreboard players enable $(to) tpreject

# handle timeouts
$execute if stopwatch tpa:$(from)/$(to) 60.. run function tpa:pending/end {from:"$(from)",to:"$(to)"}

# fulfill requests
$execute as $(from) if score @s tpcancel_$(to) matches 1.. run function tpa:pending/end {from:"$(from)",to:"$(to)"}
$execute as $(from) if score @s tpcancel matches 1.. run function tpa:pending/end {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpaccept_$(from) matches 1.. run function tpa:pending/accept {from:"$(from)",to:"$(to)",accept:"$(accept)"}
$execute as $(to) if score @s tpaccept matches 1.. run function tpa:pending/accept {from:"$(from)",to:"$(to)",accept:"$(accept)"}
$execute as $(to) if score @s tpreject_$(from) matches 1.. run function tpa:pending/end {from:"$(from)",to:"$(to)"}
$execute as $(to) if score @s tpreject matches 1.. run function tpa:pending/end {from:"$(from)",to:"$(to)"}

data remove storage tpa:data temp.iter[0]
execute if data storage tpa:data temp.iter[0] run function tpa:pending/check_loop with storage tpa:data temp.iter[0]
