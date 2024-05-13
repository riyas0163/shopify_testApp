

class TFirebaseExceptions implements Exception{

  final String code;


  TFirebaseExceptions(this.code);

  String get message{
    switch(code){
      case 'Unknown':
        return 'An unknown Firebase error occurred.Please try again';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect.Please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience';
      case 'user-disabled':
        return 'This user account has been disabled.Please contact support for assistance';
      case 'user-not-found' :
        return 'Invalid login details.user not found';
      case 'wrong-password':
        return 'Incorrect password.Please check your password and try again';
      case 'invalid-verification-code':
        return 'Invalid verification ID, please request a new verification code';
      case 'quota-exceeded':
        return 'Quota exceeded.Please try again later';
      case 'email-already-exists':
        return 'The email address already exists.Please use a different email';
      case 'provider-already-linked' :
        return 'The account is already linked with another provider';
      default:
        return 'An unexpected firebase error occured.Please try again';
    }
  }
}