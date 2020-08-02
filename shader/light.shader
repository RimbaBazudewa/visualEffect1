shader_type canvas_item;
uniform float size = 0.4;
float light_effect(vec2 pos, float mul)
{
	return mul * mul / length(pos);
}
void fragment()
{
	vec4 _text= texture(TEXTURE , UV);
	vec2 uv = UV;
	uv -= vec2(0.5);
	float l = light_effect(uv, size );
	vec4 light = vec4(l);
	//light *= abs(sin(TIME * 20.));
	
	
	COLOR = light;
}