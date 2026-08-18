### Checks if a path contains the executing entity's UUID. Returns 1 if it does, 0 otherwise.
### Parameters:
### > "path" - path to check

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary storage
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain

# Check for UUID
function mcfentitymap:internal/contains_entity/check_uuid with storage mcfentitymap:temp args

# If flag not present, path does not contain entity, otherwise map contains entity
execute unless data storage mcfentitymap:temp match_found run return 0
data remove storage mcfentitymap:temp match_found
return 1