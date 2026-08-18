### Finds the amount of key/value pairs in the entity's map at the specified path and outputs it in "mcfentitymap:out <output>".
### Parameters:
### > "path" - path to check size in
### > "output" - path to store result in

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Set temporary data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp args.output set value $(output)

# Find and output size
function mcfentitymap:internal/size/size with storage mcfentitymap:temp args