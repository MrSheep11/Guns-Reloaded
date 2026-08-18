### Creates a generic error message in chat
### Parameters:
### > "message" - text to be displayed

$tellraw @a[scores={mcfem.show_errors=1}] [{"text":"[MCF ENTITYMAP] Error: ","color":"dark_red","bold":true}, \
                                            {"text":"$(message)","color":"red","bold":false}]

execute as @a[scores={mcfem.show_errors=1}] at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5