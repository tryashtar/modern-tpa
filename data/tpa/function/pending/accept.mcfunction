$function tpa:pending/end {from:"$(from)",to:"$(to)"}

$$(accept)
$tellraw $(from) {translate:"tpa.request.accepted",fallback:"Your teleport request to %s was accepted",with:[{selector:"$(to)"}],color:"gold"}
