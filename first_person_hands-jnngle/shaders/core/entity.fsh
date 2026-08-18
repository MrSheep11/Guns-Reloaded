#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

#if defined(ALPHA_CUTOUT) && defined(PER_FACE_LIGHTING) && !defined(EMISSIVE) && !defined(NO_OVERLAY) && !defined(APPLY_TEXTURE_MATRIX) && !defined(DISSOLVE)
#define MAYBE_FIRST_PERSON_HANDS
#endif

uniform sampler2D Sampler0;

#ifdef DISSOLVE
uniform sampler2D DissolveMaskSampler;
#endif

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
#ifdef PER_FACE_LIGHTING
in vec4 vertexPerFaceColorBack;
in vec4 vertexPerFaceColorFront;
#else
in vec4 vertexColor;
#endif

#ifndef EMISSIVE
in vec4 lightMapColor;
#endif

#ifndef NO_OVERLAY
in vec4 overlayColor;
#endif

in vec2 texCoord0;

#ifdef MAYBE_FIRST_PERSON_HANDS
in vec4 handCorner0;
in vec4 handCorner1;

const vec3 LEFT_HAND_MODEL_SCALE = vec3(0.471, 0.515, 1.515);
// The right-hand carrier is 0.5% larger than the left-hand carrier. That tiny
// difference is invisible in play but gives the fragment shader a stable hand
// identifier without relying on 26.2's per-frame vertex-arena offsets.
const vec3 RIGHT_HAND_MODEL_SCALE = vec3(0.473355, 0.517575, 1.522575);

const ivec4 ARM_UV[6] = ivec4[6](
    ivec4(40, 52, 36, 64),
    ivec4(44, 64, 48, 52),
    ivec4(36, 64, 32, 52),
    ivec4(44, 52, 40, 48),
    ivec4(40, 52, 44, 64),
    ivec4(36, 52, 40, 48)
);

const ivec4 SLIM_ARM_UV[6] = ivec4[6](
    ivec4(39, 52, 36, 64),
    ivec4(43, 64, 46, 52),
    ivec4(36, 64, 32, 52),
    ivec4(42, 52, 39, 48),
    ivec4(39, 52, 43, 64),
    ivec4(36, 52, 39, 48)
);

const bool ARM_ROTATE_UV[6] = bool[6](
    false, false, true, false, true, false
);

bool isSlimSkin() {
    // Same legacy/slim-marker test used by stable_player_display.
    vec4 sample1 = texture(Sampler0, vec2(54.0 / 64.0, 20.0 / 64.0));
    vec4 sample2 = texture(Sampler0, vec2(55.0 / 64.0, 20.0 / 64.0));
    return sample1.a == 0.0
        || (((sample1.r + sample1.g + sample1.b) == 0.0)
        && ((sample2.r + sample2.g + sample2.b) == 0.0)
        && sample1.a == 1.0 && sample2.a == 1.0);
}

float nearestReference(float value, vec3 references) {
    return min(abs(value - references.x), min(abs(value - references.y), abs(value - references.z)));
}

float handDimensionError(float diagonal, vec3 modelScale) {
    vec3 baseScale = 0.5 * modelScale;
    vec3 outerScale = (0.5 + 0.25 / 8.0) * modelScale;
    vec3 baseReferences = vec3(
        length(baseScale.xz), length(baseScale.yz), length(baseScale.xy)
    );
    vec3 outerReferences = vec3(
        length(outerScale.xz), length(outerScale.yz), length(outerScale.xy)
    );
    return min(nearestReference(diagonal, baseReferences), nearestReference(diagonal, outerReferences));
}

