import 'package:intl/intl.dart';

String dateRangeToText(DateTime? start, DateTime? end) {
  if (start == null) {
    return '';
  }
  if (end == null) {
    return (start.isMidnight
        ? DateFormat('d MMMM').format(start)
        : DateFormat('d MMMM. H:mm a').format(start));
  }

  if (start.year == end.year) {
    if (start.month == end.month) {
      return '${start.day}-${DateFormat("d MMMM").format(end)}';
    } else {
      final format = DateFormat('d MMMM');

      return format.format(start) + ' - ' + format.format(end);
    }
  } else {
    final format = DateFormat('d MMMM y');

    return format.format(start) + ' - ' + format.format(end);
  }
}

extension on DateTime {
  bool get isMidnight =>
      difference(DateTime(year, month, day)) == Duration.zero;
}
