### Generates a list of an entity's values and outputs it to "mcfentitymap:out <output>"
### Parameters:
### > "path" - path to get values from
### > "output" - path to output values

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary data
$data modify storage mcfentitymap:temp iteration.path set value $(path)
data modify storage mcfentitymap:temp iteration.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp iteration.output set value $(output)
data remove storage mcfentitymap:temp keys

# Output values
function mcfentitymap:internal/value_list/value_list with storage mcfentitymap:temp iteration