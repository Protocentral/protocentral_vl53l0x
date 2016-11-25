// Need G4P library
import g4p_controls.*;
import processing.serial.*;
import controlP5.*;
import static javax.swing.JOptionPane.*;
import java.awt.*;
import javax.swing.JFileChooser;

ControlP5 cp5;
Graph g1;
int time = 0;

boolean portSelected = false;

String data="";

/************** Packet Validation  **********************/
private static final int CESState_Init = 0;
private static final int CESState_SOF1_Found = 1;
private static final int CESState_SOF2_Found = 2;
private static final int CESState_PktLen_Found = 3;

/*CES CMD IF Packet Format*/
private static final int CES_CMDIF_PKT_START_1 = 0x0A;
private static final int CES_CMDIF_PKT_START_2 = 0xFA;
private static final int CES_CMDIF_PKT_STOP = 0x0B;

/*CES CMD IF Packet Indices*/
private static final int CES_CMDIF_IND_LEN = 2;
private static final int CES_CMDIF_IND_LEN_MSB = 3;
private static final int CES_CMDIF_IND_PKTTYPE = 4;
private static int CES_CMDIF_PKT_OVERHEAD = 5;

/************** Port Related Variables **********************/

Serial port = null;
int Ss = -1;
String[] comList;
boolean serialSet;
boolean Comselected = false;
String portName;
char inString = '\0';
String selectedPort;

/************** Packet Related Variables **********************/

int SPS = 50;
int ecs_rx_state = 0;
int CES_Pkt_Len;
int CES_Pkt_Pos_Counter;
int CES_Pkt_Data_Counter1, CES_Pkt_Data_Counter2, CES_Pkt_Cali_Data_Counter;
int CES_Pkt_PktType;
char DataRcvPacket1[] = new char[10];
char DataRcvPacket2[] = new char[10];
char CalibrationPacket[] = new char[30];
int acknowledgement;
long data1, data2,avg,count,avg1;
double volts1;
int arraySize = 200;
String msg = "Click Connect Button To Proceed";
boolean paused;
float mmValue[] = new float[arraySize];
float XValues[] = new float[arraySize];
int arrayIndex = 0;
float t = 0;

Textlabel value;

void setup()
{
  size(1400, 750);
  surface.setResizable(true);
  createGUI();
  customGUI();
  g1 = new Graph();
  g1.GraphAxis(100, 50, width-200, height-100);
  strokeWeight(4);  // Thicker
  line(20, 40, 80, 40);
  strokeWeight(4);
  g1.GraphColor = color(0, 255, 0);
  //g1.GrapthC

  setChartSettings();
  for (int i=0; i<arraySize; i++) 
  {
    t = t + 1;
    XValues[i]= t;
    mmValue[i] = 0;
  }
  t = 0;
  cp5 = new ControlP5(this);
  value = cp5.addTextlabel("label")
    .setText("0 mm")
    .setPosition(width-310, 100)
    .setColorValue(0xffffff00)
    .setFont(createFont("Arial Bold", 45))
    ;
  println(arraySize);
  setChartSettings();
}

void draw()
{
  background(0);
  while (portSelected == true && serialSet == false)
  {
    startSerial();
  }
  g1.DrawAxis();
  g1.LineGraph(XValues, mmValue);
}

void startSerial()
{
  try
  {
    port = new Serial(this, selectedPort, 9600);
    port.clear();
    serialSet = true;
    msgBox.setText("Port Connected");
  }
  catch(Exception e)
  {
    msgBox.setText("Port Connection Failed");
    showMessageDialog(null, "Port is busy", "Alert", ERROR_MESSAGE);
    portSelected = false;
    portList.setEnabled(true);
    portList.setItems(comList, 0);
  }
}

/*********************************************** Serial Port Event Function *********************************************************/

void serialEvent (Serial blePort) 
{
  inString = blePort.readChar();
  // println(inString); 
  ecsProcessData(inString);
}

