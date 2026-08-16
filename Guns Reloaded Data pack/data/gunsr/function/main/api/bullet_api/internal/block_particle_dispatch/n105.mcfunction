# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:infested_mossy_stone_bricks run return run data modify storage gunsr:bullet hit_block set value "minecraft:infested_mossy_stone_bricks"
execute if block ~ ~ ~ minecraft:infested_stone run return run data modify storage gunsr:bullet hit_block set value "minecraft:infested_stone"
execute if block ~ ~ ~ minecraft:infested_stone_bricks run return run data modify storage gunsr:bullet hit_block set value "minecraft:infested_stone_bricks"
execute if block ~ ~ ~ minecraft:iron_bars run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_bars"
execute if block ~ ~ ~ minecraft:iron_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_block"
execute if block ~ ~ ~ minecraft:iron_chain run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_chain"
execute if block ~ ~ ~ minecraft:iron_door run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_door"
execute if block ~ ~ ~ minecraft:iron_ore run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_ore"
execute if block ~ ~ ~ minecraft:iron_trapdoor run return run data modify storage gunsr:bullet hit_block set value "minecraft:iron_trapdoor"
return 0
