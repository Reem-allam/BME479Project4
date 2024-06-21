int heatMapColor(float fsr){
  
  int x = int(fsr);
  if (x<10){return #FCFCFC;}
  else if(x>=10 && x<200){return #6992E8; }
  else if (x>= 200 && x<=400){return #F47911; }
  else if (x>400 && x<700){return #E52323;}  
  else {return #980000;}
  
}
