shader_type canvas_item;

uniform bool enabled = true;

uniform float scanline_count : hint_range(0, 1800) = 50.0;
uniform float scanline_opacity : hint_range(0, 1) = 0.4;
uniform float warp_amount : hint_range(0, 5) = 1.0;
uniform float vignette_opacity : hint_range(0, 1) = 0.5;
uniform float aberration_amount : hint_range(0, 10) = 0.5;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

vec2 warp(vec2 uv) {
	vec2 dc = abs(0.5 - uv);
	dc *= dc;
	return uv + (uv - 0.5) * dc * (dc.y + dc.x) * warp_amount;
}

void fragment() {
	if (enabled) {
		vec2 uv = warp(SCREEN_UV);

		if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
			COLOR = vec4(0.0, 0.0, 0.0, 1.0);
		} else {
			float r = texture(screen_texture, uv + vec2(aberration_amount * SCREEN_PIXEL_SIZE.x, 0.0)).r;
			float g = texture(screen_texture, uv).g;
			float b = texture(screen_texture, uv - vec2(aberration_amount * SCREEN_PIXEL_SIZE.x, 0.0)).b;
			vec3 color = vec3(r, g, b);

			float scanline = sin(uv.y * scanline_count * PI * 2.0);
			scanline = (scanline + 1.0) / 2.0;
			color *= (1.0 - scanline_opacity) + scanline * scanline_opacity;

			float vignette = 16.0 * uv.x * uv.y * (1.0 - uv.x) * (1.0 - uv.y);
			vignette = pow(vignette, 0.1);
			color *= (1.0 - vignette_opacity) + vignette * vignette_opacity;

			COLOR = vec4(color, 1.0);
		}
	} else {
		COLOR = texture(screen_texture, SCREEN_UV);
	}
}