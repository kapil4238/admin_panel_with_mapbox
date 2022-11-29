abstract class Routes {
  static const home = _Paths.home;
  static const map = _Paths.home + _Paths.map;
  static const login = _Paths.login;
  static const error = _Paths.error;
  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const home = '/home';
  static const login = '/login';
  static const map = '/map';
  static const error = '/error';
}
