import 'dart:math';

import 'package:sudoku/generator/level_settings.dart';
import 'package:sudoku/shared_code/constants.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/shared_code/sudoku_grid.dart';

class SudokuLevel {
  late final SudokuGrid grid;
  final SudokuGrid solution;

  static SudokuGrid makeLevel({LevelDifficulty withDifficulty = LevelDifficulty.difficult}) {
    SudokuGrid grid = SudokuGrid();
    final n = pow(Constants.gridSize, 2).toInt() - LevelSettings.gridPurgeObjective(withDifficulty: withDifficulty);

    List<Coordinates> chosenCoord = [];

    for (var _ = 0; _ < n; _++) {
      Coordinates tempCoord = Coordinates.random();
      while (chosenCoord.contains(tempCoord)) {
        tempCoord = Coordinates.random();
      }

      chosenCoord.add(tempCoord);
      grid.insert(0, at: tempCoord);
    }

    return grid;
  }

  static SudokuLevel newLevel() {
    return SudokuLevel(SudokuGrid.generate());
  }

  SudokuLevel(this.solution, {LevelDifficulty difficulty = LevelDifficulty.difficult}) {
    grid = SudokuLevel.makeLevel(withDifficulty: difficulty);
  }
}
