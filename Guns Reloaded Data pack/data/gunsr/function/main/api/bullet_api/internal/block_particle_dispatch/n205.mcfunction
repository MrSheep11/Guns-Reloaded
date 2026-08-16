# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:snow_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:snow_block"
execute if block ~ ~ ~ minecraft:soul_campfire run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_campfire"
execute if block ~ ~ ~ minecraft:soul_fire run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_fire"
execute if block ~ ~ ~ minecraft:soul_lantern run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_lantern"
execute if block ~ ~ ~ minecraft:soul_sand run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_sand"
execute if block ~ ~ ~ minecraft:soul_soil run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_soil"
execute if block ~ ~ ~ minecraft:soul_torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_torch"
execute if block ~ ~ ~ minecraft:soul_wall_torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:soul_wall_torch"
execute if block ~ ~ ~ minecraft:spawner run return run data modify storage gunsr:bullet hit_block set value "minecraft:spawner"
return 0
