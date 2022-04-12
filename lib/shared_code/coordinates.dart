import 'dart:math';

class Coordinates {
  final int row;
  final int column;

  Coordinates({required this.row, required this.column});

  @override
  bool operator ==(Object other) {
    return other is Coordinates && row == other.row && column == other.column;
  }

  static Coordinates random() {
    final _random = Random();
    const int min = 1;
    const int max = 9;
    final int row = min + _random.nextInt(max - min);
    final int column = min + _random.nextInt(max - min);

    return Coordinates(row: row, column: column);
  }
}

extension CoordinatesList on List<Coordinates> {
  bool contains(Coordinates other) {
    for (final coord in this) {
      if (coord == other) {
        return true;
      }
    }

    return false;
  }
}
