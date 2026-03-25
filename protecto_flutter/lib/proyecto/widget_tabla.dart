import 'package:flutter/material.dart';

class TablaGenerica extends StatelessWidget {
  final List<String> columnas;
  final List<Map<String, String>> datos;
  final int? seleccion;
  final Function(int) onSeleccion;

  const TablaGenerica({
    super.key,
    required this.columnas,
    required this.datos,
    required this.seleccion,
    required this.onSeleccion,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor:
          MaterialStateProperty.all(Colors.grey[200]),
      columns: columnas
          .map((c) => DataColumn(label: Text(c.toUpperCase())))
          .toList(),
      rows: datos.asMap().entries.map((entry) {
        int index = entry.key;
        var item = entry.value;

        return DataRow(
          selected: seleccion == index,
          onSelectChanged: (_) => onSeleccion(index),
          cells: columnas.map((col) {
            return DataCell(Text(item[col] ?? ""));
          }).toList(),
        );
      }).toList(),
    );
  }
}