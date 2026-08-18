execute unless score @s spell_uuid_0 matches -2147483648..2147483647 run function hpww:main/spells/function/other/store_uuid
execute if score @s spell_uuid_0 matches 0 if score @s spell_uuid_1 matches 0 if score @s spell_uuid_2 matches 0 if score @s spell_uuid_3 matches 0 run function hpww:main/spells/function/other/store_uuid
function pdb:internal/uuid/get_cached
execute unless data storage pdb:main in.UUID run data modify storage pdb:main in.UUID set from entity @s UUID

function pdb:zprivate/save_me with storage uuid:out
