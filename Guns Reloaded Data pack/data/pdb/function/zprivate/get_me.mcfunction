$execute if data storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].values.data run data modify storage pdb:main out set from storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].values.data
$execute unless data storage mcfentitymap:maps hpww_pdb[{UUID:"$(plain)"}].values.data run data modify storage pdb:main out set value {}
