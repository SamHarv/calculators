import 'dart:io';

import 'mortgage_calculator/mortgage_calculator.dart';
import 'compound_interest_calculator/compound_interest_calculator.dart';

void main() {
  print("\nWelcome to The Dart CLI Calculator App!\n");
  int choice = 0;
  // Application loop
  while (choice != 3) {
    print("Please enter a number to select an option:");
    print("1. Mortgage Calculator");
    print("2. Compound Interest Calculator");
    print("3. Exit");
    try {
      // Get user input
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("An error occurred: $e");
    }

    switch (choice) {
      case 1:
        // Run the mortgage calculator
        mortgageCalculator();
        break;
      case 2:
        // Run the compound interest calculator
        compoundInterestCalculator();
      case 3:
        // Exit the application
        print("\nFarewell!\n");
        break;
      default:
        print("Invalid choice. Please enter a number between 1 and 3.");
    }
  }
}
