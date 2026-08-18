# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Get size
$execute store result storage mcfentitymap:out $(output) int 1 run data get storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys