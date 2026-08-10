# remove the button to send a request to yourself
$data remove storage tpa:data personal.menu[{index:$(id)}]

# remove all buttons for requests that are already outgoing
# remove all buttons for requests that have incoming tpa requests
data modify storage tpa:data outgoing_ids set value []
$data modify storage tpa:data outgoing_ids append from storage tpa:data pending[{from_index:{index:$(id)}}].to_index
$data modify storage tpa:data outgoing_ids append from storage tpa:data pending[{here:0b,to_index:{index:$(id)}}].from_index
execute if data storage tpa:data outgoing_ids[0] run function tpa:menu/personal_loop with storage tpa:data outgoing_ids[0]

# add buttons to cancel outgoing requests, and accept/reject incoming requests
$data modify storage tpa:data personal.menu prepend from storage tpa:data pending[{to_index:{index:$(id)}}].menu_reject
$data modify storage tpa:data personal.menu prepend from storage tpa:data pending[{to_index:{index:$(id)}}].menu_accept
$data modify storage tpa:data personal.menu prepend from storage tpa:data pending[{from_index:{index:$(id)}}].menu_cancel
