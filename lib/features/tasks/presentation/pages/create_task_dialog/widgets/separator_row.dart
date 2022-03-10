import 'package:flutter/material.dart';

class SeparatorRow implements TableRow {
  @override
  final List<Widget> children;
  @override
  final LocalKey? key;

  SeparatorRow({int columns = 3, double height = 8, this.key})
      : children = List.generate(columns, (index) => SizedBox(height: height));

  @override
  Decoration? get decoration => null;
}
