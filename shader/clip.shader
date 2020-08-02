shader_type canvas_item;
uniform vec4 color:hint_color;
void fragment()
{
        vec4 text= texture(TEXTURE , UV);
		float a = 0.0;
		if (text == color)
		{
			a = 0.0f;
		}else
		{
			a = text.a;
		}
        COLOR = vec4(text.rgb,a);
}