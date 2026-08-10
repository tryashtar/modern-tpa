# save the player's name and index
# we need a list of names so we can iterate the generated trigger objectives with macros
# the index helps players find their own pending requests for the menu
# it also serves as a registration flag that is intentionally lost when the player changes their name
scoreboard players add #index tpaindex 1
execute store result storage tpa:data temp.entry.index int 1 run scoreboard players operation @s tpaindex = #index tpaindex
tag @s add tpa_current
summon text_display ~ ~ ~ {text:{selector:"@a[tag=tpa_current,limit=1]"},UUID:[I;1716794702,2087798280,-1181833320,1792419479]}
tag @s remove tpa_current
data modify storage tpa:data temp.entry.name set from entity 6654354e-7c71-4608-b98e-a7986ad62697 text.text
kill 6654354e-7c71-4608-b98e-a7986ad62697
function tpa:registry/add with storage tpa:data temp.entry
data modify storage tpa:data persist.players append from storage tpa:data temp.entry
