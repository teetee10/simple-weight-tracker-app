import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/constants.dart';
import 'package:tracker/providers/auth_provider.dart';
import 'package:tracker/providers/weight_provider.dart';
import 'package:tracker/router.dart';
import 'package:tracker/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => WeightProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
      title: 'Weight Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome')
    );
  }
}
