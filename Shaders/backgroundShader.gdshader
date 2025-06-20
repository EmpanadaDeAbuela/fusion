shader_type canvas_item;

uniform vec4 color1 : source_color = vec4(0.2, 0.1, 0.3, 1.0); // Color base oscuro
uniform vec4 color2 : source_color = vec4(0.6, 0.2, 0.6, 1.0); // Color acento
uniform float speed = 0.2;
uniform float scale = 5.0;

void fragment() {
	vec2 uv = UV * scale;
	float t = TIME * speed;

	// Movimiento de ondas
	float wave = sin(uv.y + t) * 0.5 + sin(uv.x + t * 1.5) * 0.5;
	wave = (wave + 1.0) * 0.5; // Normalizar de 0 a 1

	vec4 final_color = mix(color1, color2, wave);
	COLOR = final_color;
}
