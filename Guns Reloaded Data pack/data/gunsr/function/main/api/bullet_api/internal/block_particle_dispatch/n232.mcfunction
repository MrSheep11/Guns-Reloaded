# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:warped_trapdoor run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_trapdoor"
execute if block ~ ~ ~ minecraft:warped_wall_hanging_sign run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_wall_hanging_sign"
execute if block ~ ~ ~ minecraft:warped_wall_sign run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_wall_sign"
execute if block ~ ~ ~ minecraft:warped_wart_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:warped_wart_block"
execute if block ~ ~ ~ minecraft:water run return run data modify storage gunsr:bullet hit_block set value "minecraft:water"
execute if block ~ ~ ~ minecraft:water_cauldron run return run data modify storage gunsr:bullet hit_block set value "minecraft:water_cauldron"
execute if block ~ ~ ~ minecraft:waxed_chiseled_copper run return run data modify storage gunsr:bullet hit_block set value "minecraft:waxed_chiseled_copper"
execute if block ~ ~ ~ minecraft:waxed_copper_bars run return run data modify storage gunsr:bullet hit_block set value "minecraft:waxed_copper_bars"
execute if block ~ ~ ~ minecraft:waxed_copper_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:waxed_copper_block"
return 0
