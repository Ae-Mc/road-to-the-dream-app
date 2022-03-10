import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/Input_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/separator_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/text_field_prefix_icon.dart';

class CreateTaskWidget extends StatelessWidget {
  final void Function() onNext;

  const CreateTaskWidget({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            InputRow(context: context, label: 'Task name'),
            SeparatorRow(),
            TableRow(
              children: [
                StrokeText(
                  'Deadlines',
                  strokeColor: AppTheme.of(context).colorTheme.primary,
                  strokeWidth: 0.5,
                  style: AppTheme.of(context).textTheme.title3,
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
            SeparatorRow(),
            InputRow(
              context: context,
              label: 'from:',
              alignment: Alignment.centerRight,
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              icon: TextFieldPrefixIcon(
                icon: Icons.calendar_today,
                size: 31,
                onTap: () => GetIt.I<Logger>().d(
                  'Open date picker',
                ),
              ),
            ),
            SeparatorRow(),
            InputRow(
              context: context,
              label: 'to:',
              alignment: Alignment.centerRight,
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              icon: TextFieldPrefixIcon(
                icon: Icons.calendar_today,
                size: 31,
                onTap: () => GetIt.I<Logger>().d(
                  'Open date picker',
                ),
              ),
            ),
            SeparatorRow(),
            InputRow(
              context: context,
              label: 'Number of stages',
              icon: TextFieldPrefixIcon(
                icon: Icons.unfold_more,
                size: 31,
                onTap: () => {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onNext,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
