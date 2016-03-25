/*
  Deremin - Processing v0
  by DTMR, 2016
  Read numbers from serial port as frequency value, then
  buzz up the oscillator on given frequency.
*/

import processing.sound.*;
import processing.serial.*;

SinOsc osc;   // Define the type of oscillator (Saw = SawOsc, Sine = SinOsc Triwave = TriOsc)
Serial myPort;
int frequency = 0;
int lf = 10;
String sensorData = null;

void setup() {
  size(200, 100);   // Just for simple sensor value meter
  frameRate(30);
  
  String portName = Serial.list()[1];
  println(portName);
  myPort = new Serial(this, portName, 115200);
  osc = new SinOsc(this);   // Create the oscillator. (Saw = SawOsc, Sine = SinOsc Triwave = TriOsc)
  osc.freq(frequency);
  osc.play();
}

void draw() {
  background(64);
  while (myPort.available() > 0) {
    sensorData = myPort.readStringUntil(lf);
    if (sensorData != null) {
      textSize(42);
      text(sensorData, 30, 60);
      frequency = Integer.parseInt(sensorData.trim());
    }
  }

  if(frequency < 80) {
    osc.amp(0); //Cut of the OSC volume if hands off.
  } else {
    osc.amp(1.0);
  }
  osc.freq(frequency);
}
