import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import '../providers/exporter.dart';

class PuzzleBoard extends ConsumerWidget {
  const PuzzleBoard({
    Key? key,
    required this.solverClient,
    required this.boardSize,
    required this.eachBoxSize,
    required this.puzzleData,
    required this.fontSize,
    this.puzzleTip = 'Tap \n"Start Game"\n to Play',
    this.images,
    this.animationSpeed = 300,
    this.isEnabled = true,
    this.borderRadius = 20,
  }) : super(key: key);

  final PuzzleSolverClient solverClient;
  final double boardSize;
  final double eachBoxSize;
  final double fontSize;
  final PuzzleData puzzleData;
  final bool isEnabled;
  final int animationSpeed;
  final List<Image>? images;
  final double borderRadius;

  // puzzle tip
  final String puzzleTip;

  // final int _animationSpeedInMilliseconds = 300;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // puzzle tile color
    final puzzleTileColor = ref.watch(selectedSpinColorProvider);

    //
    return SizedBox(
      height: boardSize,
      width: boardSize,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: knowItWhite.withOpacity(0.8),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Stack(
              children: [
                for (int i = 0; i < puzzleData.offsetMap.length; i++)
                  puzzleData.offsetMap.entries.toList()[i].key != 0
                      ? AnimatedAlign(
                          alignment:
                              puzzleData.offsetMap.entries.toList()[i].value,
                          duration: Duration(
                            milliseconds: animationSpeed,
                          ),
                          curve: Curves.easeOut,
                          child: MouseRegion(
                            cursor: !isEnabled
                                ? SystemMouseCursors.forbidden
                                : SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: !isEnabled
                                  ? null
                                  : () => ref
                                      .read(puzzleNotifierProvider(solverClient)
                                          .notifier)
                                      .onClick(
                                        index: puzzleData.board1D.indexOf(
                                            puzzleData.offsetMap.entries
                                                .toList()[i]
                                                .key),
                                        prev: puzzleData,
                                      ),
                              child: images == null
                                  ? Card(
                                      elevation: isEnabled ? 4 : 0,
                                      color: puzzleTileColor
                                          .withOpacity(isEnabled ? 1 : 0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(borderRadius),
                                      ),
                                      child: SizedBox(
                                        height: eachBoxSize,
                                        width: eachBoxSize,
                                        child: Center(
                                          child: Text(
                                            puzzleData.offsetMap.entries
                                                .toList()[i]
                                                .key
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: knowItWhite.withOpacity(
                                                  isEnabled ? 1 : 0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: eachBoxSize,
                                      width: eachBoxSize,
                                      child: Opacity(
                                        opacity: isEnabled ? 1 : 0.5,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                          child: images![int.parse(puzzleData
                                                  .offsetMap.entries
                                                  .toList()[i]
                                                  .key
                                                  .toString()) -
                                              1],
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        )
                      : const EmptySpace(),
              ],
            ),
          ),
          if (!isEnabled) ...[
            Container(
              decoration: BoxDecoration(
                color: knowItBlack.withOpacity(0.5),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Text(
                  puzzleTip,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: knowItWhite,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    knowItWhite.withOpacity(0.8),
                    knowItWhite.withOpacity(0.6),
                    knowItWhite.withOpacity(.4),
                    knowItWhite.withOpacity(.2),
                  ],
                  durations: [5000, 4000, 4500, 5500],
                  // distance from top of screen to bottom of screen
                  heightPercentages: [0.7, 0.7, 0.7, 0.7],
                ),
                backgroundColor: knowItTransparent,
                size: Size(boardSize, boardSize),
                waveAmplitude: 0,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
