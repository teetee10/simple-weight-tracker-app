import 'package:tracker/api/wieght.dart';
import 'package:tracker/env_config.dart';

import 'index.dart';

class Api {
  static Auth authApi = AuthData();
  static WeightApi weightApi = UseWeightData();

  Api.init() {
    if (!EnvConfig.DEVELOPMENT) {
      authApi = AuthApi();
      weightApi = UseWeightApi();
    }
  }
}
