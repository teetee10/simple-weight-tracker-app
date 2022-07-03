import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/constants/routes.dart';

import '../../constants/sizes.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_snackbar.dart';
import '../../widgets/buttons.dart';
import '../../widgets/inputs.dart';
import '../../widgets/pages_app_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = 'test@email.com';
  String password = 'test';
  String name = 'test';
  dynamic auth;
  TextEditingController textarea = TextEditingController();

  @override
  void initState() {
    textarea.text = email;
    auth = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  void logout() async {
    await auth.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false);
  }

  void validate() {
    if (email == '' || password == '' || name == '') {
      AppSnackBar('error', 'Please enter an email and password', context);
      return;
    }
    handleSubmit({'email': email, 'password': password, 'name': name});
  }

  void handleSubmit(payload) async {
    try {
      await auth.userSignup(payload);
      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => true);
    } catch (e) {
      AppSnackBar('error', e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PagesAppBar(title: 'Sign up'),
      body: Center(
        child: Form(
            child: ListView(padding: const EdgeInsets.all(kAppMargin), children: <Widget>[
          SimpleTextField(
            textInputType: TextInputType.name,
            labelText: 'Name',
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          const SizedBox(height: kAppMargin),
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
              child: const Text('Already signed up?', textAlign: TextAlign.right),
              onTap: () => Navigator.pushNamed(context, loginRoute)),
          const SizedBox(height: kAppMargin),
          SimpleElevatedButton(
            onPressed: () => validate(),
            child: const Text('Continue'),
          ),
        ])),
      ),
    );
  }
}
