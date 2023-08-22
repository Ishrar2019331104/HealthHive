class UserValidation {

  // implement authentication logic here

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }
    return null;
  }
  static String? validatePasswordMatch(String password, String repeatPassword) {
    if (password != repeatPassword) {
      return 'Passwords do not match';
    }
    return null;
  }



}
