### Generates a list of an entity's keys and outputs it to "mcfentitymap:out <output>"
### Parameters:
### > "path" - path to get keys from
### > "output" - path to output keys

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp args.output set value $(output)

# Output keys
function mcfentitymap:internal/key_list/get_keys with storage mcfentitymap:temp args