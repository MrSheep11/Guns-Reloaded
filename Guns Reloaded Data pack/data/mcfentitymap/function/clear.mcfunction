### Removes all keys and values from an entity.
### Parameters:
### > "path" - path to clear in

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain

# Clear entity mappings using temporary data
function mcfentitymap:internal/clear/clear with storage mcfentitymap:temp args