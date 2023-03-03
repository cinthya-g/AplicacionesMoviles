// después de instalar provider en terminal, se crea una nueva carpeta para los providers
// y un nuevo archivo para cada provider

import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  // creación de radiobuttons
  var costController = TextEditingController();
  var radioGroupValues = {
    0: 'Amazing 20%',
    1: 'Good 18%',
    2: 'Ok 15%',
  };
  var tipAmount = 0.0;

  // switch
  bool isSelected = false;
  // radio
  int selectedRadio = 0;

  // Crear métodos publicos: sin guion bajo al inicio
  void tipCalculation() {
    // obtener el valor del textfield
    var cost = costController.text;
    if (cost != '') {
      // Convertir a double
      var costDouble = double.parse(cost);
      // obtener el valor del radio seleccionado
      switch (selectedRadio) {
        case 0:
          tipAmount = costDouble * 0.2;
          break;
        case 1:
          tipAmount = costDouble * 0.18;
          break;
        case 2:
          tipAmount = costDouble * 0.15;
          break;
        default:
          tipAmount = 0.0;
      }
      // checar round tip switch
      if (isSelected) {
        tipAmount = tipAmount.ceilToDouble();
      }
      // notificar a los listeners
      notifyListeners();
    }
  }

  void setSelectedRadio(int radioValue) {
    selectedRadio = radioValue;
    notifyListeners();
    print("seleccionaste el radio ${selectedRadio}");
  }

  void setIsSelected(bool switchValue) {
    isSelected = switchValue;
    notifyListeners();
  }
}
