import 'package:sudoku/shared_code/constants.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/shared_code/sudoku_grid.dart';

class Solver {
  final SudokuGrid input;
  late SudokuGrid result;

  bool _sudokuSolver(SudokuGrid grid) {
    for (var row = 0; row < Constants.gridSize; row++) {
      for (var col = 0; col < Constants.gridSize; col++) {
        if (grid.getValue(at: Coordinates(row: row, column: col)) != 0 &&
            !grid.isValidPlacement(grid[row][col], coordinates: Coordinates(row: row, column: col))) {
          return false;
        }
        if (grid[row][col] == 0) {
          for (var i = 1; i <= Constants.gridSize; i++) {
            if (grid.isValidPlacement(i, coordinates: Coordinates(row: row, column: col))) {
              grid[row][col] = i;

              if (_sudokuSolver(grid)) {
                return true;
              } else {
                grid[row][col] = 0;
              }
            }
          }

          return false;
        }
      }
    }

    return true;
  }

  Solver(this.input) {
    result = input;

    if (!_sudokuSolver(result)) {
      throw UnsolvableGrid();
    }
  }
}

class UnsolvableGrid implements Exception {}
