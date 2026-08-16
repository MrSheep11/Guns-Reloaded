# The marker is currently positioned inside the block it hit.
data modify storage gunsr:bullet hit_block set value "minecraft:stone"
function gunsr:main/api/bullet_api/internal/set_block_particle

# Backtrack to the entry surface before spawning debris and the bullet hole.
function gunsr:main/api/bullet_api/internal/find_impact_surface
