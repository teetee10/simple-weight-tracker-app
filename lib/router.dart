import 'package:flutter/material.dart';
import 'package:tracker/pages/auth/login.dart';
import 'package:tracker/pages/auth/signup.dart';
import 'package:tracker/pages/ui.dart';
import 'package:tracker/pages/weight/add_weight.dart'; 

import 'constants/routes.dart';
import 'pages/weight/weight_history.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/ui':
        return MaterialPageRoute(builder: (_) => UiScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case addWeightRoute:
        return MaterialPageRoute(builder: (_) => AddWeightScreen());
      case weightHistoryRoute:
        return MaterialPageRoute(builder: (_) => WeightHistoryScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
