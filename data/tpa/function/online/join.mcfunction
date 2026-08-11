# create and enable per-player triggers
$scoreboard objectives add tpa.$(name) trigger {translate:"tpa.trigger.request",fallback:"Request to teleport to %s",with:["$(name)"]}
$scoreboard objectives add tpahere.$(name) trigger {translate:"tpa.trigger.request",fallback:"Request %s to teleport to you",with:["$(name)"]}
$scoreboard objectives add tpcancel.$(name) trigger {translate:"tpa.trigger.cancel",fallback:"Cancel teleport request to %s",with:["$(name)"]}
$scoreboard objectives add tpaccept.$(name) trigger {translate:"tpa.trigger.accept",fallback:"Accept %s's teleport request",with:["$(name)"]}
$scoreboard objectives add tpreject.$(name) trigger {translate:"tpa.trigger.reject",fallback:"Reject %s's teleport request",with:["$(name)"]}
$scoreboard players enable @a[name=!$(name)] tpa.$(name)
$scoreboard players enable @a[name=!$(name)] tpahere.$(name)

# add this player to the online list
$data modify storage tpa:data temp.entry set value {name:"$(name)"}
scoreboard players add #index tpaindex 1
$execute store result storage tpa:data temp.entry.index int 1 run scoreboard players operation $(name) tpaindex = #index tpaindex
function tpa:online/add_menu with storage tpa:data temp.entry
data modify storage tpa:data persist.online append from storage tpa:data temp.entry

# mark this player as joined so we can reset any lingering triggers they left with
$tag $(name) add tpa_join
