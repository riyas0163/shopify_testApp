class Tvalidator{
  /// empty text validation
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return "$fieldName is required";
    }

    return null;
  }



  static String? validateemail(String? value){
    if(value== null || value.isEmpty){
      return "Email is required";
    }

    //regular expression for email validation
   // final emailRegExp = RegExp(r'^[\w-\.]+@([\w-)+\.)+[\w-]{2,4}$)');

     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


    if(!emailRegex.hasMatch(value)){
      return "invalid email address";
    }
    return null;
  }


  static String? validatepassword(String? value ){
    if(value == null || value.isEmpty){
      return "password is required";
    }

    //check for minimum password length
    if(value.length<6){
      return "password must be at least 6 characters long";
    }

    //check for uppercase letters
    if(value.contains(RegExp(r'[A - Z]'))){
      return "password must be contain at least one uppercase letter";
    }

    //check for numbers
    if(!value.contains(RegExp(r'[0-9]'))){
      return "password must contain at least one number";
    }

    //check for special characters

    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}<>]'))){
      return "password must contain one special character";
    }
    return null;
  }

  static String? validatephonenumber(String? value){
    if(value == null ||value.isEmpty){
      return "Phone number is required";
    }

    //regular experssion for phone number validation(assuming a 10-digit us phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if(!phoneRegExp.hasMatch(value)){
      return "Invalid phone number format (10 digits required)";
    }
    return null;
    }
}




























