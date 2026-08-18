scoreboard players set @s gunsr.api.UUID_Selector 0
tag @s add gunsr.api.uuid_selector.checking
$execute as $(entity) if score @s gunsr.api.UUID_Linked matches 1.. if score @s gunsr.api.UUID0 = @a[tag=gunsr.api.uuid_selector.checking,limit=1] spell_uuid_0 if score @s gunsr.api.UUID1 = @a[tag=gunsr.api.uuid_selector.checking,limit=1] spell_uuid_1 if score @s gunsr.api.UUID2 = @a[tag=gunsr.api.uuid_selector.checking,limit=1] spell_uuid_2 if score @s gunsr.api.UUID3 = @a[tag=gunsr.api.uuid_selector.checking,limit=1] spell_uuid_3 run scoreboard players set @a[tag=gunsr.api.uuid_selector.checking,limit=1] gunsr.api.UUID_Selector 1
tag @s remove gunsr.api.uuid_selector.checking
