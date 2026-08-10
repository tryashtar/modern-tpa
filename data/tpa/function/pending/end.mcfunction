# remove this request and reset all relevant triggers
$scoreboard players reset $(to) tpaccept.$(from)
$scoreboard players reset $(to) tpreject.$(from)
$scoreboard players reset $(from) tpcancel.$(to)
$scoreboard players enable $(from) tpa.$(to)
$scoreboard players enable $(from) tpahere.$(to)

# flag bulk triggers for removal
scoreboard players set #ended tpaindex 1
$tag $(to) add tpa_end1
$tag $(from) add tpa_end2

$stopwatch remove tpa:timeout_$(from_index)_$(to_index)
$data remove storage tpa:data persist.pending[{from:"$(from)",to:"$(to)"}]
