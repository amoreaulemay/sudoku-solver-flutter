import 'package:sudoku/shared_code/constants.dart';
import 'package:sudoku/shared_code/sudoku_grid.dart';

class Shuffler {
  /// Shuffles the rows in subgroups of boxes.
  /// Time complexity of O(n^2)
  static void _shuffleRows({required SudokuGrid on}) {
    for (var i = 0; i < (Constants.gridSize / 3); i++) {
      final index = i * 3;
      List<List<int>> subGroup = [];

      for (var j = 0; j < (Constants.gridSize / 3); i++) {
        subGroup.add(on[index + j]);
      }

      subGroup.shuffle();

      for (var j = 0; j < subGroup.length; j++) {
        on[index + j] = subGroup[j];
      }

      subGroup.clear();
    }
  }

  /// Shuffles the rows in subgroups of boxes.
  /// Time complexity of O(n^2)
  static void _shuffleColumns({required SudokuGrid on}) {
    on.rotate();

    _shuffleRows(on: on);

    on.rotate();
  }

  static void shuffle(SudokuGrid grid) {
    _shuffleColumns(on: grid);
    _shuffleRows(on: grid);
  }
}
