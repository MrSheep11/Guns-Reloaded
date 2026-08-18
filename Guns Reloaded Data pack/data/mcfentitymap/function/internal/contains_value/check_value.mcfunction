# Attempt to change and store result
$execute store result score @s mcfem.match run data modify storage mcfentitymap:out internal.values[0] set value $(target)

# If score is 0, set arbitrary flag for match found
execute if score @s mcfem.match matches 0 run return run data modify storage mcfentitymap:temp match_found set value 1

# Remove current index
data remove storage mcfentitymap:out internal.values[0]

# Run again (if applicable)
execute if data storage mcfentitymap:out internal.values[0] run function mcfentitymap:internal/contains_value/check_value with storage mcfentitymap:temp iteration