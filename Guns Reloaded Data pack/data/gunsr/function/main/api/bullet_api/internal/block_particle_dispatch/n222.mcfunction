# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:test_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:test_block"
execute if block ~ ~ ~ minecraft:test_instance_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:test_instance_block"
execute if block ~ ~ ~ minecraft:tinted_glass run return run data modify storage gunsr:bullet hit_block set value "minecraft:tinted_glass"
execute if block ~ ~ ~ minecraft:tnt run return run data modify storage gunsr:bullet hit_block set value "minecraft:tnt"
execute if block ~ ~ ~ minecraft:torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:torch"
execute if block ~ ~ ~ minecraft:torchflower run return run data modify storage gunsr:bullet hit_block set value "minecraft:torchflower"
execute if block ~ ~ ~ minecraft:torchflower_crop run return run data modify storage gunsr:bullet hit_block set value "minecraft:torchflower_crop"
execute if block ~ ~ ~ minecraft:trapped_chest run return run data modify storage gunsr:bullet hit_block set value "minecraft:trapped_chest"
execute if block ~ ~ ~ minecraft:trial_spawner run return run data modify storage gunsr:bullet hit_block set value "minecraft:trial_spawner"
return 0
