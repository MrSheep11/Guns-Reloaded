data remove storage pdb:main out
function mcfentitymap:internal/uuid/get_uuid
function pdb:zprivate/get_me with storage uuid:out
execute unless data storage pdb:main out.UUID run function pdb:migrate_legacy
execute unless data storage pdb:main out.UUID run data modify storage pdb:main out.UUID set from entity @s UUID
