# Apply the continuous random size to the display's local square plane.
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,sort=nearest,limit=1,distance=..0.1] transformation.scale[0] float 0.001 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,sort=nearest,limit=1,distance=..0.1] transformation.scale[1] float 0.001 run scoreboard players get @s gunsr.hole_size

# Recenter the variable-size square around the impact point. The remaining
# translation component is the constant half-thickness of the display.
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_west,sort=nearest,limit=1,distance=..0.1] transformation.translation[1] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_west,sort=nearest,limit=1,distance=..0.1] transformation.translation[2] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_east,sort=nearest,limit=1,distance=..0.1] transformation.translation[1] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_east,sort=nearest,limit=1,distance=..0.1] transformation.translation[2] float 0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_bottom,sort=nearest,limit=1,distance=..0.1] transformation.translation[0] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_bottom,sort=nearest,limit=1,distance=..0.1] transformation.translation[2] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_top,sort=nearest,limit=1,distance=..0.1] transformation.translation[0] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_top,sort=nearest,limit=1,distance=..0.1] transformation.translation[2] float 0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_north,sort=nearest,limit=1,distance=..0.1] transformation.translation[0] float 0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_north,sort=nearest,limit=1,distance=..0.1] transformation.translation[1] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_south,sort=nearest,limit=1,distance=..0.1] transformation.translation[0] float -0.0005 run scoreboard players get @s gunsr.hole_size
execute store result entity @e[type=minecraft:block_display,tag=bullet_hole_new,tag=bullet_hole_south,sort=nearest,limit=1,distance=..0.1] transformation.translation[1] float -0.0005 run scoreboard players get @s gunsr.hole_size

# Gray concrete is the lightest variant. One quarter become darker black holes.
execute if score @s gunsr.hole_shade matches 1 run data modify entity @e[type=minecraft:block_display,tag=bullet_hole_new,sort=nearest,limit=1,distance=..0.1] block_state.Name set value "minecraft:black_concrete"
tag @e[type=minecraft:block_display,tag=bullet_hole_new,sort=nearest,limit=1,distance=..0.1] remove bullet_hole_new
