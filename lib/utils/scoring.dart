String score(int result, int temp, int journey, int severity, int history) {
  //temperature is low
  if (temp == 1) {
    if (result == 0 && severity == 0 && history < 2) {
      return "low";
    }
    if (result == 1 && severity == 1 && history < 2) {
      return "low";
    }
    if (result <= 3 && severity == 1 && journey == 0) {
      return "medium";
    }
    if (result == 0 && severity == 0 && journey > 2) {
      return "medium";
    }
  }
  //temperature is fever
  if (temp == 2) {
    if (result <= 3 && severity == 1 && journey == 0) {
      return "medium";
    }
    if (result < 3 && severity == 2 && journey == 0) {
      return "medium";
    }
    if (result >= 3 && severity == 2 && journey > 2) {
      return "high";
    }
  }
  //temperature is high fever
  if (temp == 3) {
   if (result <= 3 && severity == 1 && journey == 0) {
      return "medium";
    }
    if (result < 3 && severity == 2 && journey == 0) {
      return "medium";
    }
    if (result >= 3 && severity == 2 && journey > 2) {
      return "high";
    }
    }

}
