#pragma once
/* ZauRus'72 */

#ifdef SHADER_FSH
in vec2 texcoord;

uniform sampler2D gcolor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec3 color = texture2D(gcolor, texcoord).rgb;

	out_tex = vec4(color, 1.0); //gcolor
}
#endif

#ifdef SHADER_VSH
out vec2 texcoord;

void main() 
{
	gl_Position = ftransform();
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
}
#endif