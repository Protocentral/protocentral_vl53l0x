/* 
This example shows how to use continuous mode to take
range measurements with the VL6180X. 
The range readings are in units of mm displayed in GUI. 
Connections:
    Arduino   VL53L0X breakout board
    -------   -------------
         5V - VIN
        GND - GND
        SDA - SDA
        SCL - SCL
*/


#include <Wire.h>
#include <Protocentral_VL53L0x.h>

signed long data=0;
volatile int i;

//------------------------------------------------------------------------//

VL53L0X sensor;

void setup()
{
  Serial.begin(9600);           // Open serial communications and wait for port to open:
  Wire.begin();

  sensor.init();
  sensor.startContinuous();
}


void loop() // run over and over
{

  data = sensor.readRangeContinuousMillimeters();  //data received in mm
  
  Serial.println(data); // print over serial terminal
  
  delay(10);

}

