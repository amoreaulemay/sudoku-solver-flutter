import 'dart:math';

enum LevelDifficulty {
  easy,
  medium,
  difficult,
}

class LevelSettings {
  static const int easy = 72;
  static const int medium = 48;
  static const int difficult = 24;

  /// Returns a random number in a range.
  static int _rndNum(int min, int max) {
    final rnd = Random();
    return min + rnd.nextInt(max - min);
  }

  /// Returns the amount of integer that should remain in the grid after the "purge".
  /// This is randomly picked in predetermined ranges.
  static int gridPurgeObjective({LevelDifficulty withDifficulty = LevelDifficulty.difficult}) {
    switch (withDifficulty) {
      case LevelDifficulty.easy:
        return easy;
      case LevelDifficulty.medium:
        return _rndNum(medium, easy - 1);
      case LevelDifficulty.difficult:
        return _rndNum(difficult, medium - 1);
    }
  }
}
