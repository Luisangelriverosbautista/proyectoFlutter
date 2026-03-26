import 'package:flutter/material.dart';
import 'package:protecto_flutter/proyecto/menu_lateral.dart';

class ReportesVista extends StatefulWidget {
  const ReportesVista({super.key});

  @override
  State<ReportesVista> createState() => _ReportesVistaState();
}

class _ReportesVistaState extends State<ReportesVista> {
  String tipoFiltro = "todos";
  String periodoFiltro = "mes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const MenuLateral(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reportes y Estadísticas",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Visualiza el desempeño de tu biblioteca",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 20),
                  // Filtros
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: DropdownButton<String>(
                              value: tipoFiltro,
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: const [
                                DropdownMenuItem(
                                  value: "todos",
                                  child: Text("Todos los datos"),
                                ),
                                DropdownMenuItem(
                                  value: "usuarios",
                                  child: Text("Usuarios activos"),
                                ),
                                DropdownMenuItem(
                                  value: "libros",
                                  child: Text("Estado de libros"),
                                ),
                                DropdownMenuItem(
                                  value: "prestamos",
                                  child: Text("Prestamos"),
                                ),
                              ],
                              onChanged: (valor) {
                                if (valor != null) {
                                  setState(() => tipoFiltro = valor);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: DropdownButton<String>(
                              value: periodoFiltro,
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: const [
                                DropdownMenuItem(
                                  value: "semana",
                                  child: Text("Última semana"),
                                ),
                                DropdownMenuItem(
                                  value: "mes",
                                  child: Text("Último mes"),
                                ),
                                DropdownMenuItem(
                                  value: "trimestre",
                                  child: Text("Último trimestre"),
                                ),
                                DropdownMenuItem(
                                  value: "anio",
                                  child: Text("Último año"),
                                ),
                              ],
                              onChanged: (valor) {
                                if (valor != null) {
                                  setState(() => periodoFiltro = valor);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Tarjetas resumen principales
                  Row(
                    children: const [
                      Expanded(
                        child: _ResumenCard(
                          titulo: "Usuarios Totales",
                          valor: "245",
                          cambio: "+12%",
                          icono: Icons.people,
                          color: Color(0xFF5B7EFF),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _ResumenCard(
                          titulo: "Libros Disponibles",
                          valor: "1,240",
                          cambio: "+45",
                          icono: Icons.menu_book,
                          color: Color(0xFF50C878),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _ResumenCard(
                          titulo: "Préstamos Activos",
                          valor: "87",
                          cambio: "-5",
                          icono: Icons.assignment_returned,
                          color: Color(0xFFFFB74D),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _ResumenCard(
                          titulo: "Prestamos Vencidos",
                          valor: "12",
                          cambio: "-2",
                          icono: Icons.warning_rounded,
                          color: Color(0xFFFF6B6B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Gráfico de actividad y tabla
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Actividad por Día",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Gráfico de actividad",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Top Libros",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Expanded(
                                    child: ListView(
                                      children: const [
                                        _TopLibroItem(
                                          titulo: "Cien Años de Soledad",
                                          prestamos: 24,
                                        ),
                                        _TopLibroItem(
                                          titulo: "Amor en los Tiempos de Cólera",
                                          prestamos: 18,
                                        ),
                                        _TopLibroItem(
                                          titulo: "El Quijote",
                                          prestamos: 15,
                                        ),
                                        _TopLibroItem(
                                          titulo: "Don Juan Tenorio",
                                          prestamos: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResumenCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final String cambio;
  final IconData icono;
  final Color color;

  const _ResumenCard({
    required this.titulo,
    required this.valor,
    required this.cambio,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final esPositivo = !cambio.startsWith("-");

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icono, size: 18, color: color),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              cambio,
              style: TextStyle(
                fontSize: 12,
                color: esPositivo ? Colors.green.shade600 : Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopLibroItem extends StatelessWidget {
  final String titulo;
  final int prestamos;

  const _TopLibroItem({
    required this.titulo,
    required this.prestamos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              titulo,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF5B7EFF).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "$prestamos",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B7EFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
