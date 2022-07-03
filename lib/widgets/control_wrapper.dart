import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../providers/auth_provider.dart';
import '../providers/provider.dart';
import 'loader.dart';

class ControlWrapper<T extends AppProvider> extends StatelessWidget {
  final child;
  const ControlWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (ctx, T arg, __) {
      return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(children: [
            child,
            if (arg.appState == AppState.isFetching) Spinkit(),
          ]));
    });
  }
}
