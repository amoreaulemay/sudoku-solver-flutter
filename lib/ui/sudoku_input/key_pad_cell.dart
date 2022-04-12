import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/states/sudoku_change_notifier.dart';

class KeyPadCell extends StatelessWidget {
  final int number;

  const KeyPadCell({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 50,
      child: TextButton(
        onPressed: () {
          final String message = (number == 0) ? 'Use to clear squares' : 'Fill all squares with value $number';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 1),
            ),
          );
          Provider.of<SudokuChangeNotifier>(context, listen: false).setActiveNumber(number);
        },
        child: Text(
          '$number',
        ),
      ),
    );
  }
}
