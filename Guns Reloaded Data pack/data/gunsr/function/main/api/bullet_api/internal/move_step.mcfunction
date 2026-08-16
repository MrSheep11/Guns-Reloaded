# Move one half block, then process the new position in a single execution context.
tp @s ^ ^ ^0.5
scoreboard players remove @s gunsr.bullet 1
execute at @s run function gunsr:main/api/bullet_api/internal/step_position
