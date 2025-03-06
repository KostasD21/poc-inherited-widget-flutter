import 'package:get/get.dart';
import 'package:flutter_poc_inherited_widget/travel_period.dart';

class HomeController extends GetxController {
  // Observable variables with .obs
  var totalAmount = 0.obs;
  var currentTravel = Rx<TravelPeriod?>(TravelPeriod(1, 'London', 'GBP', 'Active'));

  // Methods to update state
  void addExpense(int amount) {
    totalAmount.value += amount;
  }

  void deleteCurrentTravel() {
    currentTravel.value = null;
  }
} 