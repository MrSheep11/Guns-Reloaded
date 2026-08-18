# Converts integer to string UUID and stores to UUID:out plain

# Copy the UUID once. Reading four entity NBT paths separately serializes the
# complete entity four times.
data remove storage uuid:temp raw
data modify storage uuid:temp raw set from entity @s UUID

# 4th Part
execute store result score @s uuid store result score @s uuid.0 run data get storage uuid:temp raw[3]
execute store result storage uuid:temp 7 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 6 int 1 run scoreboard players operation @s uuid /= 65536 __int__

# 3rd Part
execute store result score @s uuid store result score @s uuid.0 run data get storage uuid:temp raw[2]
execute store result storage uuid:temp 5 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 4 int 1 run scoreboard players operation @s uuid /= 65536 __int__

# 2nd Part
execute store result score @s uuid store result score @s uuid.0 run data get storage uuid:temp raw[1]
execute store result storage uuid:temp 3 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 2 int 1 run scoreboard players operation @s uuid /= 65536 __int__

# 1st Part
execute store result score @s uuid store result score @s uuid.0 run data get storage uuid:temp raw[0]
execute store result storage uuid:temp 1 int 1 run scoreboard players operation @s uuid.0 %= 65536 __int__
execute store result storage uuid:temp 0 int 1 run scoreboard players operation @s uuid /= 65536 __int__

# Map to Hex
function mcfentitymap:internal/uuid/map with storage uuid:temp

# Store Result
function mcfentitymap:internal/uuid/result with storage uuid:temp
