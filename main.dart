import 'dart:io';

import 'mortgage_calculator/mortgage_calculator.dart';
import 'compound_interest_calculator/compound_interest_calculator.dart';

void main() {
  print("\nWelcome to The Dart CLI Calculator App!\n");
  int choice = 0;
  while (choice != 3) {
    print("Please select an option:");
    print("1. Mortgage Calculator");
    print("2. Compound Interest Calculator");
    print("3. Exit");
    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("An error occurred: $e");
      exit(0);
    }

    switch (choice) {
      case 1:
        mortgageCalculator();
        break;
      case 2:
        compoundInterestCalculator();
      case 3:
        print("Farewell!");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
