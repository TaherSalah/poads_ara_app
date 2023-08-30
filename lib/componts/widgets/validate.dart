///////////  Start Validator class /////////////
class Validator {
  //////  Start Validator Email ///////
  static String? email(String? value) {
    if (value!.isEmpty) {
      // return 'من فضلك قم باذخال الايميل الالكتروني المسجل بالفعل';
      return 'Please enter the email address already registered';
    } else if (!value.contains('@') || !value.contains('.com')) {
      return 'EX: example@example.com ';
    } else {
      return null;
    }
  }
  //////  End Validator Email ///////

  //////  Start Validator Password ///////

  static String? password(String? value) {
    if (value!.isEmpty) {
      // return 'Please enter your password';
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 digit';
    } else {
      return null;
    }
  }
  //////  End Validator Password ///////

  //////  Start Validator Title ///////
  static String? name(String? value) {
    if (value!.isEmpty) {
      // return 'من فضلك قم باذخال اسم المستخدم';
      return 'Please enter your username';
    } else if (value.length < 8) {
      // return 'يجب ان يتكون اسم المستخدم علي 8 حروف علي الاقل';
      return 'The user name must contain at least 8 characters';
    } else {
      return null;
    }
    //////  End Validator Title ///////
  }

  //////  Start Validator Time ///////
  static String? time(String? value) {
    if (value!.isEmpty) {
      return 'Time Empty!';
    } else if (value.length <= 2) {
      return 'Time invalid';
    } else {
      return null;
    }
  }
  //////  End Validator Time ///////
  //////  Start Validator phone ///////
  static String? mobilePhone(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    // ignore: prefer_is_empty
    if (value!.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
  //////  End Validator phone ///////
  //////  Start Validator Date ///////
  static String? date(String? value) {
    if (value!.isEmpty) {
      return 'Date Empty!';
    } else if (value.length <= 2) {
      return 'Date invalid';
    } else {
      return null;
    }

  }
//////  End Validator Date ///////

// static String? confirmPassword(String? value) {
//   if (value!.isEmpty) {
//     return 'Invalid Confirm!';
//   } else if (LoginController().password !=LoginController().confirm) {
//     return 'please enter match password';
//   } else {
//     return null;
//   }
// }




  static String? phone(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك قم باذخال رقم التليفون';
    } else if (value.length < 6) {
      return 'يجب ان يكون  رقم التليفون مكون من 11 رقم';
    } else {
      return null;
    }
  }

}
///////////  End Validator class /////////////
