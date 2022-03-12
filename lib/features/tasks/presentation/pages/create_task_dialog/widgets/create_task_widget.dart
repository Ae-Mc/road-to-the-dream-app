import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/date_input_row.dart';
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
  final TextEditingController nameController = TextEditingController();
  DateTime? from;
  DateTime? to;
  final TextEditingController stagesController =
      TextEditingController(text: '0');
  int stagesCount = 0;
  String? error;

  @override
  void initState() {
    updateVariables();
    nameController.addListener(() => setState(updateVariables));
    stagesController.addListener(() => setState(updateVariables));
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    stagesController.dispose();
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
              context: context,
              label: 'to:',
              textAlignment: Alignment.centerRight,
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
                    from: from,
                    to: to,
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

    if (stages == null) {
      error = "Number of stages field can contain only integer numbers";

      return;
    }

    stagesCount = stages;

    error = null;
  }

  void onParsedDateInput(void Function() set, String errorText) {
    set();
    if (error == errorText) {
      error = null;
    }
  }
}
