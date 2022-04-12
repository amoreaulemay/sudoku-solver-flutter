import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/states/sudoku_change_notifier.dart';
import 'package:sudoku/ui/sudoku_display/sudoku_board.dart';
import 'package:sudoku/ui/sudoku_input/key_pad.dart';
import 'package:sudoku/ui/sudoku_message/sudoku_message_launcher.dart';

class SudokuSolverView extends StatelessWidget {
  const SudokuSolverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SudokuBoard(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: KeyPad(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint('Solving Board');
                Provider.of<SudokuChangeNotifier>(context, listen: false).solveBoard();
              },
              child: const Text('Solve'),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Resetting Board');
                Provider.of<SudokuChangeNotifier>(context, listen: false).resetBoard();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
        Selector<SudokuChangeNotifier, String?>(
          builder: (context, value, child) {
            return SudokuMessageLauncher(
              error: value,
            );
          },
          selector: (context, sudokuChangeNotifier) => sudokuChangeNotifier.errorMessage,
        ),
      ],
    );
  }
}
