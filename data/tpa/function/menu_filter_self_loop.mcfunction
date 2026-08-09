$data remove storage tpa:data personal_menu[{index:$(index)}]
data remove storage tpa:data outgoing_ids[0]
execute if data storage tpa:data outgoing_ids[0] run function tpa:menu_filter_self_loop with storage tpa:data outgoing_ids[0]
