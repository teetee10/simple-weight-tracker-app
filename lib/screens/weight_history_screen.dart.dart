import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/weight_model.dart';
import '../providers/weight_provider.dart';

class WeightHistoryScreen extends StatefulWidget {
  WeightHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WeightHistoryScreen> createState() => _WeightHistoryScreenState();
}

class _WeightHistoryScreenState extends State<WeightHistoryScreen> {
  @override
  void initState() {
    super.initState();
    final userWeightHistory = Provider.of<WeightProvider>(context, listen: false);
    userWeightHistory.fetchWeightHistory(context);
  }

  String formatDateFromString(date) {
    final dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
    final dateTime = dateFormat.parse(date);
    final formattedDate = DateFormat.jms().format(dateTime);
    return formattedDate;
  }

  List<Weight> sortWeightHistoryByTime() {
    final userWeightHistory = Provider.of<WeightProvider>(context);
    List<Weight> sortedWeightHistory = userWeightHistory.weightHistory;
    sortedWeightHistory.sort(
        (a, b) => formatDateFromString(b.time).compareTo(formatDateFromString(a.time)));
    return sortedWeightHistory;
  }

  @override
  Widget build(BuildContext context) {
    final weightHistory = sortWeightHistoryByTime();

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Weight History'),
        ),
        body: ListView.separated(
          itemCount: weightHistory.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${weightHistory[index].weight}cm'),
                    Text(formatDateFromString(weightHistory[index].time)),
                  ],
                ),
              )),
        ));
  }
}
