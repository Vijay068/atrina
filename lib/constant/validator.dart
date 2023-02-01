import 'package:flutter/material.dart';

String? emailValidator(email) {
  if (email.isEmpty) {
    return "Email ID can't be empty";
  }
  String p = "[a-zA-Z0-9\.]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = RegExp(p);
  if (!regExp.hasMatch(email)) {
    return 'Email Id is not valid';
  }
  return null;
}

String? phoneNoValidator(value) {
  if (value.isEmpty) {
    return "Mobile No can't be empty";
  }
  String p = "^([6-9]{1})([0-9]{9})";
  RegExp regExp = RegExp(p);
  if (!regExp.hasMatch(value)) {
    return 'Mobile No is not valid';
  }
  return null;
}

String? Validator(value) {
  if (value!.isEmpty) {
    return 'Please complete a Field';
  }
  return null;
}

String? passwordValidator(value) {
  bool isValidPassword = isPasswordCompliant(value!);
  if (!isValidPassword) {
    return "Please enter  Valid Password";
  }

  return null;
}

bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password.length < minLength) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  if (hasUppercase) {
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    if (hasDigits) {
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      if (hasLowercase) {
        bool hasSpecialCharacters =
            password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        return hasSpecialCharacters;
      }
    }
  }

  return false;
}
