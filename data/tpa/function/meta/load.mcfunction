# create global objectives
# per-player objectives are also created as players join
scoreboard objectives add tpaindex dummy
scoreboard objectives add tpa trigger {translate:"tpa.trigger.menu",fallback:"Open teleport request menu"}
scoreboard objectives add tpaccept trigger {translate:"tpa.trigger.accept_all",fallback:"Allow all teleport requests to you"}
scoreboard objectives add tpreject trigger {translate:"tpa.trigger.reject_all",fallback:"Disallow all teleport requests to you"}
scoreboard objectives add tpcancel trigger {translate:"tpa.trigger.cancel_all",fallback:"Cancel all your teleport requests"}
