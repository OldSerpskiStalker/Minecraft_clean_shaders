#pragma once 
/* ZauRus'72 */

#ifdef SHADER_FSH
in vec2 lmcoord;
in vec4 glcolor;

uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = glcolor;
	color *= texture2D(lightmap, lmcoord);

	out_tex = color; //gcolor
}
#endif

#ifdef SHADER_VSH
out vec2 lmcoord;
out vec4 glcolor;

void main() 
{
	gl_Position = ftransform();
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;
}
#endif