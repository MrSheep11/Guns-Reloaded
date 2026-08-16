# Exponential drag: multiply speed by the gun's configured momentum retention.
scoreboard players operation @s gunsr.speed *= @s gunsr.drag
scoreboard players operation @s gunsr.speed /= #1000 gunsr.bullet

# Gravity increases downward angular velocity by the configured acceleration.
scoreboard players operation @s gunsr.drop += @s gunsr.gravity
scoreboard players operation @s gunsr.pitch += @s gunsr.drop
execute if score @s gunsr.pitch matches 89001.. run scoreboard players set @s gunsr.pitch 89000
execute store result entity @s Rotation[1] float 0.001 run scoreboard players get @s gunsr.pitch
