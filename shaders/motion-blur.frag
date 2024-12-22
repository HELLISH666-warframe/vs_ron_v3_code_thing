#pragma header
const int Samples = 12; //multiple of 2
uniform float Intensity = 0.6;
uniform vec2 Direction;
uniform float iTime;

const bool UseNoise = true;
const float NoiseScale = 1.;
const float NoiseStrength = 0.15;

vec4 DirectionalBlur(in vec2 UV, in vec2 Direction, in float Intensity, in sampler2D Texture)
{
    vec4 Color = vec4(0.0);  
    float Noise = (fract(sin(dot(UV * iTime, vec2(12.9898,78.233)*2.0)) * 43758.5453));
    
    if (UseNoise==false)
    for (int i=1; i<=Samples/2; i++)
    {
    Color += texture2D(Texture,UV+float(i)*Intensity/float(Samples/2)*Direction);
    Color += texture2D(Texture,UV-float(i)*Intensity/float(Samples/2)*Direction);
    }
	else      
    for (int i=1; i<=Samples/2; i++)
    {
    Color += texture2D(Texture,UV+float(i)*Intensity/float(Samples/2)*(Direction*(NoiseStrength*Noise)));
    Color += texture2D(Texture,UV-float(i)*Intensity/float(Samples/2)*(Direction*(NoiseStrength*Noise)));  
    }    
    return Color/float(Samples);    
}

void main()
{
	vec2 UV = openfl_TextureCoordv.xy;
    vec4 Color = DirectionalBlur(UV,normalize(Direction),Intensity,bitmap);
	gl_FragColor = Color;
}