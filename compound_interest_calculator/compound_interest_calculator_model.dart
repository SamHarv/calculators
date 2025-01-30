import 'compound_interest_calculator.dart';

class CompoundInterestCalculator {
  double calculateTotalInvestment(
      double initialInvestment,
      double recurringInvestment,
      InvestmentFrequency investmentFrequency,
      int durationYears) {
    int duration = 0;
    switch (investmentFrequency) {
      case InvestmentFrequency.daily:
        duration = durationYears * 365;
        return initialInvestment + (recurringInvestment * duration);
      case InvestmentFrequency.weekly:
        duration = durationYears * 52;
        return initialInvestment + (recurringInvestment * duration);
      case InvestmentFrequency.fortnightly:
        duration = durationYears * 26;
        return initialInvestment + (recurringInvestment * duration);
      case InvestmentFrequency.monthly:
        duration = durationYears * 12;
        return initialInvestment + (recurringInvestment * duration);
      case InvestmentFrequency.annually:
        duration = durationYears;
        return initialInvestment + (recurringInvestment * duration);
    }
  }

  double calculateTotalInterestEarned(
      double totalInvestment, double totalValue) {
    return totalValue - totalInvestment;
  }

  // If investmentFrequency is annual
  double annualFrequencyTotalValue(double initialInvestment,
      double recurringInvestment, int duration, double annualInterestRate) {
    double interestRate = annualInterestRate / 100;
    double total = initialInvestment;
    for (int i = 1; i < duration + 1; i++) {
      total = (total + (total * interestRate)) + recurringInvestment;
      print("Year $i: \$${total.toStringAsFixed(2)}");
    }
    return total;
  }

  // If investmentFrequency is monthly
  double monthlyFrequencyTotalValue(double initialInvestment,
      double recurringInvestment, int duration, double annualInterestRate) {
    double interestRate = annualInterestRate / 100;
    double total = initialInvestment;
    for (int i = 1; i < duration + 1; i++) {
      total = total + (total * interestRate);
      for (int j = 1; j < 13; j++) {
        total = total + recurringInvestment;
      }
      print("Year $i: \$${total.toStringAsFixed(2)}");
    }
    return total;
  }

  // If investmentFrequency is fortnightly
  double fortnightlyFrequencyTotalValue(double initialInvestment,
      double recurringInvestment, int duration, double annualInterestRate) {
    double interestRate = annualInterestRate / 100;
    double total = initialInvestment;
    for (int i = 1; i < duration + 1; i++) {
      total = total + (total * interestRate);
      for (int j = 1; j < 27; j++) {
        total = total + recurringInvestment;
      }
      print("Year $i: \$${total.toStringAsFixed(2)}");
    }
    return total;
  }

  // If investmentFrequency is weekly
  double weeklyFrequencyTotalValue(double initialInvestment,
      double recurringInvestment, int duration, double annualInterestRate) {
    double interestRate = annualInterestRate / 100;
    double total = initialInvestment;
    for (int i = 1; i < duration + 1; i++) {
      total = total + (total * interestRate);
      for (int j = 1; j < 53; j++) {
        total = total + recurringInvestment;
      }
      print("Year $i: \$${total.toStringAsFixed(2)}");
    }
    return total;
  }

  // If investmentFrequency is daily
  double dailyFrequencyTotalValue(double initialInvestment,
      double recurringInvestment, int duration, double annualInterestRate) {
    double interestRate = annualInterestRate / 100;
    double total = initialInvestment;
    for (int i = 1; i < duration + 1; i++) {
      total = total + (total * interestRate);
      for (int j = 1; j < 366; j++) {
        total = total + recurringInvestment;
      }
      print("Year $i: \$${total.toStringAsFixed(2)}");
    }
    return total;
  }
}
