# Fly straight for the configured duration, then apply drag and gravity every tick.
scoreboard players add @s gunsr.age 1
execute if score @s gunsr.age > @s gunsr.life run return run function gunsr:main/api/bullet_api/internal/kill_bullet
execute if score @s gunsr.age > @s gunsr.straight run function gunsr:main/api/bullet_api/internal/apply_ballistics

# Convert the current fixed-point speed into 0.5-block teleports for this tick.
scoreboard players operation @s gunsr.bullet = @s gunsr.speed
scoreboard players operation @s gunsr.bullet /= #500 gunsr.bullet

# Stop bullets too slow to travel one substep, and clamp movement to the remaining range.
execute if score @s gunsr.speed matches ..499 run return run function gunsr:main/api/bullet_api/internal/kill_bullet
scoreboard players operation @s gunsr.bullet < @s gunsr.range
scoreboard players operation @s gunsr.range -= @s gunsr.bullet

execute if score @s gunsr.bullet matches 1.. run function gunsr:main/api/bullet_api/internal/move_step
execute if entity @s[tag=bullet] unless score @s gunsr.range matches 1.. run function gunsr:main/api/bullet_api/internal/kill_bullet
