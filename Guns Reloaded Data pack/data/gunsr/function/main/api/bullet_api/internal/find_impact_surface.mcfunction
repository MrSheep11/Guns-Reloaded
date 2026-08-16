# Backtrack by at most one 0.5-block movement step, stopping just outside the block.
tp @s ^ ^ ^-0.025
execute at @s unless block ~ ~ ~ #gunsr:bullet_pass_through run return run function gunsr:main/api/bullet_api/internal/find_impact_surface
execute at @s run return run function gunsr:main/api/bullet_api/internal/impact_surface
