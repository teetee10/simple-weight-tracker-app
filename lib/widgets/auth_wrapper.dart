import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../providers/auth.dart';
import 'control_wrapper.dart';

class AuthWrapper<T extends AuthProvider> extends StatelessWidget {
  final child;
  const AuthWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (ctx, T arg, __) {
      if (arg.isAuthenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(ctx).pushNamedAndRemoveUntil(addWeightRoute, (route) => false);
        });
      }

      return ControlWrapper<T>(child: child);
    });
  }
}
