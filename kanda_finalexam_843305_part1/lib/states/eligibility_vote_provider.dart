import 'package:flutter/material.dart';

class EligibilityVoteProvider extends ChangeNotifier {
  String _eligibilityMessage = "";
  bool _isEligible = false;

  void checkEligibility(int age) {
    if (age >= 18) {
      _eligibilityMessage = "You are eligible to vote";
      _isEligible = true;
    } else {
      _eligibilityMessage = "You are not eligible to apply for Driving License";
      _isEligible = false;
    }
    // call this whenever there is some change in any field of change notifier
    //notifyListeners();
  }

  // Getter for Eligibility messaage
  String get eligibilityMessage => _eligibilityMessage;

  // Getter for Eligibility flag
  bool get isEligible => _isEligible;
}