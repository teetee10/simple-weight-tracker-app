import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/auth_provider.dart';
import '../../providers/weight_provider.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  String weight = '';
  TextEditingController textarea = TextEditingController();
  WeightProvider? userWeight;
  AuthProvider? userAuth;

  @override
  void initState() {
    userWeight = Provider.of<WeightProvider>(context, listen: false);
    userAuth = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  void logout() async {
    await userAuth?.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false);
  }

  Map<String, dynamic>? getValidated() {
    if (weight == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a weight'),
      ));
    }

    final time = DateTime.now().toString();
    return {"weight": weight, "time": time};
  }

  void handleSubmit() async {
    try {
      textarea.clear();
      final payload = getValidated();
      await userWeight?.addToWeightHistory(payload);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Added weight'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Weight'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.list,
                  semanticLabel: 'View History',
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushNamed(context, weightHistoryRoute)),
            IconButton(
                icon: const Icon(
                  Icons.logout,
                  semanticLabel: 'View History',
                  color: Colors.white,
                ),
                onPressed: () => logout())
          ],
        ),
        body: Center(
          child: Form(
            child: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
              TextField(
                controller: textarea,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight in (kg)'),
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => handleSubmit(),
                child: const Text('Submit'),
              ),
            ]),
          ),
        ));
  }
}
