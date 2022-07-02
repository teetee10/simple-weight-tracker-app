import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/preference_provider.dart';
import 'loader.dart';
 

class FutureWrapper extends StatelessWidget {
  final futureName;
  final child;
  const FutureWrapper({Key? key, this.child, this.futureName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureName,
        builder: (ctx, authResultSnapshot) =>
            authResultSnapshot.connectionState == ConnectionState.waiting
                ? Spinkit()
                : child);
  }
}
