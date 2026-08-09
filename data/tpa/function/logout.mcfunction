$scoreboard players reset @a tpa_$(name)
$scoreboard players reset @a tpcancel_$(name)
$scoreboard players reset @a tpreject_$(name)
$scoreboard players reset @a tpaccept_$(name)
$data remove storage tpa:data online_menu[{index:$(index)}]
$data remove storage tpa:data pending[{from:"$(name)"}]
$data remove storage tpa:data pending[{to:"$(name)"}]
