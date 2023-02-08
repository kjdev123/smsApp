String? validateEmail(String value) {
  String? _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (value.isEmpty) {
    _msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid email address";
  }
  return _msg;
}

String? validatePassword(String password, String confirmPassword) {
  String? _msg;

  if(confirmPassword.isEmpty) {
    _msg = "Confirm password is required";
  } else if(password != confirmPassword) {
    _msg = "Password and confirm password does not match";
  }

  return _msg;
}
