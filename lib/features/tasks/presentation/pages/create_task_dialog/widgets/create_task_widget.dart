import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/utils/date_editing_controller.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/input_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/separator_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/text_field_prefix_icon.dart';

class CreateTaskWidget extends StatefulWidget {
  final void Function({
    required String name,
    required int stagesCount,
    DateTime? from,
    DateTime? to,
  }) onNext;

  const CreateTaskWidget({Key? key, required this.onNext}) : super(key: key);

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final DateEditingController fromController = DateEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stagesController =
      TextEditingController(text: '0');
  int stagesCount = 0;
  final DateEditingController toController = DateEditingController();
  String? error;

  @override
  void initState() {
    updateVariables();
    fromController.addListener(() => setState(updateVariables));
    nameController.addListener(() => setState(updateVariables));
    stagesController.addListener(() => setState(updateVariables));
    toController.addListener(() => setState(updateVariables));
    super.initState();
  }

  @override
  void dispose() {
    fromController.dispose();
    nameController.dispose();
    stagesController.dispose();
    toController.dispose();
    super.dispose();
  }

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
          columnWidths: const {1: FixedColumnWidth(16)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            InputRow(
              context: context,
              controller: nameController,
              label: 'Task name',
            ),
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
              textAlignment: Alignment.centerRight,
              context: context,
              controller: fromController,
              label: 'from:',
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              keyboardType: TextInputType.datetime,
              icon: TextFieldPrefixIcon(
                icon: Icons.calendar_today,
                size: 31,
                onTap: () => GetIt.I<Logger>().d('Open date picker'),
              ),
            ),
            SeparatorRow(),
            InputRow(
              context: context,
              controller: toController,
              label: 'to:',
              textAlignment: Alignment.centerRight,
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              keyboardType: TextInputType.datetime,
              icon: TextFieldPrefixIcon(
                icon: Icons.calendar_today,
                size: 31,
                onTap: () => GetIt.I<Logger>().d('Open date picker'),
              ),
            ),
            SeparatorRow(),
            InputRow(
              context: context,
              controller: stagesController,
              keyboardType: TextInputType.number,
              label: 'Number of stages',
              icon: TextFieldPrefixIcon(
                icon: Icons.unfold_more,
                size: 31,
                onTap: () => {},
              ),
            ),
          ],
        ),
        if (error != null) ...[
          const SizedBox(height: 8),
          Text(
            error!,
            style: AppTheme.of(context).textTheme.body1Bold.copyWith(
                  color: AppTheme.of(context).colorTheme.error,
                ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: error == null
              ? () => widget.onNext(
                    name: nameController.text,
                    from: fromController.date,
                    to: toController.date,
                    stagesCount: stagesCount,
                  )
              : null,
          child: Text(stagesCount == 0 ? 'OK' : 'Next'),
        ),
      ],
    );
  }

  void updateVariables() {
    if (nameController.text.isEmpty) {
      error = "Name can't be empty";

      return;
    }

    final stages = int.tryParse(stagesController.text);
    stagesCount = stages ?? stagesCount;

    if (stages == null) {
      error = "Number of stages field can contain only integer numbers";

      return;
    }

    if (fromController.text.isNotEmpty && fromController.date == null) {
      error = "Wrong date in field from";

      return;
    }

    if (toController.text.isNotEmpty && toController.date == null) {
      error = "Wrong date in field to";

      return;
    }

    error = null;
  }
}
