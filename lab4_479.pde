import processing.serial.*;
import org.gicentre.utils.stat.*;
PImage logoImage;

float fsr1, fsr2, fsr3, fsr4;
float AcX, AcY, AcZ;
int second = 0;
boolean isMoving = false;
int stillThresholdx = 16800; // Define a threshold for standing still
int stillThresholdy = 15800;
int stillThresholdz = 4400;
Serial myPort;  // Create object from Serial class

void setup(){
  size(1500, 850);
  textAlign(CENTER, CENTER);
  textSize(24);
  logoImage = loadImage("insoles.jpg");
  myPort = new Serial(this, "/dev/cu.usbmodem123456781", 115200);
}

void draw(){
  welcomeScreen();
  
  if (myPort.available() > 0 ) {  // If data is available,
    String val = myPort.readStringUntil('\n'); // read it until newline
    if (val != null){
      println(val);
    }
  }
  
  if (screen == 1){
    int newWidth = logoImage.width * 2;  // Double the image's width
    int newHeight = logoImage.height * 2; // Double the image's height
    
    image(logoImage, width/2-100, 150, newWidth-100 , newHeight-200);
    gameScreen();
    text ("hit b to go to the back", 1200, 50);
    gameStart = true;
  } else if (screen == 0){
    screenSetUp();
    text ("hit 'g' to go to the game", 1200, 50);
    gameStart = false;
  }
  
  // Display user's motion status
  if (isMoving) {
    fill(0, 255, 0); // Red color for motion
    text("User is in motion", width/2, height-50);
  } else {
    fill(255, 0, 0); // Green color for standing still
    text("User is standing still", width/2, height-50);
  }
  
}

void welcomeScreen() {
  pushStyle();
  background(#5097a4); // Cyan background (RGB values: 0, 255, 255)
  fill(255);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Welcome to Lab 4", width/2, 40);
  textSize(25);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("By: Sohaib, Naveed, Hafsa, Reem", width/2, 70);
  popStyle();
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');  // Read the incoming data

  if (inString != null) {
    inString = trim(inString);  // Trim whitespace and newline characters
    String[] sensorValues = split(inString, ',');  // Split the string at commas

    if (sensorValues.length == 7) {  // Ensure there are exactly 7 values
      // Convert the string values to floats and store them in their respective variables
      fsr1 = float(sensorValues[0]);
      fsr2 = float(sensorValues[1]);
      fsr3 = float(sensorValues[2]);
      fsr4 = float(sensorValues[3]);
      AcX = float(sensorValues[4]);
      AcY = float(sensorValues[5]);
      AcZ = float(sensorValues[6]);
     
      println("FSR 1: " + fsr1 + ", FSR 2: " + fsr2 + ", FSR 3: " + fsr3 + ", FSR 4: " + fsr4);
      println("AcX: " + AcX + ", AcY: " + AcY + ", AcZ: " + AcZ);
      second++;
      
      // Check if the magnitude of acceleration is above a threshold
      if (abs(AcX) < stillThresholdx && abs(AcY) > stillThresholdy ) {
        //&& abs(AcZ) > stillThresholdz for uptop if needed
        isMoving = true; 
      } 
      else {
        isMoving = false;
      }
      
      // Perform actions based on whether the user is moving or standing still
      if (isMoving) {
        println("User is in motion");
        // Perform actions for motion
      } else {
        println("User is standing still");
        // Perform actions for standing still
      }
      
      // Optionally, append data to arrays for further analysis
      x1.append(second);
      y1.append(fsr1);
      x2.append(second);
      y2.append(fsr2);
      x3.append(second);
      y3.append(fsr3);
      x4.append(second);
      y4.append(fsr4);
    }
  }
}
