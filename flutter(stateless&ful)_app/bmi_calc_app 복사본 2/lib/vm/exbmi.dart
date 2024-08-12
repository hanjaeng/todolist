class ExBmi {
  late double height;
  late double weight;
  late String state;
  late double position;
  
  ExBmi.init();
  ExBmi(double height, double weight)
      : this.weight = weight,
        this.height = height;
        
  // Property
  double getBmi() {
    if (height > 100) {
      height = height * 0.01;
    }
    return double.parse((weight / (height * height)).toStringAsFixed(1));
  }

  (double, String, double) getResult(){
    (double, String, double) result = (getBmi() ,identifyBmi(getBmi()).$1, identifyBmi(getBmi()).$2);
    return result;
  }

  // Method
  double getBmiMethod(double height, double weight) {
    if (height > 100) {
      height = height * 0.01;
    }
    return double.parse((weight / (height * height)).toStringAsFixed(1));
  }

  identifyBmi(double bmi) {
    if (bmi < 23 && bmi >= 18.5) {
      state = "정상 체중";
      position = 105;
    } else if (bmi < 18.5) {
      state = "저체중";
      position = 25;
    } else if (bmi < 25 && bmi >= 23) {
      state = "과체중";
      position = 185;
    } else if (bmi < 30 && bmi >= 25) {
      state = "비만";
      position = 265;
    } else if (bmi >= 30) {
      state = "고도비만";
      position = 340;
    }
    // (String, int) result = (state, position);
    return (state, position);
  }
}
