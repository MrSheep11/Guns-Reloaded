# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:tripwire run return run data modify storage gunsr:bullet hit_block set value "minecraft:tripwire"
execute if block ~ ~ ~ minecraft:tripwire_hook run return run data modify storage gunsr:bullet hit_block set value "minecraft:tripwire_hook"
execute if block ~ ~ ~ minecraft:tube_coral run return run data modify storage gunsr:bullet hit_block set value "minecraft:tube_coral"
execute if block ~ ~ ~ minecraft:tube_coral_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:tube_coral_block"
execute if block ~ ~ ~ minecraft:tube_coral_fan run return run data modify storage gunsr:bullet hit_block set value "minecraft:tube_coral_fan"
execute if block ~ ~ ~ minecraft:tube_coral_wall_fan run return run data modify storage gunsr:bullet hit_block set value "minecraft:tube_coral_wall_fan"
execute if block ~ ~ ~ minecraft:tuff run return run data modify storage gunsr:bullet hit_block set value "minecraft:tuff"
execute if block ~ ~ ~ minecraft:tuff_brick_slab run return run data modify storage gunsr:bullet hit_block set value "minecraft:tuff_brick_slab"
execute if block ~ ~ ~ minecraft:tuff_brick_stairs run return run data modify storage gunsr:bullet hit_block set value "minecraft:tuff_brick_stairs"
return 0
