import 'dart:io';

import 'mortgage_calculator_model.dart';

void mortgageCalculator() {
  double purchasePrice = 0; // Price of the house
  double startingBalance = 0; // Money saved to put towards the house
  double interestRate = 0;
  int loanTerm = 0; // Loan term in years
  int totalNumberWeeklyPayments = 0; // Total number of weekly payments
  double stampDuty = 0; // Stamp duty (land transfer tax)
  double fundsNeeded = 0; // Funds needed to purchase the house
  double weeklyPayment = 0; // Weekly repayment amount
  MortgageCalculator mc = MortgageCalculator(); // The brain

  print("\nWelcome to the Mortgage Calculator!");

  // Input house purchase price
  print("\nPlease enter the price of the house you wish to purchase:");
  try {
    purchasePrice = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  print("\nThe price of the house is: \$${purchasePrice.toStringAsFixed(2)}");

  // Calculate stamp duty
  try {
    stampDuty = mc.calculateStampDuty(purchasePrice);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  print("\nYour stamp duty is: \$${stampDuty.toStringAsFixed(2)}");

  // Get funds ready to spend
  print("\nPlease enter the amount of money you have saved to put towards the "
      "house before borrowing:");
  try {
    startingBalance = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }

  // Calculate funds needed
  fundsNeeded =
      mc.calculateFundsNeeded(startingBalance, purchasePrice, stampDuty);

  print("\nYou have \$${startingBalance.toStringAsFixed(2)} saved to put "
      "towards the house.\n\nYou need to borrow \$${fundsNeeded.toStringAsFixed(2)} to "
      "purchase the house.");

  // Get interest rate
  print("\nPlease enter the interest rate (%):");
  try {
    interestRate = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }

  // Get loan term
  print("\nPlease enter the loan term in years:");
  try {
    loanTerm = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }

  print("\nYou entered an interest rate of ${interestRate}% and a loan term of "
      "${loanTerm} years.");

  // Calculate total number of weekly payments
  totalNumberWeeklyPayments = mc.calculateNumberWeeklyPayments(loanTerm);

  print("\nYou will make a total of ${totalNumberWeeklyPayments} weekly "
      "payments over the loan term.");

  // Caclulate weekly payment results
  weeklyPayment = mc.calculateWeeklyPayment(
      fundsNeeded, interestRate, totalNumberWeeklyPayments);

  // Output results
  print("\n=========================================================");
  print(
      "Your annual repayment is: \$${(weeklyPayment * 52).toStringAsFixed(2)}");
  print(
      "Your monthly repayment is: \$${(weeklyPayment * 52 / 12).toStringAsFixed(2)}");
  print(
      "Your fortnightly repayment is: \$${(weeklyPayment * 2).toStringAsFixed(2)}");
  print("Your weekly repayment is: \$${weeklyPayment.toStringAsFixed(2)}");
  print(
      "Your total repayment over the loan term is: \$${(weeklyPayment * totalNumberWeeklyPayments).toStringAsFixed(2)}");
  print("=========================================================\n");
}
