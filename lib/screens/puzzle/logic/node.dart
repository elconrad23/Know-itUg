
import 'puzzle_solver.dart';

class Node {
  final List<List<int>> board;
  final Node? previous;
  final int heuristic;
  final int depth;

  Node({
    required this.board,
    required this.previous,
    required this.heuristic,
    required this.depth,
  });

  Node getNodeState() {
    return Node(
      board: board,
      previous: previous,
      heuristic: heuristic,
      depth: depth,
    );
  }

  List<Node> generateChildren({required int size}) {
    late int x;
    late int y;

    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (board[i][j] == 0) {
          x = i;
          y = j;
        }
      }
    }

    // print('x: $x, y: $y');

    List<List<int>> valList = [
      [x, y - 1],
      [x, y + 1],
      [x - 1, y],
      [x + 1, y]
    ];

    List<Node> children = [];

    for (var child in valList) {
      if ((child[0] >= 0) &&
          (child[0] < size) &&
          (child[1] >= 0) &&
          (child[1] < size)) {
        List<List<int>> childBoard = [];
        // ERROR (FIXED): This board is getting modified
        // print('------------------------------');
        // print('BOARD: $board');
        // print('------------------------------');
        for (var row in board) {
          childBoard.add([...row]);
        }
        // print('***********************************');
        // print('CHILD: $childBoard');
        // print('***********************************');
        childBoard[x][y] = childBoard[child[0]][child[1]];
        childBoard[child[0]][child[1]] = 0;
        final solverClient = PuzzleSolverClient(size: size);

        final childNode = Node(
          board: childBoard,
          previous: this,
          heuristic: solverClient.nodeManhattan(childBoard),
          depth: depth + 1,
        );
        children.add(childNode);
      }
    }
    return children;
  }
}
