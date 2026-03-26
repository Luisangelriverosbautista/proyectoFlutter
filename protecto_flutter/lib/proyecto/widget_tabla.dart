import 'package:flutter/material.dart';

class TablaGenerica extends StatelessWidget {
  final List<String> columnas;
  final List<Map<String, String>> datos;
  final int? seleccion;
  final Function(int) onSeleccion;
  final String? emptyMessage;

  const TablaGenerica({
    super.key,
    required this.columnas,
    required this.datos,
    required this.seleccion,
    required this.onSeleccion,
    this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (datos.isEmpty) {
      return Card(
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.inbox_outlined, size: 60, color: Colors.grey.shade500),
              const SizedBox(height: 10),
              Text(
                emptyMessage ?? "No hay registros disponibles",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(const Color(0xFFE9EDF3)),
          dataRowMinHeight: 50,
          dataRowMaxHeight: 60,
          columns: columnas
              .map(
                (c) => DataColumn(
                  label: Text(
                    c.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              )
              .toList(),
          rows: datos.asMap().entries.map((entry) {
            int index = entry.key;
            var item = entry.value;

            return DataRow(
              color: MaterialStateProperty.resolveWith((states) {
                if (seleccion == index) {
                  return const Color(0xFFDCEBFA);
                }
                return index.isEven ? Colors.white : const Color(0xFFF8FAFD);
              }),
              selected: seleccion == index,
              onSelectChanged: (_) => onSeleccion(index),
              cells: columnas.map((col) {
                return DataCell(Text(item[col] ?? ""));
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}