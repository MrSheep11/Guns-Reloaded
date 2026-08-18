### Determines whether an entity map at the specified path contains the given value.
### Parameters:
### > "path" - path to check
### > "value" - value to check

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Create value list
$function mcfentitymap:value_list {path: $(path), output: "internal.values"}

# Create temporary storage
$data modify storage mcfentitymap:temp iteration.target set value $(value)

# Start comparing
scoreboard objectives add mcfem.match dummy
function mcfentitymap:internal/contains_value/check_value with storage mcfentitymap:temp iteration
scoreboard objectives remove mcfem.match

# If flag not present, map does not contain value, otherwise map contains value
execute unless data storage mcfentitymap:temp match_found run return 0
data remove storage mcfentitymap:temp match_found
return 1