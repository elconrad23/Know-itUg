import '../../../knowit_exporter.dart';
import '../components/exporter.dart';
import '../components/puzzle_title.dart';
import '../components/win_overlay.dart';
import '../logic/exporter.dart';
import '../providers/exporter.dart';

class NumPuzzleMobile extends ConsumerStatefulWidget {
  const NumPuzzleMobile({
    required this.solverClient,
    required this.initialPuzzleData,
    required this.puzzleSize,
    required this.puzzleType,
    Key? key,
  }) : super(key: key);

  final PuzzleSolverClient solverClient;
  final PuzzleData initialPuzzleData;
  final int puzzleSize;
  final String puzzleType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SoloScreenLargeState();
}

class _SoloScreenLargeState extends ConsumerState<NumPuzzleMobile> {
  late final PuzzleSolverClient _solverClient;
  late final int _puzzleSize;
  late final PuzzleData _initialPuzzleData;
  late final String _puzzleType;
  bool _isStartPressed = false;

  @override
  void initState() {
    _solverClient = widget.solverClient;
    _puzzleSize = widget.puzzleSize;
    _initialPuzzleData = widget.initialPuzzleData;
    _puzzleType = widget.puzzleType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(puzzleNotifierProvider(_solverClient),
        (previous, PuzzleState next) {
      if (next is PuzzleSolved) {
        // complete the puzzle
        ref.read(puzzleCompleteProvider.notifier).update((state) => true);
      }
      if (next is PuzzleInitializing) {
        setState(() {
          _isStartPressed = true;
        });
      }
    });

    // if we are on mobile
    final isMobile = KnowItResponsive.isMobile(context) ||
        KnowItResponsive.isSmallMobile(context) ||
        KnowItResponsive.isMediumMobile(context);

    double fontSize = isMobile ? 30 : 48.0;
    double boardSize = isMobile ? 250 : 300.0;

    var spacing = 3;
    var eachBoxSize = (boardSize / _puzzleSize) - (spacing * (_puzzleSize - 1));

    // puzzle tile color
    final puzzleTileColor = ref.watch(selectedSpinColorProvider);

    // is the puzzle complete
    final isPuzzleComplete = ref.watch(puzzleCompleteProvider);

    // srh info item
    final srhIfoItem = ref.watch(srhInfoProvider);

    return Scaffold(
      backgroundColor: puzzleTileColor,
      appBar: (isPuzzleComplete || _isStartPressed)
          ? null
          : AppBar(
              backgroundColor: puzzleTileColor,
              elevation: 0,
              title: const Text(
                'Puzzle Challenge',
                style: TextStyle(
                  color: knowItWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: BackButton(
                onPressed: () {
                  // reset timer
                  ref.read(timerNotifierProvider.notifier).stopTimer();

                  // go to home too
                  context.go(homePath);
                },
                color: knowItWhite,
              ),
            ),
      bottomNavigationBar: (isPuzzleComplete || _isStartPressed)
          ? null
          : Container(
              color: puzzleTileColor,
              padding: padding8,
              child: PuzzleControlButton(
                solverClient: _solverClient,
                initialPuzzleData: _initialPuzzleData,
              ),
            ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing8),
            child: CustomScrollView(
              slivers: [
                const SliverVerticalSpace(of: spacing16),

                SliverToBoxAdapter(
                  child: PuzzleTitle(puzzleTileColor: puzzleTileColor),
                ),
                const SliverVerticalSpace(of: spacing16),

                // number of moves
                SliverPinnedHeader(
                  child: Container(
                    color: puzzleTileColor,
                    child: Column(
                      children: [
                        NumberOfMoves(
                          solverClient: _solverClient,
                          fontSize: 15,
                        ),
                        const VerticalSpace(of: spacing8),
                        Center(
                          child: PuzzleWidget(
                            solverClient: _solverClient,
                            boardSize: boardSize,
                            eachBoxSize: eachBoxSize,
                            initialPuzzleData: _initialPuzzleData,
                            fontSize: fontSize,
                            kInitialSpeed: kInitialSpeed,
                            borderRadius: 16,
                          ),
                        ),
                        const VerticalSpace(of: spacing8),
                        const PuzzleTimer(fontSize: 20),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const VerticalSpace(of: spacing32),
                      const ThickHorizontalDivider(dividerColor: knowItWhite),
                      Container(
                        padding: padding8,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius6,
                          color: knowItWhite.withOpacity(.8),
                          border: Border.all(
                            color: knowItWhite,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            //
                            Text(
                              "Complete Puzzle to Read More about\n${srhIfoItem.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: puzzleTileColor,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const VerticalSpace(of: spacing8),
                            Text(
                              srhIfoItem.description,
                              maxLines: 3,
                              style: TextStyle(
                                color: puzzleTileColor.withOpacity(.6),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpace(of: spacing8),
                    ],
                  ),
                ),

                //
              ],
            ),
          ),
          //
          CountDownOverlay(
            isStartPressed: _isStartPressed,
            onFinish: () {
              ref.read(timerNotifierProvider.notifier).startTimer();
              setState(() {
                _isStartPressed = false;
              });
            },
            initialSpeed: kInitialSpeed,
          ),

          // win overlay
          const WinOverlay(),
        ],
      ),
    );
  }
}
