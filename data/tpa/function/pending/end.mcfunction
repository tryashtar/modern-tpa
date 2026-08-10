# remove this request and reset all relevant triggers
$scoreboard players reset $(to) tpaccept_$(from)
$scoreboard players reset $(to) tpreject_$(from)
$scoreboard players reset $(from) tpcancel_$(to)
$scoreboard players enable $(from) tpa_$(to)
$scoreboard players enable $(from) tpahere_$(to)

# flag bulk triggers for removal
scoreboard players set #ended tpaindex 1
$tag $(to) add tpa_end1
$tag $(from) add tpa_end2

$stopwatch remove tpa:$(from)/$(to)
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
