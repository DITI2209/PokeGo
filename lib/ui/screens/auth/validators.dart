class Validator {
  static String? validateName({required String? name}) {
    RegExp nameRegExp = RegExp(r"^[a-zA-Z,.\-]+$");
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    } else if (!nameRegExp.hasMatch(name)) {
      return "Name must contain alphabets only";
    } else
      return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePhone({required String? phone}) {
    if (phone == null) {
      return null;
    }
    RegExp phoneRegExp = RegExp(r"^[0-9]*$");

    if (phone.isEmpty) {
      return "Phone No  is required";
    } else if (!phoneRegExp.hasMatch(phone)) {
      return "Number must contain digits only";
    } else if (phone.length != 10) {
      return "Number must contain 10 digits";
    } else {
      return null;
    }
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }
    return null;
  }
}
