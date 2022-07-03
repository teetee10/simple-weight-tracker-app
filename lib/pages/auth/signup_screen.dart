import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/constants.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/app_snackbar.dart';

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

  Map<String, dynamic>? getValidated() {
    if (email == '' || password == '' || name == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter an email and password'),
      ));
    }
    return {'email': email, 'password': password, 'name': name};
  }

  void handleSubmit() async {
    try {
      final payload = getValidated();
      await auth.userSignup(payload);
      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => true);
    } catch (e) {
      AppSnackBar('error', e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Center(
        child: Form(
            child: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
          TextField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextField(
            controller: textarea,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(height: 20),
          InkWell(
              child: const Text('Already signed up?', textAlign: TextAlign.right),
              onTap: () => Navigator.pushNamed(context, loginRoute)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => handleSubmit(),
            child: const Text('Continue'),
          ),
        ])),
      ),
    );
  }
}
