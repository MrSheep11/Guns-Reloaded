### Gets the value associated with a key and outputs it in "mcfentitymap:out <output>".
### If key is not found, outputs <default>.
### Parameters:
### > "path" - path to get value from
### > "key" - key to get value of
### > "output" - path to output value
### > "default" - value to output if key is not found

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary storage
$data modify storage mcfentitymap:temp args.path set value $(path)
$data modify storage mcfentitymap:temp args.key set value $(key)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp args.output set value $(output)
$data modify storage mcfentitymap:temp args.default set value $(default)

# Get value
function mcfentitymap:internal/get/get_or_default with storage mcfentitymap:temp args