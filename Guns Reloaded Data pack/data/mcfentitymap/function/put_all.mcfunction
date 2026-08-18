### Associates all input keys with thier corresponding input value in the specified path.
### Due to NBT access limitations, keys and values must be passed in as separate lists.
### Parameters:
### > "path" - path to update keys/values in
### > "keys" - list of keys to update
### > "values" - list of values to update

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Store keys and values in temporary storage
$data modify storage mcfentitymap:temp all_keys set value $(keys)
$data modify storage mcfentitymap:temp all_values set value $(values)

# Error if keys and values are not both lists
execute unless data storage mcfentitymap:temp all_keys[0] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Keys and values must both be non-empty lists!"}
execute unless data storage mcfentitymap:temp all_values[0] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Keys and values must both be non-empty lists!"}

# Error if key and value lists don't match in length
scoreboard objectives add mcfem.keysize dummy
scoreboard objectives add mcfem.valuesize dummy

execute store result score @s mcfem.keysize run data get storage mcfentitymap:temp all_keys
execute store result score @s mcfem.valuesize run data get storage mcfentitymap:temp all_values
execute store result storage mcfentitymap:temp keysize int 1 run scoreboard players get @s mcfem.keysize
execute store result storage mcfentitymap:temp valuesize int 1 run scoreboard players get @s mcfem.valuesize

execute unless score @s mcfem.keysize = @s mcfem.valuesize unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:internal/put_all/size_fail with storage mcfentitymap:temp

data remove storage mcfentitymap:temp all_keysize
data remove storage mcfentitymap:temp all_valuesize
scoreboard objectives remove mcfem.keysize
scoreboard objectives remove mcfem.valuesize

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Initialize temp data
$data modify storage mcfentitymap:temp args.path set value $(path)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain
data modify storage mcfentitymap:temp args.key set from storage mcfentitymap:temp all_keys[0]
data modify storage mcfentitymap:temp args.value set from storage mcfentitymap:temp all_values[0]

# Put pairs until none left
function mcfentitymap:internal/put_all/put_next with storage mcfentitymap:temp args