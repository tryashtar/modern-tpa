$function tpa:pending/end {from:"$(from)",to:"$(to)"}

$tp $(from) $(to)
$tellraw $(from) {translate:"tpa.request.accepted",fallback:"Your teleport request to %s was accepted",with:[{selector:"$(to)"}],color:"gold"}
