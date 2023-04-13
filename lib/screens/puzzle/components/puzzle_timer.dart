import 'package:flutter/cupertino.dart';

import '../providers/exporter.dart';
import '../../../knowit_exporter.dart';

class PuzzleTimer extends ConsumerWidget {
  const PuzzleTimer({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context, ref) {
    // puzzle tile color
    final puzzleTileColor = ref.watch(selectedSpinColorProvider);

    //
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: spacing4,
        horizontal: spacing8 * 2,
      ),
      margin: margin4,
      decoration: const BoxDecoration(
        color: knowItWhite,
        borderRadius: borderRadius8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.timer,
            color: puzzleTileColor,
            size: fontSize,
          ),
          const HorizontalSpace(of: 8),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(timerNotifierProvider);

              return Text(
                state,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: puzzleTileColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
