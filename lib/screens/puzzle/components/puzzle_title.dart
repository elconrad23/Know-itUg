import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';

class PuzzleTitle extends ConsumerWidget {
  const PuzzleTitle({
    super.key,
    required this.puzzleTileColor,
  });

  final Color puzzleTileColor;

  @override
  Widget build(BuildContext context, ref) {
    // srh info item
    final srhIfoItem = ref.watch(srhInfoProvider);
    //

    return Column(
      children: [
        Container(
          padding: padding8,
          decoration: const BoxDecoration(
            borderRadius: borderRadius6,
            color: knowItWhite,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // game icon
              Icon(
                CupertinoIcons.game_controller_solid,
                color: puzzleTileColor,
                size: 15,
              ),
              //
              const HorizontalSpace(of: spacing8),
              //
              Text(
                "Playing Now",
                style: TextStyle(
                  color: puzzleTileColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const VerticalSpace(of: spacing8),

        // game selected
        Container(
          padding: padding4,
          decoration: BoxDecoration(
            color: knowItWhite.withOpacity(.2),
            border: Border.all(
              color: knowItWhite.withOpacity(.8),
              width: 1,
            ),
            borderRadius: borderRadius8,
          ),
          child: Container(
            width: double.infinity,
            padding: padding8,
            decoration: const BoxDecoration(
              borderRadius: borderRadius6,
              color: knowItWhite,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: spacing8),
                  child: Container(
                    padding: padding4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: puzzleTileColor.withOpacity(.8),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Hero(
                      tag: knowitPuzzle,
                      child: CircleAvatar(
                        backgroundColor: puzzleTileColor,
                        radius: 5,
                      ),
                    ),
                  ),
                ),

                const HorizontalSpace(of: spacing8),

                // text
                Flexible(
                  child: Text(
                    srhIfoItem.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: puzzleTileColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
