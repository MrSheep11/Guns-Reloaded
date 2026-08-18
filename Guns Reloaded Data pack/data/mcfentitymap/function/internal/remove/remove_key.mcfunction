# Instantiate key list (will only run on first iteration)
$execute unless data storage mcfentitymap:temp keys[0] run data modify storage mcfentitymap:temp keys set from storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys

# Store data change success
$execute store result score @s mcfem.removed run data modify storage mcfentitymap:temp keys[0] set value "$(target)"

# If unsuccessful, this index is correct
$execute if score @s mcfem.removed matches 0 run data remove storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys[$(index)]

# Next index
data remove storage mcfentitymap:temp keys[0]
scoreboard players add @s mcfem.index 1
execute store result storage mcfentitymap:temp iteration.index int 1 run scoreboard players get @s mcfem.index

# Run again (if applicable)
execute if data storage mcfentitymap:temp keys[0] if score @s mcfem.removed matches 1 run function mcfentitymap:internal/remove/remove_key with storage mcfentitymap:temp iteration