#executes as the player and at the player


# Remove the temporary tag from any bullet left over by an interrupted shot.
tag @e[type=minecraft:marker,tag=new_bullet] remove new_bullet

# Ignore the firing entity during the checked muzzle path. This temporary tag
# is removed before the function ends, so later ricochets can still hit it.
tag @s add gunsr_bullet_shooter

# Create the projectile at the shooter's end of the muzzle path instead of
# directly at the configured forward offset. The checked muzzle-advance below
# prevents a nearby wall from being skipped by the initial spawn.
$execute anchored eyes positioned ^ ^ ^$(bullet_spawn_coord) run summon minecraft:marker ~ ~-0.3 ~ {Tags:["new_bullet","bullet"],data:{blocks_per_tick:$(blocks_per_tick),max_distance:$(max_distance),lifetime_ticks:$(lifetime_ticks),straight_ticks:$(straight_ticks),momentum_retention:$(momentum_retention),drop_acceleration:$(drop_acceleration),damage:$(damage),spawn_distance:$(bullet_spawn_coord)}}
data modify entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] Rotation set from entity @s Rotation

# Advance to the configured muzzle position in checked 0.05-block steps. The
# normal range score is safe to use as scratch here because it is initialized
# with max_distance after this close-range collision pass.
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.range run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.spawn_distance 20
execute as @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] at @s if score @s gunsr.range matches 1.. run function gunsr:main/api/bullet_api/internal/advance_to_muzzle

# Store the projectile's initial speed, aim, age, lifetime, and remaining range.
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.speed run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.blocks_per_tick 1000
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.pitch run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] Rotation[1] 1000
scoreboard players set @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.drop 0
scoreboard players set @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.age 0
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.life run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.lifetime_ticks 1
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.straight run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.straight_ticks 1
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.drag run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.momentum_retention 1000
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.gravity run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.drop_acceleration 1000
execute store result score @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] gunsr.range run data get entity @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] data.max_distance 2
tag @e[type=minecraft:marker,tag=new_bullet,sort=nearest,limit=1] remove new_bullet
tag @s remove gunsr_bullet_shooter
