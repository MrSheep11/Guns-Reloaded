# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Create arbitrary data if empty
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys[0] run data modify storage mcfentitymap:temp is_empty set value 1