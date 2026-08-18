data remove storage pdb:main in
data remove storage pdb:main out
function pdb:get_me
data modify storage pdb:main in set from storage pdb:main out

data modify storage pdb:main in.gunsr.selected_gun set from entity @s SelectedItem.components."minecraft:custom_data".gun

function pdb:save_me
function pdb:get_me

function gunsr:main/macro_pass with storage pdb:main out.gunsr

