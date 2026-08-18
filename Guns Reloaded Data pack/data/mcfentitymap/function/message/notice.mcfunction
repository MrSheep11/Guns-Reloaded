### Creates a generic error message in chat
### Parameters:
### > "message" - text to be displayed
### > "color" - text color

$tellraw @s [{"text":"[MCF ENTITYMAP] ","color":"green","bold":true}, \
                                    {"text":"$(message)","color":"$(color)","bold":false}]

execute at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 1 1