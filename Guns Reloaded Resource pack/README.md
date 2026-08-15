# First Person Hand Models - Minecraft Java 26.2

This is a compatibility port of JNNGL's First Person Hand Models proof of
concept from
[commit 8068265](https://github.com/JNNGL/vanilla-shaders/commit/80682651110e688a28d21f893f66fe32a7574fad).
The example rifle model credits Falanta in its model file.

## Install

Place the ZIP in your `resourcepacks` folder and enable it. Keep it above any
other pack that replaces `assets/minecraft/shaders/core/entity.vsh` or
`entity.fsh`.

The included example is attached to the `minecraft:mosin_rifle` item model.
Give yourself a player head carrying that model with:

```mcfunction
/give @s minecraft:player_head[minecraft:profile={name:"Notch"},minecraft:item_model="minecraft:mosin_rifle"]
```

Change the profile name to use another player's skin.

## 26.2 port notes

- Resource-pack format updated to 88.
- Player-head special-model syntax updated to `minecraft:player_head`.
- Player-head layers include 26.2's explicit `[0.5, 0.0, 0.5]` local
  translation, which replaces the renderer-side alignment used by 1.21.4.
- The old `entity_translucent` shader override was moved to the consolidated
  26.2 `entity` shader.
- The hand remap no longer depends on absolute `gl_VertexID` face/part indices,
  which are unstable with 26.2's shared entity vertex arenas.
- Hand carriers are selected by their deliberately unique dimensions instead
  of a projection-matrix heuristic, which varies between 26.2 render paths.
- The right-hand carrier is scaled by 0.5% as a shader-readable identifier.
- All composite cuboid models use the 26.2 items atlas; placeholder faces from
  the original model were removed instead of resolving to the missing texture.

Core shader overrides are internal Minecraft behavior and may conflict with
shader mods or other core-shader resource packs.
