import 'dart:math';
import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_text_field.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({Key? key}) : super(key: key);

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryColorController = TextEditingController();
  Set<_ErrorType> errors = {_ErrorType.nameIsEmpty};

  @override
  void initState() {
    categoryNameController.addListener(
      () => setState(
        () => categoryNameController.text.isEmpty
            ? errors.add(_ErrorType.nameIsEmpty)
            : errors.remove(_ErrorType.nameIsEmpty),
      ),
    );
    categoryColorController.addListener(() => setState(() =>
        getCurrentColor() == Colors.transparent
            ? errors.add(_ErrorType.invalidColor)
            : errors.remove(_ErrorType.invalidColor)));
    super.initState();
  }

  @override
  void dispose() {
    categoryColorController.dispose();
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;
    final textTheme = AppTheme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: IntrinsicWidth(
        child: Padding(
          padding: const Pad(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: colorTheme.tertiary,
                ),
                padding: const Pad(all: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: colorTheme.secondary,
                        shape: const StadiumBorder(),
                        child: Text(
                          'Create category',
                          style: textTheme.title1.copyWith(
                            color: colorTheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Table(
                      columnWidths: const {1: FixedColumnWidth(16)},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            StrokeText(
                              'Category name',
                              style: textTheme.title3.copyWith(
                                color: colorTheme.tertiary,
                              ),
                              strokeColor:
                                  AppTheme.of(context).colorTheme.primary,
                              strokeWidth: 1,
                            ),
                            const SizedBox(width: 16),
                            StyledTextField(
                              contentPadding:
                                  const Pad(horizontal: 16, vertical: 8),
                              controller: categoryNameController,
                              fillColor: Color.lerp(
                                colorTheme.secondary,
                                colorTheme.tertiary,
                                0.2,
                              )!,
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        ),
                        TableRow(
                          children: List.generate(
                            3,
                            (index) => const SizedBox(height: 16),
                          ),
                        ),
                        TableRow(
                          children: [
                            StrokeText(
                              'Color',
                              style: textTheme.title3.copyWith(
                                color: colorTheme.tertiary,
                              ),
                              strokeColor: colorTheme.primary,
                              strokeWidth: 1,
                            ),
                            const SizedBox(width: 16),
                            StyledTextField(
                              contentPadding:
                                  const Pad(horizontal: 16, vertical: 8),
                              controller: categoryColorController,
                              fillColor: Color.lerp(
                                colorTheme.secondary,
                                colorTheme.tertiary,
                                0.2,
                              )!,
                              prefix: Text(getPrefixText()),
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  color: getCurrentColor(),
                                  shape: BoxShape.circle,
                                ),
                                height: 34,
                                margin: const Pad(right: 8),
                                width: 34,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (errors.isNotEmpty) ...[
                      Text(
                        errors.contains(_ErrorType.nameIsEmpty)
                            ? "Name can't be empty"
                            : errors.contains(_ErrorType.invalidColor)
                                ? "Invalid color"
                                : "",
                        style: textTheme.body1Bold
                            .copyWith(color: colorTheme.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                    ],
                    ElevatedButton(
                      onPressed:
                          errors.isEmpty ? () => createCategory(context) : null,
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              StyledIconButton(
                icon: CupertinoIcons.clear_circled,
                iconSize: 72,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getCurrentColor() {
    if (categoryColorController.text.isEmpty) {
      return Colors.black;
    }
    final colorHex = int.tryParse(categoryColorController.text, radix: 16);
    if (colorHex == null || colorHex < 0 || colorHex > 0xFFFFFF) {
      return Colors.transparent;
    }

    return Color(colorHex + 0xFF000000);
  }

  String getPrefixText() {
    return '#' + '0' * max(6 - categoryColorController.text.length, 0);
  }

  void createCategory(BuildContext context) {
    BlocProvider.of<TasksBloc>(context).add(TasksEvent.categoryAdded(
      Category(
        id: UUID(),
        name: categoryNameController.text,
        color: getCurrentColor().value,
        tasks: [],
      ),
    ));
    Navigator.of(context).pop();
  }
}

enum _ErrorType { invalidColor, nameIsEmpty }
