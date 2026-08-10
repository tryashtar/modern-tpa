# enable trigger requests to this player
# this must be done every tick, since players can run "trigger add 0" to disable their own trigger
# we can only enable requests for players that don't already have an outgoing request to this player
# so, annoyingly, we need to iterate pending requests to find these players
data modify storage tpa:data incoming_requests set value []
$data modify storage tpa:data incoming_requests append from storage tpa:data pending[{to:"$(name)"}]
execute if data storage tpa:data incoming_requests[0] run function tpa:request/enable_loop with storage tpa:data incoming_requests[0]

# now enable the trigger for all allowed players
$scoreboard players enable @a[name=!$(name),tag=!tpa_incoming] tpa_$(name)
tag @a[tag=tpa_incoming] remove tpa_incoming

# handle requests that have been triggered
$execute as @a[scores={tpa_$(name)=1..}] run function tpa:request/make {name:"$(name)"}

data remove storage tpa:data iter[0]
execute if data storage tpa:data iter[0] run function tpa:request/check_loop with storage tpa:data iter[0]
