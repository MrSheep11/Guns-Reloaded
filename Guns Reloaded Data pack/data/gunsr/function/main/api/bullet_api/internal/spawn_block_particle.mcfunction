# Called at the projectile impact point with the block ID captured by set_block_particle.
$particle minecraft:block{block_state:"$(hit_block)"} ~ ~ ~ 0.2 0.2 0.2 0.12 18 force @a
