execute as @e[type=minecraft:marker,tag=bullet] at @s run function gunsr:main/api/bullet_api/internal/tick_bullet
scoreboard players add @e[type=minecraft:block_display,tag=bullet_hole] gunsr.hole_age 1
execute as @e[type=minecraft:block_display,tag=bullet_hole,scores={gunsr.hole_age=180}] run function gunsr:main/api/bullet_api/internal/fade_bullet_hole
kill @e[type=minecraft:block_display,tag=bullet_hole,scores={gunsr.hole_age=200..}]



execute as @a if score @s new_player_storage matches 0 run function pdb:new_player