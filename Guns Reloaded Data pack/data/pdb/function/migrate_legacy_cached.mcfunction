execute store result storage pdb:main args.UUID0 int 1 run scoreboard players get @s spell_uuid_0
execute store result storage pdb:main args.UUID1 int 1 run scoreboard players get @s spell_uuid_1
execute store result storage pdb:main args.UUID2 int 1 run scoreboard players get @s spell_uuid_2
execute store result storage pdb:main args.UUID3 int 1 run scoreboard players get @s spell_uuid_3

function pdb:zprivate/get_me_legacy with storage pdb:main args
execute if data storage pdb:main out.UUID run data modify storage pdb:main in set from storage pdb:main out
execute if data storage pdb:main out.UUID run function pdb:save_me
