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
  // gl_FragColor = vec4(0.7529, 0.1373, 0.1373, 1.0);
  float N0 = mod(n, 256);
  float N1 = mod (((n-N0 ) /256), 256);
  float N2 = mod (((n-N0-N1*256 ) /256/256), 256);
  gl_FragColor = vec4(N2/255.0,N1/255.0,N0/255.0,1.0); 
}