import 'package:intl/intl.dart';

String parseDate(String? date) {
  if(date != null) {
    final dateTime = DateTime.parse(date).toLocal();
    final format = DateFormat('dd MMM yyyy');
    return format.format(dateTime);
  } else {
    return "";
  }
}

String parseDateTime(DateTime? date, {String pattern = "dd-MM-yyyy"}) {
  if(date != null) {
    final format = DateFormat(pattern);
    return format.format(date);
  } else {
    return "";
  }
}