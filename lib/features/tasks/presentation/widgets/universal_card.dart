import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';

class UniversalCard extends StatelessWidget {
  final Color color;
  final void Function() onCardTap;
  final void Function() onDelete;
  final void Function() onRename;
  final String subtitle;
  final String title;

  const UniversalCard({
    Key? key,
    required this.color,
    required this.onCardTap,
    required this.onDelete,
    required this.onRename,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;
    final textTheme = AppTheme.of(context).textTheme;

    return Card(
      color: color,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: onCardTap,
        child: Padding(
          padding: const Pad(all: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      style:
                          textTheme.title1.copyWith(color: colorTheme.primary),
                    ),
                  ),
                  PopupMenuButton(
                    child: const Icon(Icons.more_vert_rounded),
                    color: Colors.transparent,
                    elevation: 0,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              color: colorTheme.primary,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                onTap: () =>
                                    onPopupButtonTap(context, onDelete),
                                child: Text(
                                  'Delete',
                                  style: textTheme.title2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Card(
                              color: Color.lerp(
                                colorTheme.primary,
                                colorTheme.onPrimary,
                                0.1,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                                onTap: () =>
                                    onPopupButtonTap(context, onRename),
                                child: Text(
                                  'Rename',
                                  style: textTheme.title2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, -16),
                    padding: Pad.zero,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              StrokeText(
                subtitle,
                style: textTheme.body1Regular.copyWith(
                  color: colorTheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                strokeWidth: textTheme.strokeWidth,
                strokeColor: colorTheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPopupButtonTap(BuildContext context, void Function() callback) {
    Navigator.of(context).pop();
    callback();
  }
}
