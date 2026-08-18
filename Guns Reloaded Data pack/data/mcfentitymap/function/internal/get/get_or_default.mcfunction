# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Get default value if key doesn't exist
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].values.$(key) run return run data modify storage mcfentitymap:out $(output) set value $(default)

# Get value
$data modify storage mcfentitymap:out $(output) set from storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].values.$(key)