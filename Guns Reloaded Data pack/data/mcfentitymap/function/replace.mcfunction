### Associates a key with a value in the specified path only if the key is already present.
### Parameters:
### > "path" - path to replace key/value at
### > "key" - key to replace
### > "value" - value to replace

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Check if map contains key
scoreboard objectives add mcfem.contains dummy
$execute store result score @s mcfem.contains run function mcfentitymap:contains {path: $(path), key: $(key)}
execute if score @s mcfem.contains matches 0 run return run scoreboard objectives remove mcfem.contains
scoreboard objectives remove mcfem.contains

# Put key/value
$function mcfentitymap:put {path: $(path), key: $(key), value: $(value)}