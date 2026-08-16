# Target block is +X. Reject if a 0.10-wide decal would cross a Y/Z edge.
execute positioned ~0.05 ~0.05 ~ if block ~ ~ ~ #gunsr:bullet_pass_through run return 0
execute positioned ~0.05 ~-0.05 ~ if block ~ ~ ~ #gunsr:bullet_pass_through run return 0
execute positioned ~0.05 ~ ~0.05 if block ~ ~ ~ #gunsr:bullet_pass_through run return 0
execute positioned ~0.05 ~ ~-0.05 if block ~ ~ ~ #gunsr:bullet_pass_through run return 0
summon minecraft:block_display ~ ~ ~ {Tags:["bullet_hole","bullet_hole_new","bullet_hole_west"],block_state:{Name:"minecraft:gray_concrete"},transformation:{translation:[0.0025f,-0.04f,-0.04f],left_rotation:[0f,-0.7071068f,0f,0.7071068f],scale:[0.08f,0.08f,0.005f],right_rotation:[0f,0f,0f,1f]},width:0.1f,height:0.1f,shadow_radius:0f,shadow_strength:0f}
function gunsr:main/api/bullet_api/internal/bullet_hole/finalize
