#pragma once
/* ZauRus'72 */

#ifdef SHADER_FSH
in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;

uniform sampler2D lightmap;
uniform sampler2D texture;
uniform vec4 entityColor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = texture2D(texture, texcoord) * glcolor;
	color.rgb = mix(color.rgb, entityColor.rgb, entityColor.a);
	color *= texture2D(lightmap, lmcoord);

	out_tex = color; //gcolor
}
#endif

#ifdef SHADER_VSH
out vec2 lmcoord;
out vec2 texcoord;
out vec4 glcolor;

void main() 
{
	gl_Position = ftransform();
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;
}
#endif