### Associates a key with a value in the specified path only if the key is not already present.
### Parameters:
### > "path" - path to add key/value in
### > "key" - key to add
### > "value" - value to add

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Check if map contains key
scoreboard objectives add mcfem.contains dummy
$execute store result score @s mcfem.contains run function mcfentitymap:contains {path: $(path), key: $(key)}
execute if score @s mcfem.contains matches 1 run return run scoreboard objectives remove mcfem.contains
scoreboard objectives remove mcfem.contains

# Put key/value
$function mcfentitymap:put {path: $(path), key: $(key), value: $(value)}