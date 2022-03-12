import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/date_input_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/input_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/separator_row.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';

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
  final TextEditingController nameController = TextEditingController();
  DateTime? from;
  DateTime? to;
  String? error;

  @override
  void initState() {
    updateVariables();
    descriptionController.addListener(() => setState(updateVariables));
    nameController.addListener(() => setState(updateVariables));
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Text(
            'Create stage ${widget.stageNumber}',
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
              label: 'Stage name',
              controller: nameController,
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
            DateInputRow(
              textAlignment: Alignment.centerRight,
              context: context,
              label: 'from:',
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              onEmptyInput: () => onParsedDateInput(
                () => from = null,
                "Wrong date in field from",
              ),
              onWrongInput: () =>
                  setState(() => error = "Wrong date in field from"),
              onParsedInput: (parsed) => onParsedDateInput(
                () => from = parsed,
                "Wrong date in field from",
              ),
            ),
            SeparatorRow(),
            DateInputRow(
              textAlignment: Alignment.centerRight,
              context: context,
              label: 'to:',
              textStyle: AppTheme.of(context).textTheme.body1Bold,
              onEmptyInput: () =>
                  onParsedDateInput(() => to = null, "Wrong date in field to"),
              onWrongInput: () =>
                  setState(() => error = "Wrong date in field to"),
              onParsedInput: (parsed) => onParsedDateInput(
                () => to = parsed,
                "Wrong date in field to",
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
            style: AppTheme.of(context).textTheme.body1Bold.copyWith(
                  color: AppTheme.of(context).colorTheme.error,
                ),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
        ElevatedButton(
          onPressed: error != null
              ? null
              : () => widget.onNext(
                    description: descriptionController.text,
                    from: from,
                    name: nameController.text,
                    to: to,
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

    error = null;
  }

  void onParsedDateInput(void Function() set, String errorText) {
    set();
    if (error == errorText) {
      error = null;
    }
  }
}
