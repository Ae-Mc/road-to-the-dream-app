import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/create_task_widget.dart';
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
                  child: CreateTaskWidget(
                    onNext: () => GetIt.I<Logger>().d('Next step: Add stage 1'),
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
}
