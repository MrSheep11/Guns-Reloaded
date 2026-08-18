# Error if entity not present in source
$execute unless data storage mcfentitymap:maps $(from)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "No entry in $(from) to copy!"}

# Error if entity already present in destination
$execute if data storage mcfentitymap:maps $(to)[{UUID: "$(UUID)"}] unless score #MCFEM_GLOBAL mcfem.suppress_errors matches 1 run return run function mcfentitymap:message/error {message: "Entry is already present in $(to)!"}

# Copy entry
$data modify storage mcfentitymap:maps $(to) append from storage mcfentitymap:maps $(from)[{UUID: "$(UUID)"}]