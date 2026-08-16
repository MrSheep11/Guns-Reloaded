# Block displays have no opacity field, so fade them visually by interpolating
# smoothly down to a nearly invisible centered plane over their final 20 ticks.
execute if entity @s[tag=bullet_hole_west] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[0.00005f,-0.0005f,-0.0005f],scale:[0.001f,0.001f,0.0001f]}}
execute if entity @s[tag=bullet_hole_east] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[-0.00005f,-0.0005f,0.0005f],scale:[0.001f,0.001f,0.0001f]}}
execute if entity @s[tag=bullet_hole_bottom] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[-0.0005f,0.00005f,-0.0005f],scale:[0.001f,0.001f,0.0001f]}}
execute if entity @s[tag=bullet_hole_top] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[-0.0005f,-0.00005f,0.0005f],scale:[0.001f,0.001f,0.0001f]}}
execute if entity @s[tag=bullet_hole_north] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[0.0005f,-0.0005f,0.00005f],scale:[0.001f,0.001f,0.0001f]}}
execute if entity @s[tag=bullet_hole_south] run data merge entity @s {start_interpolation:0,interpolation_duration:20,transformation:{translation:[-0.0005f,-0.0005f,-0.00005f],scale:[0.001f,0.001f,0.0001f]}}
