# remove this request and reset all relevant triggers
# invalidate the "bulk" triggers too, since this could be the final request
# they will be re-enabled when scanning for requests to resolve
$scoreboard players reset $(to) tpaccept_$(from)
$scoreboard players reset $(to) tpaccept
$scoreboard players reset $(to) tpreject_$(from)
$scoreboard players reset $(to) tpreject
$scoreboard players reset $(from) tpcancel_$(to)
$scoreboard players reset $(from) tpcancel
$scoreboard players enable $(from) tpa_$(to)

$stopwatch remove tpa:$(from)/$(to)
$data remove storage tpa:data pending[{from:"$(from)",to:"$(to)"}]
