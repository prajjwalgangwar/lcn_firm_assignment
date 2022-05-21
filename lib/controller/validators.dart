

mixin InputValidationMixin{
  bool isPasswordValid(password) => password.length>6 ? true : false;

  bool isNameValid(name) => name.length > 2 ? true : false;

  bool isConfirmPasswordValid(password) => password.length > 6 ? true : false;

  // bool isEmailValid(String email) {
  //   Pattern pattern =
  //       r '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = new RegExp(pattern);
  //   return regex.hasMatch(email);
  // }
}