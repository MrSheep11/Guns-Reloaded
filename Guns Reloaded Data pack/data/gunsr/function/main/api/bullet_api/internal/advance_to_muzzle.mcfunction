# Walk from the player to the configured muzzle spawn point without tunneling
# through a wall that is closer than bullet_spawn_coord.
tp @s ^ ^ ^0.05
scoreboard players remove @s gunsr.range 1
execute at @s unless block ~ ~ ~ #gunsr:bullet_pass_through run return run function gunsr:main/api/bullet_api/internal/on_block_hit
execute at @s positioned ~-0.15 ~-0.15 ~-0.15 if entity @e[type=!#gunsr:passable_entities,tag=!gunsr_bullet_shooter,dx=0.3,dy=0.3,dz=0.3,sort=nearest,limit=1] run return run execute at @s run function gunsr:main/api/bullet_api/internal/on_entity_hit with entity @s data
execute if entity @s[tag=bullet] if score @s gunsr.range matches 1.. at @s run function gunsr:main/api/bullet_api/internal/advance_to_muzzle
