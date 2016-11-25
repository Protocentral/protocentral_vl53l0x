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

//----------------------------Packet Variables-----------------------------//

#define CES_CMDIF_PKT_START_1   0x0A
#define CES_CMDIF_PKT_START_2   0xFA
#define CES_CMDIF_TYPE_DATA   0x02
#define CES_CMDIF_PKT_STOP    0x0B

volatile char DataPacketHeader[16];
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
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.println(sensor.readRangeContinuousMillimeters());
}


void loop() // run over and over
{

  data = sensor.readRangeContinuousMillimeters();  //data received in mm
 // data = data - 10;

  DataPacketHeader[0] = 0x0A;  // Packet Header
  DataPacketHeader[1] = 0xFA;  // Packet Header
  DataPacketHeader[2] = 0x04;  // Data Length LSB in Bytes
  DataPacketHeader[3] = 0;     // Data Length MSB in Bytes
  DataPacketHeader[4] = 0x02;  // Packet type 0x01->command , 0x02->data


  DataPacketHeader[5] = data;       // data LSB
  DataPacketHeader[6] = data >> 8;  //
  DataPacketHeader[7] = data >> 16;
  DataPacketHeader[8] = data >> 24; //Data MSB

  DataPacketHeader[9] = 0x00;
  DataPacketHeader[10] = 0x0B;      // Packet footer

  for (i = 0; i < 11; i++)
  {
    Serial.write(DataPacketHeader[i]); // transmit through uart line
  }

  delay(10);

}

