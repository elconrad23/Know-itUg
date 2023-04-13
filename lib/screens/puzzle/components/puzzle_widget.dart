import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import '../providers/providers.dart';
import 'puzzle_board.dart';

class PuzzleWidget extends StatelessWidget {
  const PuzzleWidget({
    Key? key,
    required PuzzleSolverClient solverClient,
    required this.boardSize,
    required this.eachBoxSize,
    required PuzzleData initialPuzzleData,
    required this.fontSize,
    this.images,
    this.borderRadius = 20,
    required int kInitialSpeed,
  })  : _solverClient = solverClient,
        _initialPuzzleData = initialPuzzleData,
        _kInitialSpeed = kInitialSpeed,
        super(key: key);

  final PuzzleSolverClient _solverClient;
  final double boardSize;
  final double eachBoxSize;
  final PuzzleData _initialPuzzleData;
  final double fontSize;
  final List<Image>? images;
  final int _kInitialSpeed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(puzzleNotifierProvider(_solverClient));

        return state.when(
          () => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: _initialPuzzleData,
            fontSize: fontSize,
            images: images,
            isEnabled: false,
            animationSpeed: _kInitialSpeed,
            borderRadius: borderRadius,
          ),
          initializing: () => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: _initialPuzzleData,
            fontSize: fontSize,
            images: images,
            isEnabled: false,
            animationSpeed: _kInitialSpeed,
            borderRadius: borderRadius,
            puzzleTip: 'Initializing...',
          ),
          scrambling: (puzzleData) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: puzzleData,
            fontSize: fontSize,
            images: images,
            isEnabled: false,
            animationSpeed: _kInitialSpeed,
            borderRadius: borderRadius,
            puzzleTip: 'Scrambling...',
          ),
          current: (puzzleData) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: puzzleData,
            fontSize: fontSize,
            images: images,
            borderRadius: borderRadius,
          ),
          computingSolution: (puzzleData) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: puzzleData,
            fontSize: fontSize,
            images: images,
            borderRadius: borderRadius,
            puzzleTip: 'Computing solution...',
          ),
          autoSolving: (puzzleData) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: puzzleData,
            fontSize: fontSize,
            images: images,
            borderRadius: borderRadius,
            puzzleTip: 'Auto solving...',
          ),
          solved: (puzzleData) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: puzzleData,
            fontSize: fontSize,
            images: images,
            isEnabled: false,
            borderRadius: borderRadius,
            puzzleTip: 'Puzzle Solved!',
          ),
          error: (_) => PuzzleBoard(
            solverClient: _solverClient,
            boardSize: boardSize,
            eachBoxSize: eachBoxSize,
            puzzleData: _initialPuzzleData,
            fontSize: fontSize,
            images: images,
            borderRadius: borderRadius,
            puzzleTip: 'Error!',
          ),
        );
      },
    );
  }
}
