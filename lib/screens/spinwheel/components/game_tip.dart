import 'package:flutter/cupertino.dart';
import 'howToPlay.dart';
import '../../../knowit_exporter.dart';

class GameTip extends ConsumerWidget {
  const GameTip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // show game tile
    final showGameTile = ref.watch(showGameTileProvider);

    return AnimatedContainer(
      duration: halfSeconds,
      padding:
          const EdgeInsets.symmetric(horizontal: spacing8, vertical: spacing4),
      decoration: BoxDecoration(
        borderRadius: borderRadius6,
        color: selectedColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // game icon
          Icon(
            showGameTile
                ? CupertinoIcons.hand_draw_fill
                : CupertinoIcons.asterisk_circle_fill,
            color: knowItWhite,
            size: 20,
          ),

          const HorizontalSpace(of: spacing8),
          
          AppButton(
            // isSmallButton = true,
            text: "How to play!",
            textColor: knowItWhite,
            buttonColor: Colors.blue,
            toolTip: "Instructions",
            tooltipColor: Colors.green,
            tooltipTextColor: Colors.amber ,
            iconData: CupertinoIcons.arrow_up_right_circle_fill,
            onTap: () {
              MaterialPageRoute(
                builder: (BuildContext context) => const Instructions(),
                );
              },),

          const HorizontalSpace(of: spacing8),

          Flexible(
            child: Text(
              showGameTile
                  ? "Tap the Wheel or Logo to Spin Again"
                  : "Spinning ...",
              style: const TextStyle(
                fontSize: 12,
                color: knowItWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
