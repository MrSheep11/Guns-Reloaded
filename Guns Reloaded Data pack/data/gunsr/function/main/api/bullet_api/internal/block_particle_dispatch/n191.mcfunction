# Leaf containing 9 block IDs.
execute if block ~ ~ ~ minecraft:redstone_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_block"
execute if block ~ ~ ~ minecraft:redstone_lamp run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_lamp"
execute if block ~ ~ ~ minecraft:redstone_ore run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_ore"
execute if block ~ ~ ~ minecraft:redstone_torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_torch"
execute if block ~ ~ ~ minecraft:redstone_wall_torch run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_wall_torch"
execute if block ~ ~ ~ minecraft:redstone_wire run return run data modify storage gunsr:bullet hit_block set value "minecraft:redstone_wire"
execute if block ~ ~ ~ minecraft:reinforced_deepslate run return run data modify storage gunsr:bullet hit_block set value "minecraft:reinforced_deepslate"
execute if block ~ ~ ~ minecraft:repeater run return run data modify storage gunsr:bullet hit_block set value "minecraft:repeater"
execute if block ~ ~ ~ minecraft:repeating_command_block run return run data modify storage gunsr:bullet hit_block set value "minecraft:repeating_command_block"
return 0
