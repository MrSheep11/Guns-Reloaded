# Damage the first non-passable entity intersecting the bullet's 0.30 cube.
$execute positioned ~-0.15 ~-0.15 ~-0.15 run damage @e[type=!#gunsr:passable_entities,tag=!gunsr_bullet_shooter,dx=0.3,dy=0.3,dz=0.3,sort=nearest,limit=1] $(damage) minecraft:generic

# Entity impacts use red concrete debris and deliberately skip all block-impact
# particle lookup and bullet-hole functions.
particle minecraft:block{block_state:"minecraft:red_concrete"} ~ ~ ~ 0.18 0.18 0.18 0.1 16 force @a
function gunsr:main/api/bullet_api/internal/kill_bullet
