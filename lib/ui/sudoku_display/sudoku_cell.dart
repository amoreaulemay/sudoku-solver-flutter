import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/states/sudoku_change_notifier.dart';

class SudokuCell extends StatelessWidget {
  final Coordinates coordinates;

  const SudokuCell({Key? key, required this.coordinates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      enableFeedback: true,
      onTap: () {
        debugPrint('Setting (${coordinates.row}, ${coordinates.column}) to active_number.');
        Provider.of<SudokuChangeNotifier>(context, listen: false).setBoardCell(at: coordinates);
      },
      child: SizedBox(
        width: 30,
        height: 38,
        child: Center(
          child: Selector<SudokuChangeNotifier, String>(
            builder: (context, value, child) {
              return Text(value);
            },
            selector: (context, sudokuChangeNotifier) => sudokuChangeNotifier.getBoardCell(at: coordinates),
          ),
        ),
      ),
    );
  }
}
