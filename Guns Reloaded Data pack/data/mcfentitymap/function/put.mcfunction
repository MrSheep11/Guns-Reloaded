### Associates a key with a value.
### Parameters:
### > "path" - path to set key/value in
### > "key" - key to add
### > "value" - value to add

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Initialize temp data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp args.key set value $(key)
$data modify storage mcfentitymap:temp args.value set value $(value)

# If key doesn't exist yet, add it to the list of keys using temp data
scoreboard objectives add mcfem.contains dummy
execute store result score @s mcfem.contains run function mcfentitymap:contains with storage mcfentitymap:temp args
execute if score @s mcfem.contains matches 0 run function mcfentitymap:internal/put/append_key with storage mcfentitymap:temp args
scoreboard objectives remove mcfem.contains

# Set key/value pair
function mcfentitymap:internal/put/set_kv with storage mcfentitymap:temp args