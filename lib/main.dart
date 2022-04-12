import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/states/sudoku_change_notifier.dart';
import 'package:sudoku/ui/views/sudoku_solver_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sudoku Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sudoku Solver'),
        ),
        body: ChangeNotifierProvider<SudokuChangeNotifier>(
          create: (context) => SudokuChangeNotifier(),
          child: const SafeArea(
            child: SudokuSolverView(),
          ),
        ),
      ),
    );
  }
}
