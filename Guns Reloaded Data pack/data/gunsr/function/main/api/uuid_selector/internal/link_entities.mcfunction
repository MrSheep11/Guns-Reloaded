tag @s add gunsr.api.uuid_selector.linker
$execute as $(entity) unless score @s gunsr.api.UUID_Linked matches 1.. run function gunsr:main/api/uuid_selector/internal/link_to_tagged_player
$execute as $(entity) if score @s gunsr.api.UUID_Linked matches 1.. if score @s gunsr.api.UUID0 = @a[tag=gunsr.api.uuid_selector.linker,limit=1] spell_uuid_0 if score @s gunsr.api.UUID1 = @a[tag=gunsr.api.uuid_selector.linker,limit=1] spell_uuid_1 if score @s gunsr.api.UUID2 = @a[tag=gunsr.api.uuid_selector.linker,limit=1] spell_uuid_2 if score @s gunsr.api.UUID3 = @a[tag=gunsr.api.uuid_selector.linker,limit=1] spell_uuid_3 run function gunsr:main/api/uuid_selector/internal/link_to_tagged_player
tag @s remove gunsr.api.uuid_selector.linker
