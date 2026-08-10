# remove the button to send a request to yourself
$data remove storage tpa:data temp.personal.menu[{index:$(id)}]

# remove all buttons for requests that are already outgoing
# remove all buttons for requests that have incoming tpa requests
data modify storage tpa:data temp.outgoing_ids set value []
$data modify storage tpa:data temp.outgoing_ids append from storage tpa:data persist.pending[{from_index:$(id)}].to_index_nested
$data modify storage tpa:data temp.outgoing_ids append from storage tpa:data persist.pending[{here:0b,to_index:$(id)}].from_index_nested
execute if data storage tpa:data temp.outgoing_ids[0] run function tpa:menu/personal_loop with storage tpa:data temp.outgoing_ids[0]

# add buttons to cancel outgoing requests, and accept/reject incoming requests
$data modify storage tpa:data temp.personal.menu prepend from storage tpa:data persist.pending[{to_index:$(id)}].menu_reject
$data modify storage tpa:data temp.personal.menu prepend from storage tpa:data persist.pending[{to_index:$(id)}].menu_accept
$data modify storage tpa:data temp.personal.menu prepend from storage tpa:data persist.pending[{from_index:$(id)}].menu_cancel
