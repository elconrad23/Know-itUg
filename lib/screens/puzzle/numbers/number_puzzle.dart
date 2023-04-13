import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import '../providers/exporter.dart';
import 'num_mobile_puzzle.dart';

class NumberPuzzle extends ConsumerWidget {
  const NumberPuzzle({
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
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(puzzleNotifierProvider(solverClient),
        (previous, PuzzleState next) {
      if (next is PuzzleSolved) {
        ref.read(timerNotifierProvider.notifier).stopTimer();
      }
    });

    // return ResponsiveLayout(
    //   largeChild: SoloScreenLarge(
    //     solverClient: solverClient,
    //     puzzleType: puzzleType,
    //     initialPuzzleData: initialPuzzleData,
    //     puzzleSize: puzzleSize,
    //   ),
    //   mediumChild: SoloScreenMedium(
    //     solverClient: solverClient,
    //     initialPuzzleData: initialPuzzleData,
    //     puzzleSize: puzzleSize,
    //     puzzleType: puzzleType,
    //   ),
    //   smallChild: NumPuzzleMobile(
    //     solverClient: solverClient,
    //     initialPuzzleData: initialPuzzleData,
    //     puzzleSize: puzzleSize,
    //     puzzleType: puzzleType,
    //   ),
    // );
    // TODO make this responsive
    return NumPuzzleMobile(
      solverClient: solverClient,
      initialPuzzleData: initialPuzzleData,
      puzzleSize: puzzleSize,
      puzzleType: puzzleType,
    );
  }
}
