# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:deepslate_tile_stairs run return run data modify storage gunsr:bullet hit_block set value "minecraft:deepslate_tile_stairs"
execute if block ~ ~ ~ minecraft:deepslate_tile_wall run return run data modify storage gunsr:bullet hit_block set value "minecraft:deepslate_tile_wall"
execute if block ~ ~ ~ minecraft:deepslate_tiles run return run data modify storage gunsr:bullet hit_block set value "minecraft:deepslate_tiles"
execute if block ~ ~ ~ minecraft:detector_rail run return run data modify storage gunsr:bullet hit_block set value "minecraft:detector_rail"
execute if block ~ ~ ~ minecraft:diamond_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:diamond_block"
execute if block ~ ~ ~ minecraft:diamond_ore run return run data modify storage gunsr:bullet hit_block set value "minecraft:diamond_ore"
execute if block ~ ~ ~ minecraft:diorite run return run data modify storage gunsr:bullet hit_block set value "minecraft:diorite"
execute if block ~ ~ ~ minecraft:diorite_slab run return run data modify storage gunsr:bullet hit_block set value "minecraft:diorite_slab"
execute if block ~ ~ ~ minecraft:diorite_stairs run return run data modify storage gunsr:bullet hit_block set value "minecraft:diorite_stairs"
return 0
