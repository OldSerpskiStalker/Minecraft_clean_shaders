#pragma once 
/* ZauRus'72 */

#ifdef SHADER_FSH
in vec2 texcoord;
in vec4 glcolor;

uniform sampler2D texture;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = texture2D(texture, texcoord) * glcolor;

	out_tex = color; //gcolor
}
#endif

#ifdef SHADER_VSH
out vec2 texcoord;
out vec4 glcolor;

void main() 
{
	gl_Position = ftransform();
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	glcolor = gl_Color;
}
#endif