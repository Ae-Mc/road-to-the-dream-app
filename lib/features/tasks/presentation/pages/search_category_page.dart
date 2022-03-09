import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_category_dialog.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/category_card.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_text_field.dart';

class SearchCategoryPage extends StatefulWidget {
  const SearchCategoryPage({Key? key}) : super(key: key);

  @override
  State<SearchCategoryPage> createState() => _SearchCategoryPageState();
}

class _SearchCategoryPageState extends State<SearchCategoryPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const Pad(all: 16),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StyledIconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icons.arrow_back,
              iconSize: 48,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: StyledTextField(
                controller: controller,
                fillColor: AppTheme.of(context).colorTheme.secondary,
                hintText: 'Search',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) => Column(
            children: state.when(
              loaded: (categories) => categories
                  .where((element) => element.name
                      .toLowerCase()
                      .contains(RegExp.escape(controller.text.toLowerCase())))
                  .map((e) => Padding(
                        padding: const Pad(vertical: 8),
                        child: CategoryCard(category: e),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: StyledIconButton(
            onPressed: () => AutoRouter.of(context).pushNativeRoute(
              DialogRoute(
                context: context,
                builder: (_) => const CreateCategoryDialog(),
              ),
            ),
            icon: Icons.add_circle_outline,
            iconSize: 72,
          ),
        ),
      ],
    );
  }
}
