import 'environment.dart';

void main() => Production();

class Production extends Environment {
  final String appName = "Classfun";
  @override
  final String BASE_URL = 'https://api.classfun.vn/api/';
  @override
  final String SSO_BASE_URL = 'https://sso.eviedu.vn/api/auth/';
  @override
  final String GRAPHQL_ENDPOINT = 'https://graph.classfun.vn/api/graphql';

  @override
  EnvType environmentType = EnvType.PRODUCTION;
}
