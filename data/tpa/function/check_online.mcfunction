data modify storage tpa:data iter set from storage tpa:data names
data modify storage tpa:data online_menu set from storage tpa:data menu
execute if data storage tpa:data iter[0] run function tpa:check_online_loop with storage tpa:data iter[0]
