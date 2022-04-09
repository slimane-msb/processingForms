#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform sampler2D texture;
uniform vec4 lightPosition;

//varying vec4 vertColor;
varying vec3 vertNormal;
varying vec4 vertPosition;

varying vec2 cordTexture;
varying float n;

vec4 vertColor;

void main() {
  // vec4 coltex=texture2D(texture, cordTexture);
  // vec3 ecPosition = vec3(modelview * vertPosition);  
  // vec3 ecNormal = normalize(normalMatrix * vertNormal);

  // vec3 direction = normalize(lightPosition.xyz - ecPosition);    
  // float intensity = max(0.0, dot(direction, ecNormal));

  
  //gl_FragColor = vertColor;
  float N0 = mod(n, 256);
  float N1 = mod (((n-N0 ) /256), 256);
  float N2 = mod (((n-N0-N1*256 ) /256/256), 256);
  gl_FragColor = vec4(N2/255.0,N1/255.0,N0/255.0,1.0); 
  //gl_FragColor = vec4(N0/255.0,N1/255.0,N2/255.0,1.0)*texture2D(texture,cordTexture ); 
}
