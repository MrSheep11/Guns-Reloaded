execute unless data storage mcfentitymap:maps hpww_pdb run data modify storage mcfentitymap:maps hpww_pdb set value []
$execute unless data storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}] run data modify storage mcfentitymap:maps hpww_pdb append value {UUID:"$(plain)",keys:[],values:{}}
