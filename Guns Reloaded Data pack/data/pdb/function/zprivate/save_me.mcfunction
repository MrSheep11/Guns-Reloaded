execute unless data storage mcfentitymap:maps hpww_pdb run data modify storage mcfentitymap:maps hpww_pdb set value []
$execute unless data storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}] run data modify storage mcfentitymap:maps hpww_pdb append value {UUID:"$(plain)",keys:[],values:{}}
$execute unless data storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].values.data run data modify storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].keys append value "data"
$data modify storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].values.data set from storage pdb:main in
