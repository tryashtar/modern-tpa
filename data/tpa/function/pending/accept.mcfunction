$function tpa:pending/end {from:"$(from)",to:"$(to)",from_index:$(from_index),to_index:$(to_index)}

$$(accept)
$tellraw $(from) {translate:"tpa.request.accepted",fallback:"Your teleport request to %s was accepted",with:[{selector:"$(to)"}],color:"gold"}
