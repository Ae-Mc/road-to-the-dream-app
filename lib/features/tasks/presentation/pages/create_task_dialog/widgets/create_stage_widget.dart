import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/input_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/separator_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/utils/date_editing_controller.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/text_field_prefix_icon.dart';

class CreateStageWidget extends StatefulWidget {
  final int stageNumber;
  final bool isLastStage;
  final void Function({
    required String name,
    required String description,
    DateTime? from,
    DateTime? to,
  }) onNext;

  const CreateStageWidget({
    Key? key,
    required this.stageNumber,
    required this.isLastStage,
    required this.onNext,
  }) : super(key: key);

  @override
  State<CreateStageWidget> createState() => _CreateStageWidgetState();
}

class _CreateStageWidgetState extends State<CreateStageWidget> {
  final TextEditingController descriptionController = TextEditingController();
  final DateEditingController fromController = DateEditingController();
  final TextEditingController nameController = TextEditingController();
  final DateEditingController toController = DateEditingController();
  String? error;

  @override
  void initState() {
    updateVariables();
    descriptionController.addListener(() => setState(updateVariables));
    fromController.addListener(() => setState(updateVariables));
    nameController.addListener(() => setState(updateVariables));
    toController.addListener(() => setState(updateVariables));
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    fromController.dispose();
    nameController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;
    final textTheme = AppTheme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Text(
            'Create stage ${widget.stageNumber}',
            style: textTheme.title1.copyWith(color: colorTheme.primary),
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
              label: 'Stage name',
              controller: nameController,
            ),
            SeparatorRow(),
            TableRow(
              children: [
                StrokeText(
                  'Deadlines',
                  strokeColor: colorTheme.primary,
                  strokeWidth: textTheme.strokeWidth,
                  style: textTheme.title3,
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
              textStyle: textTheme.body1Bold,
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
              textStyle: textTheme.body1Bold,
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
              controller: descriptionController,
              label: 'Description',
              maxLines: 4,
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (error != null) ...[
          const SizedBox(height: 8),
          Text(
            error!,
            style: textTheme.body1Bold.copyWith(color: colorTheme.error),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
        ElevatedButton(
          onPressed: error != null
              ? null
              : () => widget.onNext(
                    description: descriptionController.text,
                    from: fromController.date,
                    name: nameController.text,
                    to: toController.date,
                  ),
          child: Text(widget.isLastStage ? 'OK' : 'Next'),
        ),
      ],
    );
  }

  void updateVariables() {
    if (nameController.text.isEmpty) {
      error = "Name can't be empty";

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

  void onParsedDateInput(void Function() set, String errorText) {
    set();
    if (error == errorText) {
      error = null;
    }
  }
}
