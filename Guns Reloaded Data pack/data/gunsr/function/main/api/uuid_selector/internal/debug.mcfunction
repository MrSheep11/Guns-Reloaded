tellraw @s ["",{color:"#cea4ff",text:"H"},{color:"#d5a8e5",text:"P"},{color:"#dcadcc",text:"W"},{color:"#e3b1b2",text:"W "},{color:"#f1ba7e",text:"A"},{color:"#f8bf65",text:"P"},{color:"#ffc34b",text:"I"}," | ",{color:"white",bold:true,text:"UUID Selector"}]
execute if entity @e[scores={gunsr.api.UUID_Linked=1..}] run tellraw @s [{"text":"Linked:\n ","color":"green"},{"selector":"@e[scores={gunsr.api.UUID_Linked=1..}]","color":"aqua"}]
execute unless entity @e[scores={gunsr.api.UUID_Linked=1..}] run tellraw @s [{"text":"No linked entities found.","color":"red"}]
