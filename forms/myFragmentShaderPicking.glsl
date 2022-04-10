
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;

varying float idS;

void main() {
  vec4 colorTest = vec4(0.0, 0.8667, 1.0, 1.0);
  if(0==0){
    colorTest = vec4(0.4941, 1.0, 0.0824, 1.0);
  }
  gl_FragColor = texture2D(texture, vertTexCoord.st) * colorTest;
  //gl_FragColor = texture2D(texture, vertTexCoord.st) * colorTest;
}