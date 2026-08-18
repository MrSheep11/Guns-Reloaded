# Print name and UUID
$tellraw @a [{"selector":"$(UUID)","color":"aqua"}, \
            {"text":" (","color":"white"},{"text":"$(UUID)","color":"green"},{"text":"):","color":"white"}]

# Start printing
function mcfentitymap:internal/print_entity/print_line with storage mcfentitymap:temp iteration