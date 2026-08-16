tellraw @a ["",{color:"#ff9865",text:"-"},{color:"#f59966",text:"-"},{color:"#eb9a67",text:"-"},{color:"#e19a68",text:"-"},{color:"#d79b69",text:"-"},{color:"#cd9c6a",text:"-"},{color:"#c39d6b",text:"-"},{color:"#b99e6c",text:"-"},{color:"#ae9e6d",text:"-"},{color:"#a49f6e",text:"-"},{color:"#9aa06f",text:"-"},{color:"#90a170",text:"-"},{color:"#86a171",text:"-"},{color:"#7ca272",text:"-"},{color:"#72a373",text:"-\n"},{bold:true,text:"",extra:[{color:"#9abbba",text:"G"},{color:"#a2bbb5",text:"u"},{color:"#abbab1",text:"n"},{color:"#b3baac",text:"s "},{color:"#c4b9a2",text:"R"},{color:"#cdb99e",text:"e"},{color:"#d5b899",text:"l"},{color:"#ddb894",text:"o"},{color:"#e6b78f",text:"a"},{color:"#eeb78b",text:"d"},{color:"#f7b686",text:"e"},{color:"#ffb681",text:"d "}]},{color:"gray",text:"has reloaded!\nCreated By:"},{color:"#a38b6b",text:" M"},{color:"#9b8f6c",text:"r"},{color:"#93936e",text:"S"},{color:"#8b976f",text:"h"},{color:"#829b70",text:"3"},{color:"#7a9f72",text:"e"},{color:"#72a373",text:"p\n"},{color:"gray",text:"Version:"},{color:"green",text:" 1.0\n"},{color:"#ff9865",text:"-"},{color:"#f59966",text:"-"},{color:"#eb9a67",text:"-"},{color:"#e19a68",text:"-"},{color:"#d79b69",text:"-"},{color:"#cd9c6a",text:"-"},{color:"#c39d6b",text:"-"},{color:"#b99e6c",text:"-"},{color:"#ae9e6d",text:"-"},{color:"#a49f6e",text:"-"},{color:"#9aa06f",text:"-"},{color:"#90a170",text:"-"},{color:"#86a171",text:"-"},{color:"#7ca272",text:"-"},{color:"#72a373",text:"-"}]
#intilizes gun definitions
function gunsr:main/api/define_guns

# Per-projectile movement counters.
scoreboard objectives add gunsr.bullet dummy
scoreboard objectives add gunsr.range dummy
scoreboard objectives add gunsr.speed dummy
scoreboard objectives add gunsr.pitch dummy
scoreboard objectives add gunsr.drop dummy
scoreboard objectives add gunsr.age dummy
scoreboard objectives add gunsr.life dummy
scoreboard objectives add gunsr.straight dummy
scoreboard objectives add gunsr.drag dummy
scoreboard objectives add gunsr.gravity dummy
scoreboard objectives add gunsr.yaw dummy
scoreboard objectives add gunsr.hole_age dummy
scoreboard objectives add gunsr.hole_size dummy
scoreboard objectives add gunsr.hole_shade dummy

# Fixed-point constants used by projectile movement and drag.
scoreboard players set #500 gunsr.bullet 500
scoreboard players set #1000 gunsr.bullet 1000

# Remove bullet entities left over from previous projectile implementations.
kill @e[type=minecraft:silverfish,tag=bullet]
kill @e[type=minecraft:marker,tag=bullet]
