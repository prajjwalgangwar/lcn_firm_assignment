

mixin InputValidationMixin{
  bool isPasswordValid(password) => password.length > 6 ? true : false;

  bool isNameValid(name) => name.length > 2 ? true : false;

  bool isConfirmPasswordValid(password) => password.length > 6 ? true : false;

  bool isEmailValid(value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;
  }
}