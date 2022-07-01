import 'package:flutter/foundation.dart';
import 'package:tracker/api/weight_api.dart';

import 'user_api.dart';

class Api {
  static AuthApi authApi = UseAuthData();
  static WeightApi weightApi = UseWeightData();

  Api() {
    if (kReleaseMode) {
      authApi = UseAuthApi();
      weightApi = UseWeightApi();
    }
  }
}
