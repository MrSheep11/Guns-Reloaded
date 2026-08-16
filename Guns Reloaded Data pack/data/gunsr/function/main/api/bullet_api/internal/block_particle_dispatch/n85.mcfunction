# Leaf containing 10 block IDs.
execute if block ~ ~ ~ minecraft:dripstone_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:dripstone_block"
execute if block ~ ~ ~ minecraft:dropper run return run data modify storage gunsr:bullet hit_block set value "minecraft:dropper"
execute if block ~ ~ ~ minecraft:emerald_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:emerald_block"
execute if block ~ ~ ~ minecraft:emerald_ore run return run data modify storage gunsr:bullet hit_block set value "minecraft:emerald_ore"
execute if block ~ ~ ~ minecraft:enchanting_table run return run data modify storage gunsr:bullet hit_block set value "minecraft:enchanting_table"
execute if block ~ ~ ~ minecraft:end_gateway run return run data modify storage gunsr:bullet hit_block set value "minecraft:end_gateway"
execute if block ~ ~ ~ minecraft:end_portal run return run data modify storage gunsr:bullet hit_block set value "minecraft:end_portal"
execute if block ~ ~ ~ minecraft:end_portal_frame run return run data modify storage gunsr:bullet hit_block set value "minecraft:end_portal_frame"
execute if block ~ ~ ~ minecraft:end_rod run return run data modify storage gunsr:bullet hit_block set value "minecraft:end_rod"
execute if block ~ ~ ~ minecraft:end_stone run return run data modify storage gunsr:bullet hit_block set value "minecraft:end_stone"
return 0
