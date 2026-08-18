# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Put the current key/value pair
$function mcfentitymap:put {path: $(path), key: $(key), value: $(value)}

# Remove current pair
data remove storage mcfentitymap:temp all_keys[0]
data remove storage mcfentitymap:temp all_values[0]

# Initialize temp data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
data modify storage mcfentitymap:temp args.key set from storage mcfentitymap:temp all_keys[0]
data modify storage mcfentitymap:temp args.value set from storage mcfentitymap:temp all_values[0]

# Run again (if applicable)
execute if data storage mcfentitymap:temp all_keys[0] run function mcfentitymap:internal/put_all/put_next with storage mcfentitymap:temp args