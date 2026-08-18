### Removes a key and its value from an entity at the specified path.
### Parameters:
### > "path" - path to remove key/value from
### > "key" - key to remove

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Set temporary data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
$data modify storage mcfentitymap:temp args.key set value $(key)

# Error if key doesn't exist (checked using temp data (mojang please let execute if function take arguments thanks))
scoreboard objectives add mcfem.contains dummy
execute store result score @s mcfem.contains run function mcfentitymap:contains with storage mcfentitymap:temp args
$execute if score @s mcfem.contains matches 0 unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:internal/remove/fail {path: $(path), key: $(key)}
scoreboard objectives remove mcfem.contains

# Remove value
function mcfentitymap:internal/remove/remove_value with storage mcfentitymap:temp args

# Remove key (iterative) (yes this sucks i know)
scoreboard objectives add mcfem.index dummy
scoreboard objectives add mcfem.removed dummy

$data modify storage mcfentitymap:temp iteration.target set value $(key)
data modify storage mcfentitymap:temp iteration.index set value 0
$data modify storage mcfentitymap:temp iteration.path set value $(path)
data modify storage mcfentitymap:temp iteration.UUID set from storage uuid:out plain

function mcfentitymap:internal/remove/remove_key with storage mcfentitymap:temp iteration

data remove storage mcfentitymap:temp keys
scoreboard objectives remove mcfem.index
scoreboard objectives remove mcfem.removed