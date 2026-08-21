# Draw one tracer point and stop immediately if this substep entered a block.
particle minecraft:ash ~ ~ ~ 0 0 0 0 1 force @a

execute if block ~ ~ ~ #gunsr:penetrable_glass if score @s gunsr.fire matches 1.. run function gunsr:main/api/bullet_api/internal/penetrate_glass
execute unless block ~ ~ ~ #gunsr:bullet_pass_through run return run function gunsr:main/api/bullet_api/internal/on_block_hit

# Use a small AABB so entity hitboxes are detected instead of only their feet
# positions. Entity hits use a separate path and never create bullet holes.
execute positioned ~-0.15 ~-0.15 ~-0.15 if entity @e[type=!#gunsr:passable_entities,tag=!gunsr_bullet_shooter,dx=0.3,dy=0.3,dz=0.3,sort=nearest,limit=1] run return run execute at @s run function gunsr:main/api/bullet_api/internal/on_entity_hit with entity @s data

# The execution position already matches the marker, so recursion needs no extra `at`.
execute if score @s gunsr.bullet matches 1.. run function gunsr:main/api/bullet_api/internal/move_step
