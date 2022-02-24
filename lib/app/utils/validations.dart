bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String standardizePhoneNumber(String value) {
  if (value.isEmpty || value.length < 9) return '';
  if (value.length == 9 && !value.startsWith('0')) {
    return '+84$value';
  }
  if (value.startsWith('0') && value.length == 10) {
    return '+84${value.substring(1)}';
  }
  if (value.startsWith('84') && value.length == 11) {
    return '+$value';
  }
  if (value.startsWith('+84') && value.length == 12) {
    return value;
  }
  return '';
}

bool verifyPassword(String password, String confirmPassword, [int minLength = 6]) {
  if (password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  // bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;
  bool match = password == confirmPassword;

  return hasDigits & (hasUppercase | hasLowercase) & hasMinLength & match;
}
