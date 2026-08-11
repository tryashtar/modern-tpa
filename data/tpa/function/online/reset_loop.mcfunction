$function tpa:online/leave {name:"$(name)"}

execute if data storage tpa:data persist.online[0] run function tpa:registry/remove_loop with storage tpa:data persist.online[0]
