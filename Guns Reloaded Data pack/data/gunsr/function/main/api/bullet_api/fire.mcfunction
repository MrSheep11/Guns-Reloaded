#called with {blocks_per_tick:(float), max_distance:(float), lifetime_ticks:(int), straight_ticks:(int), momentum_retention:(float), drop_acceleration:(float), damage:(float), breaks_blocks:true/false, fire_power:(float), bullet_spawn_coord:(float)}
#momentum_retention is the speed multiplier per tick after straight_ticks; drop_acceleration is degrees per tick squared.
$function gunsr:main/api/bullet_api/internal/start with storage gunsr:gun_definitions $(gun_id).bullet_api
