import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../constants/sizes.dart';
import '../../providers/auth.dart';
import '../../providers/weight.dart';
import '../../widgets/app_snackbar.dart';
import '../../widgets/buttons.dart';
import '../../widgets/inputs.dart';
import '../../widgets/pages_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = kDebugMode ? 'test@email.com' : '';
  String password = kDebugMode ? 'test' : '';

  TextEditingController textarea = TextEditingController();

  void clearInput() {
    setState(() {
      email = '';
      password = '';
    });
    textarea.clear();
  }

  void validate() {
    if (email == '' || password == '') {
      AppSnackBar('error', 'Please enter an email and password', context);
      return;
    }
    handleSubmit({'email': email, 'password': password});
  }

  void handleSubmit(payload) async {
    dynamic auth = Provider.of<AuthProvider>(context, listen: false);
    dynamic weight = Provider.of<WeightProvider>(context, listen: false);
    try {
      await auth.userSignIn(payload);
      await weight.fetchWeightHistory();
      clearInput();
    } catch (e) {
      AppSnackBar('error', e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PagesAppBar(title: 'Login'),
        body: Center(
            child: Form(
          child: ListView(padding: const EdgeInsets.all(kAppMargin), children: <Widget>[
            SimpleTextField(
              textEditingController: textarea,
              textInputType: TextInputType.emailAddress,
              labelText: 'Email',
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: kAppMargin),
            SimpleTextField(
              textEditingController: textarea,
              obscureText: true,
              labelText: 'Password',
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: kAppMargin),
            InkWell(
                child: const Text('Sign up', textAlign: TextAlign.right),
                onTap: () => Navigator.pushNamed(context, signupRoute)),
            const SizedBox(height: kAppMargin),
            SimpleElevatedButton(
              onPressed: () => validate(),
              child: const Text('Continue'),
            ),
          ]),
        )));
  }
}
