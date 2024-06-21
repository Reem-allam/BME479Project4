String returnProfiles(){

  if (fsr1 >= 700 && fsr2 == 0  && fsr3 == 0  && fsr4 == 0 ){
    return "Profile 5 (Walking on heel)";
    // fsr 1 > 700
  }else if (fsr1 == 0 && fsr2 >= 800  && fsr3 >= 600  && fsr4 >= 600 ){
    return "Profile 4 (Tiptoeing)";
    //fsr2 > 800, fsr 3 > 600, fsr 4 > 600
  }else if (fsr1 > 400 && fsr2 == 0  && fsr3 > 500  && fsr4 > 400 ){
      return "Profile 2 (In-toeing)";
      
  }
  else if (fsr1 >= 300 && fsr2 >= 500  && fsr3 == 0  && fsr4 >= 300 ){
      return "Profile 3 (Out-toeing)";
  }
  else{
    return "Profile 1 (Normal Gait)";
  }

}
