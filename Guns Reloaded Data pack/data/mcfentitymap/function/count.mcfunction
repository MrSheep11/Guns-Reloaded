### Finds the number of entity maps in the specified path and outputs it in "mcfentitymap:out <output>".
### Parameters:
### > "path" - path to check count of
### > "output" - path to store result in

# Error if path doesn't exist
$execute unless data storage mcfentitymap:maps $(path) unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Path $(path) does not exist!"}

# Find and output count
$execute store result storage mcfentitymap:out $(output) int 1 run data get storage mcfentitymap:maps $(path)