# Reuse the last converted UUID when the same owner performs consecutive PDB
# operations (a get followed by a save is the common case).
execute if score @s spell_uuid_0 = #pdb.uuid_cache spell_uuid_0 if score @s spell_uuid_1 = #pdb.uuid_cache spell_uuid_1 if score @s spell_uuid_2 = #pdb.uuid_cache spell_uuid_2 if score @s spell_uuid_3 = #pdb.uuid_cache spell_uuid_3 if data storage pdb:uuid_cache plain run return run data modify storage uuid:out plain set from storage pdb:uuid_cache plain

# Check the persistent per-owner cache before rebuilding the string through
# the 65,536-entry hexadecimal lookup table.
data remove storage pdb:uuid_cache hit
data modify storage pdb:uuid_cache key set value {UUID0:0,UUID1:0,UUID2:0,UUID3:0}
execute store result storage pdb:uuid_cache key.UUID0 int 1 run scoreboard players get @s spell_uuid_0
execute store result storage pdb:uuid_cache key.UUID1 int 1 run scoreboard players get @s spell_uuid_1
execute store result storage pdb:uuid_cache key.UUID2 int 1 run scoreboard players get @s spell_uuid_2
execute store result storage pdb:uuid_cache key.UUID3 int 1 run scoreboard players get @s spell_uuid_3
function pdb:internal/uuid/find_cached with storage pdb:uuid_cache key
execute if data storage pdb:uuid_cache hit run return run function pdb:internal/uuid/use_cached

scoreboard players operation @s uuid = @s spell_uuid_3
scoreboard players operation @s uuid.0 = @s spell_uuid_3
execute store result storage uuid:temp 7 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 6 int 1 run scoreboard players operation @s uuid /= 65536 __int__

scoreboard players operation @s uuid = @s spell_uuid_2
scoreboard players operation @s uuid.0 = @s spell_uuid_2
execute store result storage uuid:temp 5 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 4 int 1 run scoreboard players operation @s uuid /= 65536 __int__

scoreboard players operation @s uuid = @s spell_uuid_1
scoreboard players operation @s uuid.0 = @s spell_uuid_1
execute store result storage uuid:temp 3 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 2 int 1 run scoreboard players operation @s uuid /= 65536 __int__

scoreboard players operation @s uuid = @s spell_uuid_0
scoreboard players operation @s uuid.0 = @s spell_uuid_0
execute store result storage uuid:temp 1 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 0 int 1 run scoreboard players operation @s uuid /= 65536 __int__

function mcfentitymap:internal/uuid/map with storage uuid:temp
function mcfentitymap:internal/uuid/result with storage uuid:temp

scoreboard players operation #pdb.uuid_cache spell_uuid_0 = @s spell_uuid_0
scoreboard players operation #pdb.uuid_cache spell_uuid_1 = @s spell_uuid_1
scoreboard players operation #pdb.uuid_cache spell_uuid_2 = @s spell_uuid_2
scoreboard players operation #pdb.uuid_cache spell_uuid_3 = @s spell_uuid_3
data modify storage pdb:uuid_cache plain set from storage uuid:out plain

data modify storage pdb:uuid_cache key.plain set from storage uuid:out plain
execute unless data storage pdb:uuid_cache entries run data modify storage pdb:uuid_cache entries set value []
data modify storage pdb:uuid_cache entries append from storage pdb:uuid_cache key
