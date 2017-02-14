PROTOCENTRAL VL53L0X LASER TOF SENSOR BREAKOUT
================================
[![Laser Sensor](https://www.protocentral.com/4446-thickbox_default/protocentral-vl53l0x-laser-tof-sensor-breakout.jpg)  
*PROTOCENTRAL VL53L0X LASER TOF SENSOR BREAKOUT (PC-SEN-2001)*](https://www.protocentral.com/motiondistance/1049-protocentral-vl53l0x-laser-tof-sensor-breakout.html)

ST's VL53L0X is a 940 nm Laser source and a detector built in to the same chip. The result is a high accuracy Laser ranging sensor. 

This breakout board (along with the Arduino libraries) from ProtoCentral make it easier to do quick prototypes for applications that require precision ranging. Applications include obstacle detection and gesture recognition, among others. We have even used these for non-invasive liquid level detection. 

This device is a Class 1 Laser device, so is classified "Eye-safe", meaning it will not burn your corneas out !

Features:
* 940 nm VCSEL laser including driver
* Integrated Avalanche Photodiode
* Maximum ranging distance of up to 2 m
* High immunity to ambient light

Includes:
----------
* 1x Protocentral VL53L0X Laser tof sensor.
* 1x Set of breakaway headers

Repository Contents
-------------------
* **/software** - Arduino library and processing example sketch
* **/hardware** - All Eagle design files (.brd, .sch)
* **/extras** - datasheets and extras

 
Using Processing - Data Visualization Software
-----------------------------------------------------
 Processing is a data visualization software, in existence since 2001, used by artists and scientists alike. It’s an open source coding framework based on Java. If you are familiar with the Arduino environment, the Processing IDE is similar and you won’t have much of a learning curve to climb!
 
 The following are the steps to run the code:

### 1. Download and Install Processing 

 Download the processing ide latest version from the link

* [Download Processing for your OS] (http://download.processing.org/)

Once downloaded, unzip the archive and install the app as per your OS.

### 2. Download the Processing code for VL53L0X tof sensor

 a. Download the necessary files & directories or clone to your desktop from GitHub.

 b. Unzipping the archive should make a folder by name Protocentral_VL530lx that contains the visualization code.

 c. Locate the Processing sketchbook directory on your computer. This should have been created automatically when you installed processing. Depending on your operating system, the path will be as follows:

* On Windows: c:/My Documents/Processing/
* On MAC: /Users/your_user_name/Documents/Processing/
* On Linux: /Home/your_user_name/sketchbook/

**Note:** This directory appears as "Processing" on Windows/Mac, and goes by the name "Sketchbook" on Linux. Create a subdirectory by name "libraries" if one doesn't exist already.

 d. From the above mentioned "Protocentral_VL530lx-master" directory Copy/Move the contents of the Protocentral_VL530lx-master/processing/openview_tof folder to the Processing sketchbook directory which is also mentioned above (Locate the Processing sketchbook)

 e. Finally, copy the G4P directories from Protocentral_VL530lx-master\Processing\libraries and paste them into the libraries directory of your Processing sketchbook.

 f. You are all set now to get your reading visualized from the VL530lx !

 Arduino boards connections


    Arduino   VL53L0X board
    -------   -------------
         5V - VIN
        GND - GND
        SDA - SDA
        SCL - SCL
 
###  Uploading Arduino Sketch For VL530lx breakout

 a. Open the Arduino IDE to load the embedded code for VL530lx.

 b. Click on File -> Open and Browse the .ino code for Arduino from Protocentral_VL530lx-master\arduino and export the application to Arduino.

###  Open Processing & launch the openview_tof

 a. If Processing IDE was open, close it and reopen to refresh the libraries and sketches. The repositories are not refreshed if the IDE was open while the Sketches and Libraries were being updated.

 b. Double-click any of the .pde files in the openview_pulseox directory to open all of the pulse oximeter code in the Processing IDE.

 c. If everything done so far was good, clicking the "run" button on the top left corner of the IDE, should run the code! If it does not, make sure you installed your libraries correctly.

 d. Once the GUI is running, select the port connect with breakout board from the "SELECT PORT" dropdown as shown in the figure below

![Port Selection](https://github.com/Protocentral/Protocentral_VL530LX/blob/master/software/processing/Final%20Output/portselection.png)

 e. Once the port selection is appropriate the START button gets enabled. Click "START" to initiate visualization

 f. You should range of detection in mm from the Breakout Board as shown below.

![Read mm Form in Processing](https://github.com/Protocentral/Protocentral_VL530LX/blob/master/software/processing/Final%20Output/output.png)

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
