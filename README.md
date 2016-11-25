PROTOCENTRAL VL53L0X LASER TOF SENSOR BREAKOUT
================================
[![Laser Sensor](https://www.protocentral.com/4064-large_default/protocentral-vl53l0x-laser-tof-sensor-breakout.jpg)  
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
* **/arduino** - Arduino library and example sketch
* **/hardware** - All Eagle design files (.brd, .sch)
* **/extras** - datasheets and extras
* **/processing** - Processing-based Application
 
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

 #### 5V Arduino boards

(including Arduino Uno, Leonardo, Mega; Pololu A-Star 32U4)

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

![Port Selection](https://github.com/Protocentral/AFE4400_Oximeter/blob/master/Processing/Final%20Output/Port-Selection.png)

 e. Once the port selection is appropriate the START button gets enabled. Click "START" to initiate visualization

 f. You should see the PPG ( RED and IR) waves generated with the values obtained from the AFE4490 Oximeter Shield Breakout Board as shown below.

![Read mm Form in Processing](https://github.com/Protocentral/AFE4400_Oximeter/blob/master/Processing/Final%20Output/PPG-Generated.png)

License Information
===================
This product is open source! Both, our hardware and software are open source and licensed under the following licenses:

Hardware
---------
**All hardware is released under [Creative Commons Share-alike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/).**
![CC-BY-SA-4.0](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

Software
--------
**All software is released under the MIT License(http://opensource.org/licenses/MIT).**

Please check [*LICENSE.md*](LICENSE.md) for detailed license descriptions.