import 'package:flutter/material.dart';
import 'package:tracker/constants/routes.dart';

import '../widgets/auth_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/pages_app_bar.dart';
import '../constants/typography.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
        child: Scaffold(
            appBar: PagesAppBar(title: widget.title),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('A simple weight tracker', style: bodyTextStyle),
                  const SizedBox(height: 30),
                  SimpleElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, loginRoute),
                    child: const Text('Continue'),
                  ),
                ],
              ),
            )));
  }
}
