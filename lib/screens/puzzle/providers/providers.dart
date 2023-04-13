import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import 'notifiers/notifiers.dart';
import 'puzzle_state.dart';

final puzzleNotifierProvider = StateNotifierProvider.family<PuzzleNotifier,
    PuzzleState, PuzzleSolverClient>(
  (ref, solverClient) => PuzzleNotifier(solverClient),
);

final timerNotifierProvider = StateNotifierProvider<TimerNotifier, String>(
  ((ref) => TimerNotifier()),
);

final puzzleTypeNotifierProvider =
    StateNotifierProvider<PuzzleTypeNotifier, PuzzleType>(
  (ref) => PuzzleTypeNotifier(),
);

// is puzzle complete
final puzzleCompleteProvider = StateProvider<bool>((ref) => false);
