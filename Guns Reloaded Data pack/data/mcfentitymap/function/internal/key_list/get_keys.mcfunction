# Error if entity not in path
$execute unless data storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entity is not present in $(path)!"}

$data modify storage mcfentitymap:out $(output) set from storage mcfentitymap:maps $(path)[{UUID: "$(UUID)"}].keys