### Removes all entities from the specified path, then deletes the path.
### Parameters:
### > "path" - path to empty

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Remove path
$data remove storage mcfentitymap:maps $(path)