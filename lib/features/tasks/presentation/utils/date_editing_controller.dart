import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DateEditingController extends TextEditingController {
  static List<List<DateFormat>> dateFormatSets = [
    [
      DateFormat.yMd(),
      DateFormat.yMd('zh'),
      DateFormat.yMd('ru_RU'),
    ],
    [
      DateFormat.yMd('zh'),
      DateFormat.yMd(),
      DateFormat.yMd('ru_RU'),
    ],
  ];
  DateEditingController({DateTime? date})
      : super(text: date?.toIso8601String());

  DateTime? get date {
    final separator = RegExp(r'[/-]');
    final formats = text.split(separator).length == 3 &&
            text.split(separator)[0].length == 2
        ? dateFormatSets[0]
        : dateFormatSets[1];

    for (final format in formats) {
      try {
        return format.parse(text);
        // ignore: empty_catches
      } on FormatException {}
    }

    return null;
  }
}
