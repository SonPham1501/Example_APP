import 'environment.dart';

void main() => Development();

class Development extends Environment {
  @override
  final String APP_NAME = "YoFun Dev";

  // @override
  // final String BASE_URL = 'https://api.classfun.vn/api/';
  @override
  final String BASE_URL = 'http://10.0.2.2:5001/api/';
  @override
  final String SSO_BASE_URL = 'https://sso.eviedu.vn/api/auth/';
  // @override
  // final String GRAPHQL_ENDPOINT = 'https://graph.classfun.vn/api/graphql';
  @override
  final String GRAPHQL_ENDPOINT = 'http://10.0.2.2:5000/api/graphql';
  @override
  EnvType environmentType = EnvType.DEVELOPMENT;
}
