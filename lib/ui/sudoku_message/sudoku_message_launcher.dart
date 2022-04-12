import 'package:flutter/material.dart';

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
      ),
    );
  }
}
