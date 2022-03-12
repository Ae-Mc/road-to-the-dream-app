import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/date_text_field.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';

class DateInputRow implements TableRow {
  final Alignment textAlignment;
  final BuildContext context;
  @override
  final LocalKey? key;
  final String label;
  final TextStyle? textStyle;
  final void Function()? onWrongInput;
  final void Function(DateTime date)? onParsedInput;
  final void Function()? onEmptyInput;

  DateInputRow({
    required this.context,
    required this.label,
    this.onEmptyInput,
    this.onParsedInput,
    this.onWrongInput,
    this.key,
    this.textAlignment = Alignment.centerLeft,
    this.textStyle,
  }) : super();

  @override
  List<Widget>? get children => [
        Align(
          alignment: textAlignment,
          child: StrokeText(
            label,
            maxLines: 2,
            style: textStyle ?? AppTheme.of(context).textTheme.title3,
            strokeColor: AppTheme.of(context).colorTheme.primary,
            strokeWidth: 0.5,
          ),
        ),
        const SizedBox(),
        DateTextField(
          onEmptyInput: onEmptyInput,
          onParsedInput: onParsedInput,
          onWrongInput: onWrongInput,
        ),
      ];

  @override
  Decoration? get decoration => null;
}
