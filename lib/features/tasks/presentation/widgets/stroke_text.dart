import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color strokeColor;
  final double strokeWidth;
  final int? maxLines;

  const StrokeText(
    this.text, {
    Key? key,
    this.maxLines,
    required this.style,
    required this.strokeColor,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          maxLines: maxLines,
          style: style,
        ),
        Text(
          text,
          maxLines: maxLines,
          style: style.copyWith(
            foreground: Paint()
              ..strokeWidth = strokeWidth
              ..color = strokeColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}
