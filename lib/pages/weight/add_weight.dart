import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../constants/sizes.dart';
import '../../providers/auth.dart';
import '../../providers/weight.dart';
import '../../widgets/app_snackbar.dart';
import '../../widgets/buttons.dart';
import '../../widgets/control_wrapper.dart';
import '../../widgets/inputs.dart';
import '../../widgets/pages_app_bar.dart';

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
    await userAuth?.logout();
    Navigator.of(context).pushNamedAndRemoveUntil(homeRoute, (route) => false);
  }

  void validate() {
    if (weight == '') {
      AppSnackBar('Error', 'Please enter a weight', context);
      return;
    }
    handleSubmit({"weight": weight, "time": DateTime.now().toString()});
  }

  void clearInput() {
    setState(() {
      weight = '';
    });
    textarea.clear();
  }

  void handleSubmit(payload) async {
    try {
      await userWeight?.addToWeightHistory(payload);
      AppSnackBar('success', 'Added weight', context);
      clearInput();
    } catch (e) {
      AppSnackBar('Error', e.toString(), context, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ControlWrapper<WeightProvider>(
      child: Scaffold(
          appBar: PagesAppBar(title: 'Add Weight', actions: [
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
          ]),
          body: Center(
            child: Form(
              child:
                  ListView(padding: const EdgeInsets.all(kAppMargin), children: <Widget>[
                SimpleTextField(
                  textEditingController: textarea,
                  textInputType: TextInputType.number,
                  labelText: 'Weight in (kg)',
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
                const SizedBox(height: kAppMargin),
                SimpleElevatedButton(
                  onPressed: () => validate(),
                  child: const Text('Submit'),
                ),
              ]),
            ),
          )),
    );
  }
}
