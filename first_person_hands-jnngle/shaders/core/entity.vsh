#version 330

#if defined(PER_FACE_LIGHTING) || !defined(NO_CARDINAL_LIGHTING)
#moj_import <minecraft:light.glsl>
#endif
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

// Player skins use the entity_translucent pipeline. Keeping the extra hand
// varyings behind the same defines prevents unrelated entity variants from
// gaining shader inputs they do not need.
#if defined(ALPHA_CUTOUT) && defined(PER_FACE_LIGHTING) && !defined(EMISSIVE) && !defined(NO_OVERLAY) && !defined(APPLY_TEXTURE_MATRIX) && !defined(DISSOLVE)
#define MAYBE_FIRST_PERSON_HANDS
#endif

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

#ifndef NO_OVERLAY
uniform sampler2D Sampler1;
#endif

#ifndef EMISSIVE
uniform sampler2D Sampler2;
#endif

out float sphericalVertexDistance;
out float cylindricalVertexDistance;

#ifdef PER_FACE_LIGHTING
out vec4 vertexPerFaceColorBack;
out vec4 vertexPerFaceColorFront;
#else
out vec4 vertexColor;
#endif

#ifndef EMISSIVE
out vec4 lightMapColor;
#endif

#ifndef NO_OVERLAY
out vec4 overlayColor;
#endif

out vec2 texCoord0;

#ifdef MAYBE_FIRST_PERSON_HANDS
out vec4 handCorner0;
out vec4 handCorner1;
#endif

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

#ifdef PER_FACE_LIGHTING
    vec2 light = minecraft_compute_light(Light0_Direction, Light1_Direction, Normal);
    vertexPerFaceColorBack = minecraft_mix_light_separate(-light, Color);
    vertexPerFaceColorFront = minecraft_mix_light_separate(light, Color);
#elif defined(NO_CARDINAL_LIGHTING)
    vertexColor = Color;
#else
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
#endif

#ifndef EMISSIVE
    lightMapColor = sample_lightmap(Sampler2, UV2);
#endif

#ifndef NO_OVERLAY
    overlayColor = texelFetch(Sampler1, UV1, 0);
#endif

    texCoord0 = UV0;

#ifdef APPLY_TEXTURE_MATRIX
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
#endif

#ifdef MAYBE_FIRST_PERSON_HANDS
    // 26.2 places entity geometry in shared vertex arenas, so the absolute
    // gl_VertexID is unstable. Arena entries remain complete, aligned quads;
    // only the per-quad corner is used to reconstruct its diagonal.
    handCorner0 = vec4(0.0);
    handCorner1 = vec4(0.0);
    switch (gl_VertexID & 3) {
        case 0: handCorner0 = vec4(Position, 1.0); break;
        case 2: handCorner1 = vec4(Position, 1.0); break;
    }
#endif
}
