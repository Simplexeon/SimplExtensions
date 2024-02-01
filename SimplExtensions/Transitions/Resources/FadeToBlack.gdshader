shader_type canvas_item;

uniform float time = 0.0;
uniform vec2 screen_size = vec2(1.0, 1.0);
uniform vec4 modulate : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
	vec2 screen_center = screen_size * .5;
	
	if(length(vec2(FRAGCOORD.x, FRAGCOORD.y) - screen_center) <= time * length(screen_size)) {
		COLOR = modulate;
	}
	else {
		COLOR = vec4(1.0, 1.0, 1.0, 0.0);
	}
}
