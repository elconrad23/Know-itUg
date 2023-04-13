import 'package:flutter/cupertino.dart';
import 'package:know_it/routes/paths.dart';

import '../../../knowit_exporter.dart';

class GameSelectedTile extends ConsumerWidget {
  const GameSelectedTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // show game tile
    final showGameTile = ref.watch(showGameTileProvider);

    // srh info item
    final srhIfoItem = ref.watch(srhInfoProvider);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: showGameTile
          ? GameTile(
              selectedColor: selectedColor,
              gameText: srhIfoItem.title,
              playingText: "Play Now",
              icon: CupertinoIcons.arrow_up_right_circle_fill,
              onTap: () {
                // go to the puzzle screen
                context.go(puzzlePath);
              },
            )
          : const EmptySpace(),
    );
  }
}

class GameTile extends StatelessWidget {
  const GameTile({
    super.key,
    required this.selectedColor,
    required this.gameText,
    required this.playingText,
    this.onTap,
    this.icon,
  });

  final Color selectedColor;

  // text
  final String gameText;

  // playing now text
  final String playingText;

  // on tap
  final VoidCallback? onTap;

  // icon
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      duration: quarterSeconds,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spacing8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // game selected container
            InkWell(
              onTap: onTap,
              borderRadius: borderRadius8,
              child: Container(
                width: double.infinity,
                padding: padding16,
                decoration: BoxDecoration(
                  borderRadius: borderRadius8,
                  color: selectedColor.withOpacity(.15),
                  border: Border.all(
                    color: selectedColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // text
                    Flexible(
                      child: Text(
                        gameText,
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    if (icon != null) const HorizontalSpace(of: spacing8),

                    // icon
                    if (icon != null)
                      Hero(
                        tag: knowitPuzzle,
                        child: Icon(
                          icon,
                          color: selectedColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // play now
            Positioned(
              top: -spacing16,
              left: spacing16,
              child: Container(
                padding: padding8,
                decoration: BoxDecoration(
                  borderRadius: borderRadius6,
                  color: selectedColor,
                ),
                child: Center(
                  child: Row(
                    children: const [
                      // game icon
                      Icon(
                        CupertinoIcons.game_controller_solid,
                        color: knowItWhite,
                        size: 12,
                      ),

                      HorizontalSpace(of: spacing8),

                      //
                      Text(
                        "Play Now",
                        style: TextStyle(
                          color: knowItWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
