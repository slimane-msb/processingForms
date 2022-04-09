uniform mat4 transform;
uniform mat4 texMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelview;

uniform vec4 lightPosition;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 textCord;

attribute float idnum;
attribute float idselect ;
// if there are equal then color it otherwise; stay the same 
 

//varying vec4 vertColor;
varying vec3 vertNormal;
varying vec4 vertPosition;
varying vec4 vertColor;
varying vec2 cordTexture;
varying float n;

void main() {
  cordTexture = textCord;
  gl_Position = transform * position; 
  n=idnum;   
}
