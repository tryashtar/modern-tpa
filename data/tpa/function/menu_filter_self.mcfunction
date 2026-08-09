$data remove storage tpa:data personal_menu[{index:$(personal_id)}]
data modify storage tpa:data outgoing_ids set value []
$data modify storage tpa:data outgoing_ids append from storage tpa:data pending[{from_index:{index:$(personal_id)}}].to_index
execute if data storage tpa:data outgoing_ids[0] run function tpa:menu_filter_self_loop with storage tpa:data outgoing_ids[0]
$data modify storage tpa:data personal_menu prepend from storage tpa:data pending[{to_index:{index:$(personal_id)}}].menu_reject
$data modify storage tpa:data personal_menu prepend from storage tpa:data pending[{to_index:{index:$(personal_id)}}].menu_accept
$data modify storage tpa:data personal_menu prepend from storage tpa:data pending[{from_index:{index:$(personal_id)}}].menu_cancel
