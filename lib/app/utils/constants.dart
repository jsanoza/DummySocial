class EndPoints {
  const EndPoints._();

  static const String baseUrl = 'https://dummyapi.io/data/v1/';
  static const String login = "auth/login";
  static const String user = "user";
  static const String post = "post";
  static const String tag = "tag";

  static const Duration timeout = Duration(seconds: 30);

  static const String token = 'authToken';

  static const headers = {"app-id": "642fd0b07317c3ddfa4de127"};
}

enum LoadDataState { initialize, loading, loaded, error, timeout, unknownerror }
