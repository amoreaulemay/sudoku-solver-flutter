import 'package:flutter/material.dart';
import 'package:sudoku/shared_code/constants.dart';
import 'package:sudoku/shared_code/coordinates.dart';
import 'package:sudoku/ui/sudoku_display/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {
  const SudokuBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        left: BorderSide(width: 3.0, color: Colors.black),
        top: BorderSide(width: 3.0, color: Colors.black),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(Constants.gridSize, (int rowNb) {
      return TableRow(
        children: _getRow(rowNb),
      );
    });
  }

  List<Widget> _getRow(int rowNb) {
    return List.generate(Constants.gridSize, (int colNb) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: (colNb % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: (rowNb % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: SudokuCell(
          coordinates: Coordinates(row: rowNb, column: colNb),
        ),
      );
    });
  }
}
