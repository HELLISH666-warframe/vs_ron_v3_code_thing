#pragma header
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}
uniform float iTime;
uniform float on;

void main()
{
	vec2 uv = openfl_TextureCoordv;//Condensing this into one line
	vec4 texColor = texture2D(bitmap, uv);//Get the pixel at xy from iChannel0
	if (on == 1.) {
    
		float gt = 1421.0 + rand(vec2(iTime, iTime)) * 3.0;
		float m = mod(iTime, 1.0);
		bool glitch = m < 1.;
		float t = floor(iTime * gt) / gt;
		float r = rand(vec2(t, t));
    
		if(glitch) {
        
			vec2 uvGlitch = uv;
			uvGlitch.x -= r / 10.0;
			if(uv.y > r && uv.y < r + 0.01) {
				texColor = texture2D(bitmap, uvGlitch);
			}
		}
		
		//fragColor = vec4(uv,0.5+0.5*sin(iTime),1.0);
	}
	gl_FragColor = texColor;
}