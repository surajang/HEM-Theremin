/*
  Digital Theremin - Arduino v0
  by DTMR, 2016
  Arduino Wiring:
  Analog Pin 0 - Sensor Data
*/

// Initializing
void setup() {
  Serial.begin(115200);
}

void loop() {
  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  Serial.print(sensorValue);
  Serial.print("\n");
  delay(10);        // Lil' delay for stability
}
