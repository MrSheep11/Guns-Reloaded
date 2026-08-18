# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

# Set arbitrary flag for match found
$execute if data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].values.$(key) run data modify storage mcfentitymap:temp match_found set value 1