### Determines whether the executing entity has no attributes in the specified path. Returns 0 if not empty and 1 if empty.
### Parameters:
### > "path" - path to check attributes at

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary storage
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain

# Check emptiness
function mcfentitymap:internal/is_empty/check_empty with storage mcfentitymap:temp args

# If flag not present, path does not contain entity, otherwise map contains entity
execute unless data storage mcfentitymap:temp is_empty run return 0
data remove storage mcfentitymap:temp is_empty
return 1