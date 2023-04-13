import '../../knowit_exporter.dart';
import 'logic/exporter.dart';
import 'numbers/number_puzzle.dart';
import 'providers/exporter.dart';

class KnowItPuzzle extends StatelessWidget {
  const KnowItPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return const KnowItPuzzleBody();
  }
}

class KnowItPuzzleBody extends ConsumerStatefulWidget {
  const KnowItPuzzleBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _KnowItPuzzleBodyState();
}

class _KnowItPuzzleBodyState extends ConsumerState<KnowItPuzzleBody> {
  late final PuzzleSolverClient _solverClient;
  final int _puzzleSize = 3;
  late final PuzzleData _initialPuzzleData;
  // final String _puzzleType = 'Photo';

  @override
  void initState() {
    _solverClient = PuzzleSolverClient(size: _puzzleSize);
    _initialPuzzleData = ref
        .read(puzzleNotifierProvider(_solverClient).notifier)
        .generateInitialPuzzle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(puzzleNotifierProvider(_solverClient),
        (previous, PuzzleState next) {
      if (next is PuzzleSolved) {
        ref.read(timerNotifierProvider.notifier).stopTimer();
      }
    });

    final currentPuzzleType = ref.watch(puzzleTypeNotifierProvider);

    final name = currentPuzzleType.name[0].toUpperCase() +
        currentPuzzleType.name.substring(1);

    return NumberPuzzle(
      solverClient: _solverClient,
      initialPuzzleData: _initialPuzzleData,
      puzzleSize: _puzzleSize,
      puzzleType: name,
    );

// TODO: change the puzzle based on the selected type
    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 400),
    //   child: currentPuzzleType == PuzzleType.normal
    //       ? SoloScreen(
    //           solverClient: _solverClient,
    //           initialPuzzleData: _initialPuzzleData,
    //           puzzleSize: _puzzleSize,
    //           puzzleType: name,
    //         )
    //       : currentPuzzleType == PuzzleType.photo
    //           ? PhotoScreen(
    //               solverClient: _solverClient,
    //               initialPuzzleData: _initialPuzzleData,
    //               puzzleSize: _puzzleSize,
    //               puzzleType: name,
    //             )
    //           : MultiplayerScreen(
    //               solverClient: _solverClient,
    //               initialPuzzleData: _initialPuzzleData,
    //               puzzleSize: _puzzleSize,
    //               puzzleType: name,
    //             ),
    // );
  }
}
