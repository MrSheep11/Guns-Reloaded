### Deletes an entity's entry from the specified path.
### Parameters:
### > "path" - path to delete entry from

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Set temporary data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain

# Delete entry using temporary data
function mcfentitymap:internal/delete/delete with storage mcfentitymap:temp args

# Remove path if it's now empty
$execute unless data storage mcfentitymap:maps $(path)[0] run data remove storage mcfentitymap:maps $(path)