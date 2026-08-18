# MCFEM
scoreboard objectives add mcfem.suppress_errors dummy
scoreboard objectives add mcfem.show_errors dummy
scoreboard objectives add mcfem.show_notices dummy

# UUID
scoreboard objectives add uuid dummy
scoreboard objectives add uuid.0 dummy
scoreboard objectives add __int__ dummy
scoreboard players set 65536 __int__ 65536
execute unless data storage uuid:rom hex run function mcfentitymap:internal/uuid/initialize_uuid