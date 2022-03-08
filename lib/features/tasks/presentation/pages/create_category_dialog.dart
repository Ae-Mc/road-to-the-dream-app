import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';

class CreateCategoryDialog extends StatelessWidget {
  final TextEditingController categoryName = TextEditingController();
  final TextEditingController categoryColor = TextEditingController();

  CreateCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: AppTheme.of(context).colorTheme.tertiary,
              ),
              padding: const Pad(all: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: AppTheme.of(context).colorTheme.secondary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
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
                    defaultColumnWidth: const IntrinsicColumnWidth(),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          StrokeText(
                            'Category name',
                            style: AppTheme.of(context)
                                .textTheme
                                .title3
                                .copyWith(
                                  color:
                                      AppTheme.of(context).colorTheme.tertiary,
                                ),
                            strokeColor:
                                AppTheme.of(context).colorTheme.primary,
                            strokeWidth: 1,
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).colorTheme.secondary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            width: 100,
                            height: 32,
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
                                  color:
                                      AppTheme.of(context).colorTheme.tertiary,
                                ),
                            strokeColor:
                                AppTheme.of(context).colorTheme.primary,
                            strokeWidth: 1,
                          ),
                          const SizedBox(width: 16),
                          Card(
                            color: AppTheme.of(context).colorTheme.secondary,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: const SizedBox(
                              width: 100,
                              height: 32,
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
          ),
          const SizedBox(height: 16),
          IconButton(
            color: AppTheme.of(context).colorTheme.secondary,
            icon: const Icon(CupertinoIcons.clear_circled),
            iconSize: 72,
            onPressed: () => Navigator.of(context).pop(),
            padding: Pad.zero,
          ),
        ],
      ),
    );
  }

  void createCategory(BuildContext context) {
    // TODO
    Navigator.of(context).pop();
  }
}
