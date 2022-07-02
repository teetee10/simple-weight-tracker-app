import 'package:flutter/foundation.dart';
import 'package:tracker/api/weight_api.dart';
import 'package:tracker/env_config.dart';

import 'user_api.dart';

class Api {
  static AuthApi authApi = UseAuthData();
  static WeightApi weightApi = UseWeightData();

  Api() {
    if (!EnvConfig.DEVELOPMENT) {
      authApi = UseAuthApi();
      weightApi = UseWeightApi();
    }
  }
}