void ecsProcessData(char rxch)
{

  switch(ecs_rx_state)
  {
  case CESState_Init:
    //  println((char)rxch);
    if (rxch==CES_CMDIF_PKT_START_1)
      ecs_rx_state=CESState_SOF1_Found;
    break;

  case CESState_SOF1_Found:
    if (rxch==CES_CMDIF_PKT_START_2)
      ecs_rx_state=CESState_SOF2_Found;
    else
      ecs_rx_state=CESState_Init;
    break;

  case CESState_SOF2_Found:

    ecs_rx_state = CESState_PktLen_Found;
    CES_Pkt_Len = (int) rxch;
    CES_Pkt_Pos_Counter = CES_CMDIF_IND_LEN;
    CES_Pkt_Data_Counter1 = 0;
    CES_Pkt_Data_Counter2 = 0;
    CES_Pkt_Cali_Data_Counter = 0;
    break;

  case CESState_PktLen_Found:
    CES_Pkt_Pos_Counter++;
    if (CES_Pkt_Pos_Counter < CES_CMDIF_PKT_OVERHEAD)  //Read Header
    {
      if (CES_Pkt_Pos_Counter==CES_CMDIF_IND_LEN_MSB)
        CES_Pkt_Len = (int) ((rxch<<8)|CES_Pkt_Len);
      else if (CES_Pkt_Pos_Counter==CES_CMDIF_IND_PKTTYPE)
        CES_Pkt_PktType = (int) rxch;
    } else if ( (CES_Pkt_Pos_Counter >= CES_CMDIF_PKT_OVERHEAD) && (CES_Pkt_Pos_Counter < CES_CMDIF_PKT_OVERHEAD+CES_Pkt_Len+1) )  //Read Data
    {
      if (CES_Pkt_PktType == 2)
      {
        if (CES_Pkt_Data_Counter1 < 4)
        {
          //println(rxch);
          DataRcvPacket1[CES_Pkt_Data_Counter1]= (char) (rxch);
          CES_Pkt_Data_Counter1++;
        }
      }
    } else  //All header and data received
    {
      if (rxch==CES_CMDIF_PKT_STOP)
      { 
        data1 = ecsParsePacket(DataRcvPacket1, DataRcvPacket1.length-1);

        if (data1 > 2000)
        {
          data1 = 0;
          value.setText("Out of Range");
        } else
        {
          count++;
          if(count>=10)
          {
            avg /=10;
            count=0;
            avg1=avg;
            avg=0;
          }
          else
          {
            avg+= data1;
          }
          value.setText(avg1+"mm");
        }
        t = t + 1;
        mmValue[arrayIndex] = data1;
        XValues[arrayIndex] = t;
        arrayIndex++;
        
        msgBox.setText("Receiving data");

        if (arrayIndex == arraySize)
        {
          arrayIndex = 0;
          t = 0;
          //  println("done");
        }

        ecs_rx_state=CESState_Init;
      } else
      {
        ecs_rx_state=CESState_Init;
      }
    }
    break;

  default:
    break;
  }
}

/*********************************************** Recursion Function To Reverse The data *********************************************************/

public long ecsParsePacket(char DataRcvPacket[], int n)
{
  if (n == 0)
    return (long) DataRcvPacket[n]<<(n*8);
  else
    return (DataRcvPacket[n]<<(n*8))| ecsParsePacket(DataRcvPacket, n-1);
}


void setChartSettings() {
  g1.xDiv=10;  
  g1.xMax=arraySize;
  g1.xMin=0;  
  g1.yMax=200 ; 
  g1.yMin=25;
  g1.yDiv=20;
}

double averageValue(float dataArray[])
{

  float total = 0;
  for (int i=0; i<dataArray.length; i++)
  {
    total = total + dataArray[i];
  }

  return total/dataArray.length;
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  comList = port.list();
  String comList1[] = new String[comList.length+1];
  comList1[0] = "SELECT THE PORT";
  for (int i = 1; i <= comList.length; i++)
  {
    comList1[i] = comList[i-1];
  }
  comList=comList1;
  portList.setItems(comList1, 0);
  msgBox.setFont(new Font("Arial Bold", Font.PLAIN, 25));
  msgBox.setLocalColor(2, color(0xffffff00));
}