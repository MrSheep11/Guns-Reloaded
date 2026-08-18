# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Get keys and initialize output (only runs once)
$execute unless data storage mcfentitymap:temp keys[0] run data modify storage mcfentitymap:out $(output) set value []
$execute unless data storage mcfentitymap:temp keys[0] run data modify storage mcfentitymap:temp keys set from storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys

# Add each value to the output list
execute if data storage mcfentitymap:temp keys[0] run data modify storage mcfentitymap:temp iteration.current set from storage mcfentitymap:temp keys[0]
function mcfentitymap:internal/value_list/get_value with storage mcfentitymap:temp iteration

# Remove current
data remove storage mcfentitymap:temp keys[0]

# Run again (if applicable)
execute if data storage mcfentitymap:temp keys[0] run function mcfentitymap:internal/value_list/value_list with storage mcfentitymap:temp iteration