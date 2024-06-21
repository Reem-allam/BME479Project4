int screen,score,duration,c,correctCircle = 0;
boolean gameStart;
int threshold = 600;

void gameScreen(){
 if (gameStart) {
    if (c == 0){
      selectRandomCircle();
      c++;
    }
    
    // Draw the circles and set the color
    for (int i = 0; i < 4; i++) {
      if (correctCircle == i+1) {
        fill(0, 255, 0); // Green for the correct circle
      } else {
        fill(255, 0, 0); // Red for incorrect circles
      }
      if (i==0){
          ellipse(750, 680, 60,60);
        }else if (i == 1){
          ellipse(830, 350, 60, 60);
        }else if (i == 2){
           ellipse(720, 350, 60, 60);
        }else if (i == 3){
      ellipse(780, 240, 60, 60);
        }
    }

    // Check the sensor values to see if the correct circle is selected
    
    if (fsr1 > threshold){
      if (correctCircle == 1){
        score++;
      }else{
        score --;
      }
       delay(1000); // Wait for half a second
      selectRandomCircle();
    } else if (fsr2 > threshold){
      if (correctCircle == 2){
        score++;
      }else{
        score --;
      }
       delay(1000); // Wait for half a second
      selectRandomCircle();
    }else if (fsr3 > threshold){
      if (correctCircle == 3){
        score++;
      }else{
        score --;
      }
       delay(1000); // Wait for half a second
      selectRandomCircle();
    }else if (fsr4 > threshold){
      if (correctCircle == 4){
        score++;
      }else{
        score --;
      }
       delay(1000); // Wait for half a second
      selectRandomCircle();
    }
   
    if (score < 0){score = 0;}
    text ("Your current score is: " + score, width/2, 90);
    
  }
}

void selectRandomCircle() {
  correctCircle = int(random(1, 5)); // Select a random number between 1 and 4
}

// Function to simulate sensor input for testing
void keyPressed() {
  if (key == '1') fsr1 = 801;
  if (key == '2') fsr2 = 801;
  if (key == '3') fsr3 = 801;
  if (key == '4') fsr4 = 801;
  switch (key){
   case 'g':
     screen = 1;
      return;
    case 'b':
      screen = 0;
      return;
    
  }
}

void keyReleased() {
  fsr1 = fsr2 = fsr3 = fsr4 = 0;
}
