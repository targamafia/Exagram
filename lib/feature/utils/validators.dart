String? validateFullName(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

String? validateEmailField(value) {
  var regExp = RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

String? validatePasswordConfirmation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}
