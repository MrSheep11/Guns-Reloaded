# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:exposed_lightning_rod run return run data modify storage gunsr:bullet hit_block set value "minecraft:exposed_lightning_rod"
execute if block ~ ~ ~ minecraft:farmland run return run data modify storage gunsr:bullet hit_block set value "minecraft:farmland"
execute if block ~ ~ ~ minecraft:fern run return run data modify storage gunsr:bullet hit_block set value "minecraft:fern"
execute if block ~ ~ ~ minecraft:fire run return run data modify storage gunsr:bullet hit_block set value "minecraft:fire"
execute if block ~ ~ ~ minecraft:fire_coral run return run data modify storage gunsr:bullet hit_block set value "minecraft:fire_coral"
execute if block ~ ~ ~ minecraft:fire_coral_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:fire_coral_block"
execute if block ~ ~ ~ minecraft:fire_coral_fan run return run data modify storage gunsr:bullet hit_block set value "minecraft:fire_coral_fan"
execute if block ~ ~ ~ minecraft:fire_coral_wall_fan run return run data modify storage gunsr:bullet hit_block set value "minecraft:fire_coral_wall_fan"
execute if block ~ ~ ~ minecraft:firefly_bush run return run data modify storage gunsr:bullet hit_block set value "minecraft:firefly_bush"
return 0
