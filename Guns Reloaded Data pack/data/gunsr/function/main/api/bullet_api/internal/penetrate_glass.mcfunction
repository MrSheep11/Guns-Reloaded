# Shatter the current glass block without entering the normal impact path.
# Each distinct block consumes exactly one integer point of fire_power.
data modify storage gunsr:bullet hit_block set value "minecraft:glass"
function gunsr:main/api/bullet_api/internal/set_block_particle
function gunsr:main/api/bullet_api/internal/spawn_block_particle with storage gunsr:bullet
setblock ~ ~ ~ minecraft:air
scoreboard players remove @s gunsr.fire 1
