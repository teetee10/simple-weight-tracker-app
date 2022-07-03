import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/pages/home_screen.dart';
import 'package:tracker/providers/auth_provider.dart';
import 'package:tracker/providers/weight_provider.dart';
import 'package:tracker/router.dart';
import 'package:tracker/widgets/auth_wrapper.dart';

import 'api/api.dart';
import 'providers/preference_provider.dart';
import 'transforms/init_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStore.init();
  Api();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PreferenceProvider()),
    ChangeNotifierProvider(
        create: (_) => AuthProvider(storage: AppStore(), api: Api.authApi)),
    ChangeNotifierProvider(create: (_) => WeightProvider(api: Api.weightApi)),
  ], child: const AuthWrapper<AuthProvider>(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        title: 'Weight Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Welcome'));
  }
}
