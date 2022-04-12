import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/states/sudoku_change_notifier.dart';

class SudokuMessageLauncher extends StatelessWidget {
  final String? error;

  const SudokuMessageLauncher({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => _displaySnackBar(context, error: error!));
    }

    return Container();
  }

  void _displaySnackBar(BuildContext context, {required String error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        duration: const Duration(seconds: 2),
        onVisible: () => Provider.of<SudokuChangeNotifier>(context, listen: false).resetErrorMessage(),
      ),
    );
  }
}
