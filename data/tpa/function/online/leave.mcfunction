# remove per-player triggers
$scoreboard objectives remove tpa.$(name)
$scoreboard objectives remove tpahere.$(name)
$scoreboard objectives remove tpcancel.$(name)
$scoreboard objectives remove tpreject.$(name)
$scoreboard objectives remove tpaccept.$(name)

# remove stopwatches associated with their requests
data modify storage tpa:data temp.removing set value []
$data modify storage tpa:data temp.removing append from storage tpa:data persist.pending[{from:"$(name)"}]
$data modify storage tpa:data temp.removing append from storage tpa:data persist.pending[{to:"$(name)"}]
execute if data storage tpa:data temp.removing[0] run function tpa:online/remove_loop with storage tpa:data temp.removing[0]

# remove pending requests involving them
$data remove storage tpa:data persist.pending[{from:"$(name)"}]
$data remove storage tpa:data persist.pending[{to:"$(name)"}]

# remove them from the online list
$data remove storage tpa:data persist.online[{name:"$(name)"}]
