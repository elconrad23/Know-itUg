import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../knowit_exporter.dart';
import '../providers/exporter.dart';

class WinOverlay extends ConsumerStatefulWidget {
  const WinOverlay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WinOverlayState();
}

class _WinOverlayState extends ConsumerState<WinOverlay> {
  late ConfettiController _startConfettiController;

  @override
  void initState() {
    _startConfettiController =
        ConfettiController(duration: const Duration(seconds: 10));

    _startConfettiController.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // is the puzzle complete
    final isPuzzleComplete = ref.watch(puzzleCompleteProvider);

    // selected color
    final puzzleTileColor = ref.watch(selectedSpinColorProvider);

    // srh info item
    final srhIfoItem = ref.watch(srhInfoProvider);

    // TODO: Add celebration by Changind the puzzle to a solved puzzle
    return Visibility(
      visible: isPuzzleComplete,
      child: Scaffold(
        backgroundColor: knowItBlack.withOpacity(0.8),
        appBar: AppBar(
          backgroundColor: puzzleTileColor,
          elevation: 0,
          title: const Text(
            'Puzzle Complete 🎉',
            style: TextStyle(
              color: knowItWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: Container(
          color: puzzleTileColor,
          padding: padding8,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: knowItWhite,
              foregroundColor: puzzleTileColor,
              shape: const RoundedRectangleBorder(
                borderRadius: borderRadius45,
              ),
            ),
            onPressed: () {
              // complete the puzzle
              ref
                  .read(puzzleCompleteProvider.notifier)
                  .update((state) => false);
              
              // go to home screen
              context.go(homePath);
              // reset providers
              
            },
            icon: const Icon(CupertinoIcons.perspective),
            label: const Padding(
              padding: EdgeInsets.only(top: 13.0, bottom: 12.0),
              child: Text(
                "Next Level",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing8),
          child: Stack(
            children: [
              //
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Knowit logo
                  Center(
                    child: Padding(
                      padding: padding16,
                      child: SvgPicture.asset(
                        knowItMiniSvg,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  const VerticalSpace(of: spacing16),
                  // text
                  Expanded(
                    child: Container(
                      padding: padding16,
                      margin: margin8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: puzzleTileColor,
                        border: Border.all(
                          color: knowItWhite.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: spacing8,
                                vertical: spacing4,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: borderRadius4,
                                color: knowItWhite,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // game icon
                                  Icon(
                                    CupertinoIcons.star_circle_fill,
                                    color: puzzleTileColor,
                                    size: 15,
                                  ),

                                  const HorizontalSpace(of: spacing8),

                                  //
                                  Text(
                                    "Tip",
                                    style: TextStyle(
                                      color: puzzleTileColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const VerticalSpace(of: spacing8),

                          //
                          Center(
                            child: Text(
                              srhIfoItem.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: knowItWhite,
                              ),
                            ),
                          ),

                          //
                          const ThickHorizontalDivider(
                            dividerColor: knowItWhite,
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    srhIfoItem.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: knowItWhite,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalSpace(of: spacing8),

                          // continue button
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: knowItWhite,
                              backgroundColor: puzzleTileColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: borderRadius45,
                              ),
                            ),
                            onPressed: () {
                              // complete the puzzle
                              ref
                                  .read(puzzleCompleteProvider.notifier)
                                  .update((state) => false);
                            },
                            icon: const Icon(CupertinoIcons.goforward),
                            label: const Text(
                              "Play Again",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                    ),
                  ),
                  //
                ],
              ),

              // confetti
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: SizedBox(
              //     height: double.maxFinite,
              //     width: double.maxFinite,
              //     child: ConfettiWidget(
              //       confettiController: _startConfettiController,
              //       blastDirectionality: BlastDirectionality.explosive,
              //       shouldLoop: true,
              //       colors: const [
              //         Colors.green,
              //         Colors.blue,
              //         Colors.pink,
              //         Colors.orange,
              //         Colors.purple
              //       ], // manually specify the colors to be used
              //       // createParticlePath: starConfetti,
              //     ),
              //   ),
              // ),

              //
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _startConfettiController.dispose();
    super.dispose();
  }
}
