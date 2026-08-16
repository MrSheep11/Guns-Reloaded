# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:vine run return run data modify storage gunsr:bullet hit_block set value "minecraft:vine"
execute if block ~ ~ ~ minecraft:void_air run return run data modify storage gunsr:bullet hit_block set value "minecraft:void_air"
execute if block ~ ~ ~ minecraft:wall_torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:wall_torch"
execute if block ~ ~ ~ minecraft:warped_button run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_button"
execute if block ~ ~ ~ minecraft:warped_door run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_door"
execute if block ~ ~ ~ minecraft:warped_fence run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_fence"
execute if block ~ ~ ~ minecraft:warped_fence_gate run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_fence_gate"
execute if block ~ ~ ~ minecraft:warped_fungus run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_fungus"
execute if block ~ ~ ~ minecraft:warped_hanging_sign run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_hanging_sign"
return 0
