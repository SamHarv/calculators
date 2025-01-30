import 'dart:io';

import 'compound_interest_calculator_model.dart';

enum InvestmentFrequency { daily, weekly, fortnightly, monthly, annually }

void compoundInterestCalculator() {
  double initialInvestment = 0;
  double recurringInvestment = 0;
  InvestmentFrequency investmentFrequency = InvestmentFrequency.annually;
  int durationYears = 0;
  double annualInterestRate = 0;

  double totalInterestEarned = 0;
  double totalInvestment = 0;
  double totalValue = 0;
  CompoundInterestCalculator cic = CompoundInterestCalculator();

  print("\nWelcome to the Compound Interest Calculator!");

  // Input initial investment
  print("\nPlease enter the amount of your initial investment:");
  try {
    initialInvestment = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  print(
      "\nYour initial investment is: \$${initialInvestment.toStringAsFixed(2)}");

  // Input whether there is a recurring investment
  print("\nDo you intend to invest more at recurring intervals?:");
  print("1. Yes");
  print("2. No");
  int choice = 0;
  try {
    choice = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  switch (choice) {
    case 1:
      print("\nPlease enter the amount of your recurring investment:");
      try {
        recurringInvestment = double.parse(stdin.readLineSync()!);
      } catch (e) {
        print("An error occurred: $e");
        exit(0);
      }
      print(
          "\nYour recurring investment is: \$${recurringInvestment.toStringAsFixed(2)}");

      print("\nPlease select the frequency of your recurring investment:");
      print("1. Daily");
      print("2. Weekly");
      print("3. Fortnightly");
      print("4. Monthly");
      print("5. Annually");
      try {
        choice = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print("An error occurred: $e");
        exit(0);
      }
      switch (choice) {
        case 1:
          investmentFrequency = InvestmentFrequency.daily;
          break;
        case 2:
          investmentFrequency = InvestmentFrequency.weekly;
          break;
        case 3:
          investmentFrequency = InvestmentFrequency.fortnightly;
          break;
        case 4:
          investmentFrequency = InvestmentFrequency.monthly;
          break;
        case 5:
          investmentFrequency = InvestmentFrequency.annually;
          break;
        default:
          print("Invalid choice. Please try again.");
      }
      print(
          "\nYour recurring investment frequency is ${investmentFrequency.name}");
      break;
    case 2:
      print("\nYou have chosen not to make recurring investments.");
      break;
    default:
      print("Invalid choice. Please try again.");
  }

  // Input investment duration
  print("\nPlease enter the duration of your investment in years:");
  try {
    durationYears = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  print("\nYour investment duration is: $durationYears years");

  // Input annual interest rate
  print("\nPlease enter the annual interest rate you expect to average (%):");
  try {
    annualInterestRate = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print("An error occurred: $e");
    exit(0);
  }
  print("\nYour annual interest rate is: $annualInterestRate%");

  print("\nCalculating...");
  print("\n======================================================\n");

  // Calculate total investment
  totalInvestment = cic.calculateTotalInvestment(initialInvestment,
      recurringInvestment, investmentFrequency, durationYears);

  // Calculate total value
  switch (investmentFrequency) {
    case InvestmentFrequency.daily:
      totalValue = cic.dailyFrequencyTotalValue(initialInvestment,
          recurringInvestment, durationYears, annualInterestRate);
      break;
    case InvestmentFrequency.weekly:
      totalValue = cic.weeklyFrequencyTotalValue(initialInvestment,
          recurringInvestment, durationYears, annualInterestRate);
      break;
    case InvestmentFrequency.fortnightly:
      totalValue = cic.fortnightlyFrequencyTotalValue(initialInvestment,
          recurringInvestment, durationYears, annualInterestRate);
      break;
    case InvestmentFrequency.monthly:
      totalValue = cic.monthlyFrequencyTotalValue(initialInvestment,
          recurringInvestment, durationYears, annualInterestRate);
      break;
    case InvestmentFrequency.annually:
      totalValue = cic.annualFrequencyTotalValue(initialInvestment,
          recurringInvestment, durationYears, annualInterestRate);
      break;
  }

  totalInterestEarned =
      cic.calculateTotalInterestEarned(totalInvestment, totalValue);

  // Output results
  print("\n======================================================");
  print(
      "You invested a total of \$${(totalInvestment).toStringAsFixed(2)} over $durationYears years.");
  print("The total amount saved is \$${(totalValue).toStringAsFixed(2)}");
  print(
      "You earned \$${(totalInterestEarned).toStringAsFixed(2)} on interest alone");
  print("======================================================\n");
}
