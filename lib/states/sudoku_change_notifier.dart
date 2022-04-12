import 'package:flutter/material.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/shared_code/sudoku_grid.dart';
import 'package:sudoku/solver/solver.dart';

class SudokuChangeNotifier extends ChangeNotifier {
  SudokuGrid grid = SudokuGrid();
  int activeNumber = 0;
  bool gridUnsolvable = false;

  String getBoardCell({required Coordinates at}) {
    return (grid.getValue(at: at) == 0) ? '' : grid.getValue(at: at).toString();
  }

  String? get errorMessage {
    if (gridUnsolvable) {
      return "The grid is unsolvable!";
    } else {
      return null;
    }
  }

  void setBoardCell({required Coordinates at}) {
    grid.insert(activeNumber, at: at);
    notifyListeners();
  }

  void setActiveNumber(int newValue) {
    activeNumber = newValue;
  }

  void solveBoard() {
    try {
      final Solver solution = Solver(grid);
      debugPrint(solution.result.toString());
      grid = solution.result;
      notifyListeners();
    } on UnsolvableGrid {
      gridUnsolvable = true;
      debugPrint('Grid cannot be solved!');
      notifyListeners();
    }
  }

  void resetBoard() {
    grid.clear();
    activeNumber = 0;
    gridUnsolvable = false;
    notifyListeners();
  }
}
