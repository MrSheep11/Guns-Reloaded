### Shows a list of all of the executing entity's attributes in chat, using the format "<key>: <value>"
### Parameters:
### > "path" - path to get attributes from

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID, keys, and values
function mcfentitymap:internal/uuid/get_uuid
$function mcfentitymap:key_list {path: $(path), output: internal.keys}
$function mcfentitymap:value_list {path: $(path), output: internal.values}

# Error if no attributes
$execute unless data storage mcfentitymap:out internal.keys[0] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity in $(path) has no attributes!"}

# Create temporary data
data modify storage mcfentitymap:temp iteration.UUID set from storage uuid:out plain
data modify storage mcfentitymap:temp iteration.keys set from storage mcfentitymap:out internal.keys
data modify storage mcfentitymap:temp iteration.values set from storage mcfentitymap:out internal.values

# Start iteration
function mcfentitymap:internal/print_entity/setup with storage mcfentitymap:temp iteration