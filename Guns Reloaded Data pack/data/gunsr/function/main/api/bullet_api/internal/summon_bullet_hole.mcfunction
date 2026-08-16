# Pick a continuous size from 0.050 to 0.090 blocks and a shade. Gray concrete
# is the lightest shade; one quarter of impacts use darker black concrete.
execute store result score @s gunsr.hole_size run random value 50..90
execute store result score @s gunsr.hole_shade run random value 1..4

# The marker is within 0.025 blocks of the impact surface. A cardinal probe
# identifies the block face actually hit. Each face function also rejects
# impacts too close to an edge or vertex for the largest possible decal.
execute positioned ~0.05 ~ ~ unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/west
execute positioned ~-0.05 ~ ~ unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/east
execute positioned ~ ~0.05 ~ unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/bottom
execute positioned ~ ~-0.05 ~ unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/top
execute positioned ~ ~ ~0.05 unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/north
execute positioned ~ ~ ~-0.05 unless block ~ ~ ~ #gunsr:bullet_pass_through run return run execute at @s run function gunsr:main/api/bullet_api/internal/bullet_hole/south

# If no reliable face can be identified, do not create a floating decal.
return 0
