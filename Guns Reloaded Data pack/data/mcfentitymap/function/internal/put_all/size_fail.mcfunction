$function mcfentitymap:message/error {message: "Key list size ($(keysize)) and value list size ($(valuesize)) do not match!"}
data remove storage mcfentitymap:temp keysize
data remove storage mcfentitymap:temp valuesize
scoreboard objectives remove mcfem.keysize
scoreboard objectives remove mcfem.valuesize