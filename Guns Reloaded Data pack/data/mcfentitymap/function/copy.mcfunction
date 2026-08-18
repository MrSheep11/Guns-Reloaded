### Copies an entity's map from one path to another
### Parameters:
### > "from" - path to copy from
### > "to" - path to copy to

# Retrieve UUID
function mcfentitymap:internal/uuid/get_uuid

# Create temporary storage
$data modify storage mcfentitymap:temp args.from set value $(from)
$data modify storage mcfentitymap:temp args.to set value $(to)
data modify storage mcfentitymap:temp args.UUID set from storage uuid:out plain

# Copy entry
function mcfentitymap:internal/copy/copy with storage mcfentitymap:temp args