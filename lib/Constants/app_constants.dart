abstract class AppConstants {
  ///response values
  static const unauthorized = 'UnAuthorized';
  static const String socketException = 'SocketException';
  static const String serverException = 'ServerException';
  static const String timeOutException = 'TimeOutException';

  ///data state
  static String initial = 'initial';
  static String loading = 'loading';
  static String loaded = 'loaded';

  ///urls
  static const String _baseUrl = 'https://doit-f3hb.onrender.com/api';

  ///Auth
  static const String logIn = '$_baseUrl/User';
  static const String signUp = '$_baseUrl/Users';
}