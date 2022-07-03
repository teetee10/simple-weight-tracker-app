import 'package:intl/intl.dart';

String formatDateFromString(String date) {
  final dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
  final dateTime = dateFormat.parse(date);
  final formattedDate = DateFormat.jms().format(dateTime);
  return formattedDate;
}

List sortListByTime<base>(listOfInstances) {
  List sortByTime = listOfInstances;
  sortByTime.sort(
      (a, b) => formatDateFromString(b.time).compareTo(formatDateFromString(a.time)));
  return sortByTime;
}
