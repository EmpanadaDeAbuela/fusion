shader_type canvas_item;

uniform sampler2D noise_texture;
uniform float time;
uniform float intensity = 0.5;
uniform vec4 glow_color : source_color = vec4(1.0, 0.85, 0.3, 1.0);

void fragment() {
    vec2 uv = UV + vec2(time * 0.2, time * 0.1);
    float noise_val = texture(noise_texture, uv).r;
    float glow = sin(time * 4.0 + noise_val * 10.0) * 0.5 + 0.5;

    vec4 base_color = texture(TEXTURE, UV);
    vec4 final_color = mix(base_color, glow_color, glow * noise_val * intensity);

    COLOR = final_color;
}