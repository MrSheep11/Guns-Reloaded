# Run the supplied command as and at the player stored on this linked entity.
tag @s add gunsr.api.uuid_selector.player_runner
$execute as @a if score @e[tag=gunsr.api.uuid_selector.player_runner,limit=1] gunsr.api.UUID_Linked matches 1.. if score @s spell_uuid_0 = @e[tag=gunsr.api.uuid_selector.player_runner,limit=1] gunsr.api.UUID0 if score @s spell_uuid_1 = @e[tag=gunsr.api.uuid_selector.player_runner,limit=1] gunsr.api.UUID1 if score @s spell_uuid_2 = @e[tag=gunsr.api.uuid_selector.player_runner,limit=1] gunsr.api.UUID2 if score @s spell_uuid_3 = @e[tag=gunsr.api.uuid_selector.player_runner,limit=1] gunsr.api.UUID3 at @s run $(command)
tag @s remove gunsr.api.uuid_selector.player_runner
