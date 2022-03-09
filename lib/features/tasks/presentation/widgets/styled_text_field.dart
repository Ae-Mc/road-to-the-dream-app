import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';

class StyledTextField extends StatelessWidget {
  final BoxConstraints? constraints;
  final Pad contentPadding;
  final TextEditingController? controller;
  final Color fillColor;
  final String hintText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextInputAction textInputAction;

  const StyledTextField({
    Key? key,
    required this.fillColor,
    this.constraints,
    this.controller,
    this.contentPadding = const Pad(horizontal: 24, vertical: 16),
    this.hintText = '',
    this.prefix,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: Card(shape: StadiumBorder())),
        TextField(
          controller: controller,
          cursorColor: AppTheme.of(context).colorTheme.primary,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            contentPadding: contentPadding,
            constraints: constraints,
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: AppTheme.of(context).textTheme.body1Regular.copyWith(
                  color:
                      AppTheme.of(context).colorTheme.primary.withOpacity(0.7),
                ),
            isDense: true,
            prefix: prefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            prefixIcon: prefixIcon,
          ),
          expands: false,
          style: AppTheme.of(context).textTheme.body1Regular.copyWith(
                color: AppTheme.of(context).colorTheme.primary,
              ),
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}