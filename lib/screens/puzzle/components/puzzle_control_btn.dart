import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import '../providers/providers.dart';

class PuzzleControlButton extends StatelessWidget {
  const PuzzleControlButton({
    Key? key,
    required PuzzleSolverClient solverClient,
    required PuzzleData initialPuzzleData,
  })  : _solverClient = solverClient,
        _initialPuzzleData = initialPuzzleData,
        super(key: key);

  final PuzzleSolverClient _solverClient;
  final PuzzleData _initialPuzzleData;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(puzzleNotifierProvider(_solverClient));

        return state.when(
          () => PuzzleControlButtonBody(
            text: 'Start Game',
            icon: CupertinoIcons.hand_draw,
            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: _initialPuzzleData,
                ),
          ),
          initializing: () => const PuzzleControlButtonBody(
            text: 'Shuffling...',
            icon: CupertinoIcons.hourglass,
            onTap: null,
          ),
          scrambling: (_) => const PuzzleControlButtonBody(
            text: 'Shuffling...',
            icon: CupertinoIcons.hourglass,
            onTap: null,
          ),
          current: (puzzleData) => PuzzleControlButtonBody(
            text: 'Restart',
            icon: CupertinoIcons.arrow_2_circlepath_circle_fill,
            onTap: () {
              ref.read(timerNotifierProvider.notifier).stopTimer();
              ref
                  .read(puzzleNotifierProvider(_solverClient).notifier)
                  .restartPuzzle();
            },
          ),
          computingSolution: (puzzleData) => const PuzzleControlButtonBody(
            text: 'Processing...',
            icon: CupertinoIcons.hourglass,
            onTap: null,
          ),
          autoSolving: (puzzleData) => const PuzzleControlButtonBody(
            text: 'Solving...',
            icon: CupertinoIcons.helm,
            onTap: null,
          ),
          solved: (puzzleData) => PuzzleControlButtonBody(
            text: 'Play Again', // 'Play Another or Continue',
            icon: CupertinoIcons.goforward,

            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: puzzleData,
                ),
          ),
          error: (_) => PuzzleControlButtonBody(
            text: 'Start Game',
            icon: CupertinoIcons.hand_draw,
            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: _initialPuzzleData,
                ),
          ),
        );
      },
    );
  }
}

class PuzzleControlButtonBody extends ConsumerWidget {
  const PuzzleControlButtonBody({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;

  // icon
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // puzzle tile color
    final puzzleTileColor = ref.watch(selectedSpinColorProvider);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: knowItWhite,
        foregroundColor: puzzleTileColor,
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius45,
        ),
      ),
      onPressed: onTap,
      icon: Icon(icon),
      label: Padding(
        padding: const EdgeInsets.only(top: 13.0, bottom: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
