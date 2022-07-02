import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/auth_provider.dart';
import '../providers/provider.dart';
import 'loader.dart';

class AppWrapper<T extends AuthProvider> extends StatelessWidget {
  final child;
  const AppWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (ctx, T arg, __) { 
      if (arg.isAuthenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(ctx).pushNamedAndRemoveUntil(addWeightRoute, (route) => false);
        });
      } 
      if (arg.appState == AppState.loading) {
        return Spinkit();
      } else {
        return child;
      }
    });
  }
}
