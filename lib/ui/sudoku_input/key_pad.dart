import 'package:flutter/material.dart';
import 'package:sudoku/ui/sudoku_input/key_pad_cell.dart';

class KeyPad extends StatelessWidget {
  final int numRows = 2;
  final int numCols = 5;

  const KeyPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: _getTableRows(),
    );
  }

  List<TableRow> _getTableRows() {
    return List.generate(numRows, (int rowNumber) {
      return TableRow(
        children: _getRow(rowNumber),
      );
    });
  }

  List<Widget> _getRow(int rowNumber) {
    return List.generate(numCols, (int colNumber) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: KeyPadCell(
          number: numCols * rowNumber + colNumber,
        ),
      );
    });
  }
}
