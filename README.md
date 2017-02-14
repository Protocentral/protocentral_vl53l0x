ProtoCentral VL53L0X Laser ToF sensor breakout board
====================================================
[![Laser Sensor](https://www.protocentral.com/4446-thickbox_default/protocentral-vl53l0x-laser-tof-sensor-breakout.jpg)  
*ProtoCentral VL53L0X Laser ToF sensor breakout (PC-SEN-2001)*](https://www.protocentral.com/motiondistance/1049-protocentral-vl53l0x-laser-tof-sensor-breakout.html)

ST's VL53L0X is a 940 nm Laser source and a detector built in to the same chip. The result is a high accuracy Laser ranging sensor. 

This breakout board (along with the Arduino libraries) from ProtoCentral make it easier to do quick prototypes for applications that require precision ranging. Applications include obstacle detection and gesture recognition, among others. We have even used these for non-invasive liquid level detection. 

This device is a Class 1 Laser device, so is classified "Eye-safe", meaning it will not burn your corneas out !

Features
--------
* 940 nm VCSEL laser including driver
* Integrated Avalanche Photodiode
* Maximum ranging distance of up to 2 meters
* High immunity to ambient light

Includes
--------
* 1x Protocentral VL53L0X Laser tof sensor
* 1x set of breakaway headers

Repository Contents
-------------------
* **/software** - Arduino library and processing example sketch
* **/hardware** - All Eagle design files (.brd, .sch)
* **/extras** - datasheets and extras

Arduino Quickstart
------------------

* Download the [ProtoCentral VL53L0X library here](releases/download/v1.0/protocentral_vl53l0x.zip).

*Once downloaded, unzip the ZIP archive and copy the folder to your "libraries" folder in the Arduino Sketchbook folder. It is usually located in:

	* On MAC: <user_home>/Documents/Arduino/libraries
	* On Windows: <user_home>/My Documents/Arduino/libraries
	* On Linux: /home/<user_name>/sketchbook  

* After the libraries are copied, you can open the example code from File->Examples->protocentral_vl53l0x->simple_distance

* Arduino boards connections

You can connect the vl53l0x board to your Arduino through the following pins

| Arduino | VL53L0X board |
| ------- | ------------- |
| 5V      | VIN |
| GND     | GND |
| SDA     | SDA |
| SCL     | SCL |
        
Using Processing - Data Visualization Software
----------------------------------------------
 To visualize the data in a graphical plot continuously as shown below , please follow the steps given in this [document](docs/using_processing.md).

![Read mm Form in Processing](docs/images/output.png)

License Information
===================
This product is open source! Both, our hardware and software are open source and licensed under the following licenses:

Hardware
---------
**All hardware is released under [Creative Commons Share-alike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).**
![CC-BY-SA-4.0](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

Software
--------
The Arduino library has been cloned from Pololu's Arduino library (https://github.com/pololu/vl53l0x-arduino/) based on ST Micro's code examples. The original code was licensed under the following conditions:

Copyright (c) 2016 Pololu Corporation.  For more information, see

https://www.pololu.com/
https://forum.pololu.com/

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=================================================================

Most of the functionality of this library is based on the VL53L0X
API provided by ST (STSW-IMG005), and some of the explanatory
comments are quoted or paraphrased from the API source code, API
user manual (UM2039), and the VL53L0X datasheet.

The following applies to source code reproduced or derived from
the API:

-----------------------------------------------------------------

Copyright © 2016, STMicroelectronics International N.V.  All
rights reserved.

Redistribution and use in source and binary forms, with or
without modification, are permitted provided that the following
conditions are met:
* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above
copyright notice, this list of conditions and the following
disclaimer in the documentation and/or other materials provided
with the distribution.
* Neither the name of STMicroelectronics nor the
names of its contributors may be used to endorse or promote
products derived from this software without specific prior
written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
NON-INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS ARE DISCLAIMED.
IN NO EVENT SHALL STMICROELECTRONICS INTERNATIONAL N.V. BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.

**All other software is released under the MIT License(http://opensource.org/licenses/MIT).**

Please check [*LICENSE.md*](LICENSE.md) for detailed license descriptions.
