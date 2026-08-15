#executes as the player and at the player

$say "$(blocks_per_tick), $(damage), $(breaks_blocks), $(fire_power), $(bullet_spawn_coord)"


summon silverfish ~ ~ ~ {Invulnerable:true, NoAI:true, Tags:['new_bullet', 'bullet']}
execute as @e[tag=new_bullet, distance=0.5, type=silverfish] run function gunsr:main/api/bullet_api/internal/_new_bullet_give_effects

