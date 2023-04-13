import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../knowit_exporter.dart';

class GameWheel extends ConsumerStatefulWidget {
  const GameWheel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameWheelState();
}

class _GameWheelState extends ConsumerState<GameWheel> {
  // spiining wheel stream
  StreamController<int> spinController = StreamController<int>();

  @override
  void dispose() {
    spinController.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // wheel colors from provider
    final wheelColors = ref.watch(wheelColorsProvider);

    // check if the selected color is knowItColor
    final isKnowItColor = selectedColor == knowItColor;

    // wheel
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          // spin wheel
          GestureDetector(
            onTap: () async {
              // reset the color
              ref
                  .read(selectedSpinColorProvider.notifier)
                  .update((_) => knowItColor);

              // random fortune number
              int spinIndex = Fortune.randomInt(0, wheelColors.length);

              // update the spin controller
              setState(() {
                spinController.add(spinIndex);
              });

              // update the color based on the index
              // after FortuneWidget.kDefaultDuration
              await Future.delayed(FortuneWidget.kDefaultDuration, () {
                ref
                    .read(selectedSpinColorProvider.notifier)
                    .update((_) => wheelColors[spinIndex]);
              });
            },
            child: Material(
              shape: const CircleBorder(),
              elevation: 2,
              child: FortuneWheel(
                selected: spinController.stream,
                onAnimationEnd: () {
                  // show game tile
                  ref
                      .read(showGameTileProvider.notifier)
                      .update((state) => true);

                  //* get anther random [srhInfoProvider] item
                  ref
                      .read(srhInfoProvider.notifier)
                      .update((state) => getRandomSrhListItem());
                },
                onAnimationStart: () {
                  // hide game tile
                  ref
                      .read(showGameTileProvider.notifier)
                      .update((state) => false);
                },
                indicators: <FortuneIndicator>[
                  // indicator color
                  FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(
                      color: isKnowItColor ? knowItOrange : knowItColor,
                    ),
                  ),
                ],
                items: List.generate(
                  wheelColors.length,
                  (index) {
                    // wheel color
                    final Color sliceColor = wheelColors[index];

                    return FortuneItem(
                      child: const EmptySpace(),
                      style: FortuneItemStyle(
                        color: sliceColor,
                        borderColor: sliceColor,
                        borderWidth: 3,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          //  know it logo
          GestureDetector(
            onTap: () {
              // random fortune number
              int spinIndex = Fortune.randomInt(0, wheelColors.length);

              // update the spin controller
              setState(() {
                spinController.add(spinIndex);
              });

              // update the color based on the index
              ref
                  .read(selectedSpinColorProvider.notifier)
                  .update((_) => wheelColors[spinIndex]);
            },
            child: Center(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      knowItColor,
                      knowItTeal,
                    ],
                  ),
                  border: Border.all(
                    color: selectedColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    knowItMiniSvg,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
