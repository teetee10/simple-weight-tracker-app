import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/weight.dart';
import '../../providers/weight.dart';
import '../../transforms/date.dart';
import '../../widgets/pages_app_bar.dart';

class WeightHistoryScreen extends StatefulWidget {
  const WeightHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WeightHistoryScreen> createState() => _WeightHistoryScreenState();
}

class _WeightHistoryScreenState extends State<WeightHistoryScreen> {

  @override
  void initState() {
    final userWeight = Provider.of<WeightProvider>(context, listen: false);
    userWeight.fetchWeightHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weightHistory = sortListByTime(Provider.of<WeightProvider>(context).weightHistory);

    return Scaffold(
      appBar: PagesAppBar(title: 'My Weight History'),
      body: ListView.separated(
          itemCount: weightHistory.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (_, index) => ListTile(
                title: Text('Record - ${weightHistory[index].weight}kg'),
                trailing: Text(formatDateFromString(weightHistory[index].time)),
              )),
    );
  }
}
