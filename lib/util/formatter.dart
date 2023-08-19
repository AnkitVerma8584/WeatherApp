import 'package:intl/intl.dart';

String _parseString(String date) {
  var s = DateTime.parse(date);
  return DateFormat('yMMMEd').format(s);
}

String _parseDate(DateTime date) {
  return DateFormat('yMMMEd').format(date);
}

String getDateString(String date) {
  DateTime today = DateTime.now();
  String currentDate = _parseString(date);
  if (_parseDate(today) == currentDate) {
    return "Today";
  } else {
    return currentDate;
  }
}