vec2 remapHeadToArm(vec2 headUv, bool rightHand, bool slim) {
    // A player head uses two identical 32x16 box layouts: base at x=0 and
    // outer layer at x=32. Every face is an 8x8 rectangle.
    vec2 source = headUv * 64.0;
    bool outerLayer = source.x >= 32.0;
    if (outerLayer) {
        source.x -= 32.0;
    }

    int face = -1;
    vec2 faceOrigin = vec2(0.0);
    if (source.y < 8.0) {
        if (source.x >= 8.0 && source.x < 16.0) {
            face = 1; // up
            faceOrigin = vec2(8.0, 0.0);
        } else if (source.x >= 16.0 && source.x <= 24.0) {
            face = 0; // down
            faceOrigin = vec2(16.0, 0.0);
        }
    } else if (source.y <= 16.0) {
        if (source.x < 8.0) {
            face = 2; // west
            faceOrigin = vec2(0.0, 8.0);
        } else if (source.x < 16.0) {
            face = 3; // north
            faceOrigin = vec2(8.0, 8.0);
        } else if (source.x < 24.0) {
            face = 4; // east
            faceOrigin = vec2(16.0, 8.0);
        } else if (source.x <= 32.0) {
            face = 5; // south
            faceOrigin = vec2(24.0, 8.0);
        }
    }

    if (face < 0) {
        return headUv;
    }

    vec2 localUv = clamp((source - faceOrigin) / 8.0, 0.0, 1.0);
    // ModelPart's UP polygon stores its source V coordinates in the opposite
    // order from the other five head faces. Restore vertex-order coordinates
    // before reproducing JNNGL's original per-vertex arm UV remap.
    if (face == 1) {
        localUv.y = 1.0 - localUv.y;
    }
    ivec4 uvData = slim ? SLIM_ARM_UV[face] : ARM_UV[face];

    if (rightHand) {
        uvData += ivec4(8, -32, 8, -32);
        if (outerLayer) {
            uvData.yw += 16;
        }
    } else if (outerLayer) {
        uvData.xz += 16;
    }

    vec2 armUv;
    if (ARM_ROTATE_UV[face]) {
        armUv = vec2(
            mix(float(uvData.x), float(uvData.z), localUv.y),
            mix(float(uvData.w), float(uvData.y), localUv.x)
        );
    } else {
        armUv = vec2(
            mix(float(uvData.z), float(uvData.x), localUv.x),
            mix(float(uvData.y), float(uvData.w), localUv.y)
        );
    }

    return armUv / 64.0;
}
#endif

out vec4 fragColor;

void main() {
    vec2 sampleCoord = texCoord0;

#ifdef MAYBE_FIRST_PERSON_HANDS
    if (handCorner0.w != 0.0 && handCorner1.w != 0.0) {
        float diagonal = length(
            handCorner0.xyz / handCorner0.w - handCorner1.xyz / handCorner1.w
        );
        float leftError = handDimensionError(diagonal, LEFT_HAND_MODEL_SCALE);
        float rightError = handDimensionError(diagonal, RIGHT_HAND_MODEL_SCALE);
        float bestError = min(leftError, rightError);

        if (bestError < 0.0006) {
            sampleCoord = remapHeadToArm(texCoord0, rightError < leftError, isSlimSkin());
        }
    }
#endif

    vec4 color = texture(Sampler0, sampleCoord);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

#ifdef PER_FACE_LIGHTING
    vec4 faceVertexColor = gl_FrontFacing ? vertexPerFaceColorFront : vertexPerFaceColorBack;
#else
    vec4 faceVertexColor = vertexColor;
#endif

#ifdef DISSOLVE
    if (faceVertexColor.a < texture(DissolveMaskSampler, texCoord0).a) {
        discard;
    }
    faceVertexColor.a = 1.0;
#endif

    color *= faceVertexColor * ColorModulator;
#ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
#ifndef EMISSIVE
    color *= lightMapColor;
#endif

    fragColor = apply_fog(
        color,
        sphericalVertexDistance,
        cylindricalVertexDistance,
        FogEnvironmentalStart,
        FogEnvironmentalEnd,
        FogRenderDistanceStart,
        FogRenderDistanceEnd,
        FogColor
    );
}
