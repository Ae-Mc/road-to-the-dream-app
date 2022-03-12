import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_text_field.dart';

class InputRow implements TableRow {
  final Alignment textAlignment;
  final BuildContext context;
  final TextEditingController? controller;
  final Widget? icon;
  @override
  final LocalKey? key;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String label;
  final TextStyle? textStyle;

  InputRow({
    required this.context,
    required this.label,
    this.textAlignment = Alignment.centerLeft,
    this.controller,
    this.icon,
    this.key,
    this.keyboardType,
    this.maxLines,
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
        StyledTextField(
          controller: controller,
          fillColor: Color.lerp(
            AppTheme.of(context).colorTheme.secondary,
            AppTheme.of(context).colorTheme.tertiary,
            0.2,
          )!,
          contentPadding: const Pad(left: 8, vertical: 8),
          keyboardType: keyboardType,
          maxLines: maxLines,
          prefixIcon: Padding(padding: const Pad(right: 8), child: icon),
        ),
      ];

  @override
  Decoration? get decoration => null;
}
