tag @s add tpa_registered
tag @s add tpa_current
summon text_display ~ ~ ~ {text:{selector:"@a[tag=tpa_current,limit=1]"},UUID:[I;1716794702,2087798280,-1181833320,1792419479]}
tag @s remove tpa_current
data modify storage tpa:data entry.name set from entity 6654354e-7c71-4608-b98e-a7986ad62697 text.text
kill 6654354e-7c71-4608-b98e-a7986ad62697
scoreboard players add #index tpaindex 1
scoreboard players operation @s tpaindex = #index tpaindex
execute store result storage tpa:data entry.index int 1 run scoreboard players get #index tpaindex
function tpa:create with storage tpa:data entry
data modify storage tpa:data names append from storage tpa:data entry
