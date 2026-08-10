$data remove storage tpa:data temp.personal.menu[{index:$(index)}]

data remove storage tpa:data temp.outgoing_ids[0]
execute if data storage tpa:data temp.outgoing_ids[0] run function tpa:menu/personal_loop with storage tpa:data temp.outgoing_ids[0]
