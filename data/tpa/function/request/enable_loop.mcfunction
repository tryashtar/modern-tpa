$tag $(from) add tpa_incoming
data remove storage tpa:data temp.incoming_requests[0]
execute if data storage tpa:data temp.incoming_requests[0] run function tpa:request/enable_loop with storage tpa:data temp.incoming_requests[0]
