// Float lists to store sensor values for the graphs


FloatList x1 = new FloatList();
FloatList y1 = new FloatList();
FloatList x2 = new FloatList();
FloatList y2 = new FloatList();
FloatList x3 = new FloatList();
FloatList y3 = new FloatList();
FloatList x4 = new FloatList();
FloatList y4 = new FloatList();


XYChart returnGraph (FloatList x, FloatList y){
  
  XYChart scatterPlot = new XYChart(this);
  scatterPlot.setMinY(0); // Set minimum y-value
  scatterPlot.setMaxY(1000); // Set maximum y-value
  scatterPlot.showXAxis(true); // Show x-axis
  scatterPlot.showYAxis(true); // Show y-axis
  scatterPlot.setXFormat("0"); // Format for x-axis labels
  scatterPlot.setYFormat("0"); // Format for y-axis labels
  scatterPlot.setPointSize(5); // Set point size


  
  float[] xVal = x.array();
  float[] yVal = y.array();
  
  scatterPlot.setData(xVal, yVal); // Set data for scatter plot
  
  return scatterPlot;
} 


void screenSetUp(){
  
  
  XYChart sensor1 = returnGraph(x1,y1);
  XYChart sensor2 = returnGraph(x2,y2);
  XYChart sensor3= returnGraph(x3,y3);
  XYChart sensor4 = returnGraph(x4,y4);
  
  fill(200);
   text("FSR 1 (HEEL)", 830,130);
   rect(700, 150, width/6 +100, height/6 +120);
   sensor1.draw(700, 150, width/6 +100, height/6 +100); // Draw the scatter plot

   text("FSR 2 (LF)", 1230,130);
   rect(1100, 150, width/6 +100, height/6 +120);
   sensor2.draw(1100, 150, width/6 +100, height/6 +100); // Draw the scatter plot
   
  text("FSR 3 (MM)", 830,478);
   rect(700, 500, width/6 +100, height/6 +120);
   sensor3.draw(700,500, width/6 +100, height/6 +100);
  
   text("FSR 4 (MF)",1230,478);
   rect(1100, 500, width/6 +100, height/6 +120);
   sensor4.draw(1100,500, width/6 +100, height/6 +100);
   int newWidth = logoImage.width * 2;  // Double the image's width
   int newHeight = logoImage.height * 2; // Double the image's height
  
   image(logoImage, 200, 150, newWidth-100 , newHeight-200);
   fill (255);
   text("Your Gait Profile: " +returnProfiles(), 300, 800);

   
   noStroke();

  // Set the fill color and draw circle 1
  
  fill(heatMapColor(fsr1));
  ellipse(300, 680, 60,60);

  // Set the fill color and draw circle 2
  fill(heatMapColor(fsr2));
  ellipse(380, 350, 60, 60);

  // Set the fill color and draw circle 3
   fill(heatMapColor(fsr3));
  ellipse(260, 350, 60, 60);

  // Set the fill color and draw circle 4
   fill(heatMapColor(fsr4));
  ellipse(315, 240, 60, 60);
  
  
}
