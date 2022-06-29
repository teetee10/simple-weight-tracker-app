import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/weight_provider.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  String weight = '';
  dynamic userWeight;

  @override
  void initState() {
    userWeight = Provider.of<WeightProvider>(context, listen: false);
    super.initState();
  }

  void handleSubmit() async {
    final time = DateTime.now().toString();
    final payload = jsonEncode({'weight': weight, 'time': time});
    await userWeight.addWeight(context, payload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Weight'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.list,
                  semanticLabel: 'View History',
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushNamed(context, weightHistoryRoute))
          ],
        ),
        body: Center(
          child: Form(
            child: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight in (cm)'),
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
