# Print
tellraw @a [{"storage":"mcfentitymap:temp","nbt":"iteration.keys[0]","color":"green"}, \
            {"text":": ","color":"white"}, \
            {"storage":"mcfentitymap:temp","nbt":"iteration.values[0]","color":"gold"}]

# Remove current entries
data remove storage mcfentitymap:temp iteration.keys[0]
data remove storage mcfentitymap:temp iteration.values[0]

# Run again (if applicable)
execute if data storage mcfentitymap:temp iteration.keys[0] run function mcfentitymap:internal/print_entity/print_line