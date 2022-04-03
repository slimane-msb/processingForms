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
varying vec4 vertColor;
varying vec2 cordTexture;

void main() {
  vec4 coltex=texture2D(texture, cordTexture);
  vec3 ecPosition = vec3(modelview * vertPosition);  
  vec3 ecNormal = normalize(normalMatrix * vertNormal);

  vec3 direction = normalize(lightPosition.xyz - ecPosition);    
  float intensity = max(0.0, dot(direction, ecNormal));

  gl_FragColor = vec4(intensity, intensity, intensity, 1) * vertColor; 
  //gl_FragColor = vertColor;
}
