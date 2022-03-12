import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_text_field.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/text_field_prefix_icon.dart';

class DateTextField extends StatefulWidget {
  final void Function()? onEmptyInput;
  final void Function()? onWrongInput;
  final void Function(DateTime)? onParsedInput;

  const DateTextField({
    Key? key,
    this.onWrongInput,
    this.onParsedInput,
    this.onEmptyInput,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        widget.onEmptyInput?.call();
      } else {
        final parsed = parseDate(controller.text);

        if (parsed == null) {
          widget.onWrongInput?.call();
        } else {
          widget.onParsedInput?.call(parsed);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StyledTextField(
      fillColor: AppTheme.of(context).colorTheme.secondary,
      contentPadding: const Pad(vertical: 8),
      controller: controller,
      keyboardType: TextInputType.datetime,
      prefixIcon: Padding(
        padding: const Pad(right: 8),
        child: TextFieldPrefixIcon(
          icon: Icons.calendar_today,
          size: 31,
          onTap: () => GetIt.I<Logger>().d('Open date picker'),
        ),
      ),
    );
  }

  static DateTime? parseDate(String date) {
    final separator = RegExp(r'[/-]');
    final formats = date.split(separator).length == 3 &&
            date.split(separator)[0].length == 2
        ? [
            DateFormat.yMd(),
            DateFormat.yMd('zh'),
            DateFormat.yMd('ru_RU'),
          ]
        : [
            DateFormat.yMd('zh'),
            DateFormat.yMd(),
            DateFormat.yMd('ru_RU'),
          ];

    for (final format in formats) {
      try {
        final result = format.parse(date);
        GetIt.I<Logger>()
            .d('Date $date parsed as $result with format ${format.pattern}');

        return result;
        // ignore: empty_catches
      } on FormatException {
        GetIt.I<Logger>()
            .d('Format ${format.pattern} not accepted for date $date');
      }
    }

    return null;
  }
}
