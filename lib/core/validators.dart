
class Validators{

  static String? emailValidator(String? value){
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if(value!.isEmpty){
      return 'Email is required';
    } else if(!regex.hasMatch(value)){
      return 'Email is invalid';
    }
    return null;
  }

  static String? passwordValidator(String? value){
    if(value!.isEmpty){
      return 'Password is required';
    }
    return null;
  }

  static String? cantBeEmpty(String? value){
    if(value!.isEmpty){
      return 'This Field is required';
    }
    return null;
  }

  static String? letNull(String? value){
    return null;
  }
}