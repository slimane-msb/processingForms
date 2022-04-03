uniform mat4 transform;
uniform mat4 texMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelview;

uniform vec4 lightPosition;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec4 textCord;

//varying vec4 vertColor;
varying vec3 vertNormal;
varying vec4 vertPosition;
varying vec4 vertColor;
varying vec2 cordTexture;

void main() {
  gl_Position = transform * position;    
  vec3 ecPosition = vec3(modelview * position);  
  //vec3 ecNormal = normalize(normalMatrix * normal);

  //vec3 direction = normalize(lightPosition.xyz - ecPosition);    
  //float intensity = max(0.0, dot(direction, ecNormal));

  //vertColor = vec4(intensity, intensity, intensity, 1) * color;     
  vertNormal   = normal;
  vertPosition = position;
  vertColor    = color;
  //cordTexture= texMatrix*vec4(textCord, 1.0,1.0);
}
