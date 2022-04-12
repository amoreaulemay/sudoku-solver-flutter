import 'package:sudoku/generator/shuffler.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/shared_code/constants.dart';

class SudokuGrid {
  List<List<int>> _grid = SudokuGrid.generateNewGrid();

  List<int> operator [](int row) => _grid[row];
  void operator []=(int row, List<int> newValue) => _grid[row] = newValue;

  SudokuGrid([List<List<int>>? newGrid]) {
    if (newGrid != null) {
      _grid = newGrid;
    }
  }

  @override
  String toString() {
    String returnStr = "";
    for (var row = 0; row < _grid.length; row++) {
      if (row % 3 == 0 && row != 0) {
        returnStr += "===========\n";
      }

      for (var col = 0; col < Constants.gridSize; col++) {
        if (col % 3 == 0 && col != 0) {
          returnStr += "|";
        }
      }

      returnStr += "\n";
    }

    return returnStr;
  }

  /// Resets the grid to its initial state.
  void clear() {
    _grid.clear();
    _grid = SudokuGrid.generateNewGrid();
  }

  /// Returns the value at the specified coordinates.
  int getValue({required Coordinates at}) {
    return _grid[at.row][at.column];
  }

  /// Inserts a value at a specified coordinate.
  void insert(int newValue, {required Coordinates at}) {
    _grid[at.row][at.column] = newValue;
  }

  /// 2D rotation of the matrix.
  void rotate() {
    var newGrid = SudokuGrid.generateNewGrid();

    for (var i = 0; i < Constants.gridSize; i++) {
      for (var j = 0; j < Constants.gridSize; j++) {
        newGrid[j][i] = _grid[i][j];
      }
    }

    _grid = newGrid;
  }

  /// Generates a new SudokuGrid and fills it with 0s.
  static List<List<int>> generateNewGrid() {
    List<List<int>> grid = List.generate(Constants.gridSize, (_) => List.generate(Constants.gridSize, (_) => 0));

    return grid;
  }

  // Helper Methods
  /// Checks if a number is in the specified row.
  /// Time complexity of O(n).
  bool _isInRow(int num, {required Coordinates coordinates}) {
    for (var col = 0; col < Constants.gridSize; col++) {
      if (_grid[coordinates.row][col] == num && col != coordinates.column) return true;
    }

    return false;
  }

  /// Checks if a number is in the specified column.
  /// Time complexity of O(n).
  bool _isInCol(int num, {required Coordinates coordinates}) {
    for (var row = 0; row < Constants.gridSize; row++) {
      if (_grid[row][coordinates.column] == num && row != coordinates.row) return true;
    }

    return false;
  }

  /// Checks if a number is in a box.
  /// Time complexity of O(n^2).
  bool _isInBox(int num, {required Coordinates coordinates}) {
    final int localBoxRow = coordinates.row - coordinates.row % 3;
    final int localBoxCol = coordinates.column - coordinates.column % 3;

    for (var row = localBoxRow; row < (localBoxRow + 3); row++) {
      for (var col = localBoxCol; col < (localBoxCol + 3); col++) {
        if (_grid[row][col] == num && !(Coordinates(row: row, column: col) == coordinates)) return true;
      }
    }

    return false;
  }

  /// Checks if a number can be validly placed in a Sudoku grid.
  bool isValidPlacement(int num, {required Coordinates coordinates}) {
    return !_isInRow(num, coordinates: coordinates) && !_isInCol(num, coordinates: coordinates) && !_isInBox(num, coordinates: coordinates);
  }

  // Generator Methods
  void _rotatingGenerator({int rotations = 3}) {
    _grid[0] = [for (var i = 1; i <= Constants.gridSize; i++) i];
    _grid[0].shuffle();

    for (var i = 1; i < Constants.gridSize; i++) {
      final shiftDistance = (i == 3 || i == 6) ? 1 : 3;
      final n = shiftDistance % Constants.gridSize;
      _grid[i] = _grid[i].sublist(n)..addAll(_grid[i].sublist(0, n));
    }

    for (var _ = 0; _ < rotations; _++) {
      Shuffler.shuffle(this);
    }
  }

  static SudokuGrid generate() {
    SudokuGrid newGrid = SudokuGrid();

    newGrid._rotatingGenerator();

    return newGrid;
  }
}
