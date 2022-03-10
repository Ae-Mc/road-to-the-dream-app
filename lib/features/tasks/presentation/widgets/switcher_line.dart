import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';

part 'switcher_line.freezed.dart';

class SwitcherLine extends StatelessWidget {
  final List<TextAndColor> tiles;
  final double tileWidth;
  final void Function(int index) onTileTap;

  const SwitcherLine({
    Key? key,
    required this.tiles,
    required this.tileWidth,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: tileWidth * tiles.length,
        height: 32,
        child: Stack(
          children: tiles
              .map<Widget>(
                (tile) {
                  final index = tiles.indexOf(tile);
                  final isActive = tile == tiles[0];

                  return Positioned(
                    left: index * tileWidth - 16,
                    width: tileWidth + 16,
                    child: Material(
                      color: tile.color,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                      ),
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                        ),
                        onTap: () => onTileTap(index),
                        splashColor: tile.color.inversed,
                        child: Padding(
                          padding: const Pad(all: 8, left: 16),
                          child: Text(
                            tile.text,
                            style: AppTheme.of(context)
                                .textTheme
                                .body1Regular
                                .copyWith(
                                  color: isActive
                                      ? tile.color.inversed
                                      : tile.color.inversed.withOpacity(0.6),
                                ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
              .toList()
              .reversed
              .toList(),
        ),
      ),
    );
  }
}

@freezed
class TextAndColor with _$TextAndColor {
  const factory TextAndColor({
    required String text,
    required Color color,
  }) = _TextAndColor;
}

extension on Color {
  Color get inversed => Color(value ^ 0xFFFFFF);
}
