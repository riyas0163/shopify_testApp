

class TPlatformException implements Exception{

  final String code;


  TPlatformException(this.code);

  String get message{
    switch(code){
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.Please double-check your information';
      case 'Too-many-requests':
        return 'Too many requests.Please try again later';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect pasword.please try again';
      case 'Invalid-phone-number' :
        return 'The provided phone number is invalid';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired.Please signin in again';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user';
      case 'sign-in-failed':
        return 'Sign-in failed.Please try again';
      case 'network-request-failed' :
        return 'Network request failed.Please check your internet connection';
      default:
        return 'An unexpected firebase error occurred.Please try again';
    }
  }
}