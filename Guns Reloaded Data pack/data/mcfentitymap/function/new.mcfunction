### Append an empty entity map to the given path with the executing entity's UUID.
### Note: ALL maps are stored under "mcfentitymap:maps <path>"
### Parameters:
### > "path" - path to create map at

# Retrieve entity UUID
function mcfentitymap:internal/uuid/get_uuid

# Error if UUID is already in path (checked using temp data)
scoreboard objectives add mcfem.containsUUID dummy

$data modify storage mcfentitymap:temp args.path set value $(path)

$execute store result score @s mcfem.containsUUID if data storage mcfentitymap:maps $(path) run function mcfentitymap:contains_entity with storage mcfentitymap:temp args
$execute if score @s mcfem.containsUUID matches 1 unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:internal/new/fail {path: $(path)}
scoreboard objectives remove mcfem.containsUUID

# Create storage at path
$data modify storage mcfentitymap:maps $(path) append value {UUID: "none", keys: [], values: {}}
$data modify storage mcfentitymap:maps $(path)[{UUID: "none"}].UUID set from storage uuid:out plain