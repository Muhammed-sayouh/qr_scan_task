import 'constants.dart';

class Validations {
  static String? validationrequiredField(String val) {
    if (val.isEmpty) {
      return Constants.requiredField;
    }
    {
      return null;
    }
  }

  static String? validationEmail(String val) {
    if (val.isEmpty) {
      return Constants.requiredField;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return Constants.writeCorrectEmail;
    }
    {
      return null;
    }
  }

  static String? validationPassword(String val) {
    if (val.isEmpty) {
      return Constants.requiredField;
    } else if (val.length < 5) {
      return Constants.shortPassword;
    }
    {
      return null;
    }
  }
}
