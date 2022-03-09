import 'dart:math';
import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
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

  @override
  void initState() {
    categoryColorController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    categoryColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  color: AppTheme.of(context).colorTheme.tertiary,
                ),
                padding: const Pad(all: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: AppTheme.of(context).colorTheme.secondary,
                        shape: const StadiumBorder(),
                        child: Text(
                          'Create category',
                          style: AppTheme.of(context).textTheme.title1.copyWith(
                                color: AppTheme.of(context).colorTheme.primary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(),
                        1: FixedColumnWidth(16),
                        2: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            StrokeText(
                              'Category name',
                              style: AppTheme.of(context)
                                  .textTheme
                                  .title3
                                  .copyWith(
                                    color: AppTheme.of(context)
                                        .colorTheme
                                        .tertiary,
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
                                AppTheme.of(context).colorTheme.secondary,
                                AppTheme.of(context).colorTheme.tertiary,
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
                              style: AppTheme.of(context)
                                  .textTheme
                                  .title3
                                  .copyWith(
                                    color: AppTheme.of(context)
                                        .colorTheme
                                        .tertiary,
                                  ),
                              strokeColor:
                                  AppTheme.of(context).colorTheme.primary,
                              strokeWidth: 1,
                            ),
                            const SizedBox(width: 16),
                            StyledTextField(
                              contentPadding:
                                  const Pad(horizontal: 16, vertical: 8),
                              controller: categoryColorController,
                              fillColor: Color.lerp(
                                AppTheme.of(context).colorTheme.secondary,
                                AppTheme.of(context).colorTheme.tertiary,
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
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const Pad(horizontal: 32),
                        child: ElevatedButton(
                          onPressed: () => createCategory(context),
                          child: const Text('OK'),
                        ),
                      ),
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
    return '#' +
        List.generate(
          max(6 - categoryColorController.text.length, 0),
          (_) => '0',
        ).join();
  }

  void createCategory(BuildContext context) {
    // TODO
    Navigator.of(context).pop();
  }
}
