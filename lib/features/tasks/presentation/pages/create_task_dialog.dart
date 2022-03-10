import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/input_field_prefix_icon.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_text_field.dart';

class CreateTaskDialog extends StatelessWidget {
  const CreateTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const Pad(all: 32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: AppTheme.of(context).colorTheme.tertiary,
                child: Padding(
                  padding: const Pad(all: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 0,
                        child: Text(
                          'Create task',
                          style: AppTheme.of(context).textTheme.title1.copyWith(
                                color: AppTheme.of(context).colorTheme.primary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(),
                          1: FixedColumnWidth(16),
                          2: FlexColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          getInputRow(
                            context: context,
                            label: 'Task name',
                          ),
                          getSeparatorRow(),
                          TableRow(
                            children: [
                              StrokeText(
                                'Deadlines',
                                strokeColor:
                                    AppTheme.of(context).colorTheme.primary,
                                strokeWidth: 0.5,
                                style: AppTheme.of(context).textTheme.title3,
                              ),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ),
                          getSeparatorRow(),
                          getInputRow(
                            context: context,
                            label: 'from:',
                            alignment: Alignment.centerRight,
                            textStyle: AppTheme.of(context).textTheme.body1Bold,
                            icon: InputFieldPrefixIcon(
                              icon: Icons.calendar_today,
                              size: 31,
                              onTap: () => GetIt.I<Logger>().d(
                                'Open date picker',
                              ),
                            ),
                          ),
                          getSeparatorRow(),
                          getInputRow(
                            context: context,
                            label: 'to:',
                            alignment: Alignment.centerRight,
                            textStyle: AppTheme.of(context).textTheme.body1Bold,
                            icon: InputFieldPrefixIcon(
                              icon: Icons.calendar_today,
                              size: 31,
                              onTap: () => GetIt.I<Logger>().d(
                                'Open date picker',
                              ),
                            ),
                          ),
                          getSeparatorRow(),
                          getInputRow(
                            context: context,
                            label: 'Number of stages',
                            icon: InputFieldPrefixIcon(
                              icon: Icons.unfold_more,
                              size: 31,
                              onTap: () => {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () =>
                            GetIt.I<Logger>().d('Next step: Add stage 1'),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              StyledIconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: CupertinoIcons.clear_circled,
                iconSize: 72,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: long-parameter-list
  TableRow getInputRow({
    required BuildContext context,
    required String label,
    Alignment alignment = Alignment.centerLeft,
    TextStyle? textStyle,
    Widget? icon,
  }) =>
      TableRow(
        children: [
          Align(
            alignment: alignment,
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
            fillColor: Color.lerp(
              AppTheme.of(context).colorTheme.secondary,
              AppTheme.of(context).colorTheme.tertiary,
              0.2,
            )!,
            contentPadding: const Pad(left: 8, vertical: 8),
            prefixIcon: Padding(padding: const Pad(right: 8), child: icon),
          ),
        ],
      );

  TableRow getSeparatorRow() => TableRow(
        children: List.generate(3, (index) => const SizedBox(height: 8)),
      );
}
